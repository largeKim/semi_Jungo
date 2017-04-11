package tt.wf;

import java.io.File;

/** DTO의 용도로도 사용하는 DAO클래스
 *  사진이미지 최대 10MB
 *  */
public class WebFolderDAO {

	private String users_home;// 사용자들 공통 경로
	private String user;// 사용자의 계정을 저장
	private String cr_path;// 현재 위치
	private int totalSize, usedSize, freeSize;
	// 총용량, 사용용량, 남은용량
	
	
	
	public WebFolderDAO() {
		totalSize = 1024 * 1024 * 10; // 10MB
	}

	public String getUsers_home() {
		return users_home;
	}

	public void setUsers_home(String users_home) {
		this.users_home = users_home;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getCr_path() {
		return cr_path;
	}

	public void setCr_path(String cr_path) {
		this.cr_path = cr_path;
	}

	public int getTotalSize() {
		return totalSize;
	}

	public void setTotalsize(int totalSize) {
		this.totalSize = totalSize;
	}

	public int getUsedSize() {
		return usedSize;
	}

	public void setUsesize(int usedSize) {
		this.usedSize = usedSize;
	}

	public int getFreeSize() {
		return freeSize;
	}

	public void setFreeSize(int freeSize) {
		this.freeSize = freeSize;
	}

	public void isExists() {
		File f = new File(users_home + "/" + user);
		if (!f.exists()) {
			System.out.println(f.exists());
			f.mkdirs();
		}
		usedSize = 0;
		setUsedSize(f);
		freeSize = totalSize - usedSize; 
	}
	
	/** 실제 용량을 구하는 메서드 */
	public void setUsedSize(File f) {
		File files[] = f.listFiles();
		for (int i = 0; i < files.length; i++) {
			if(files[i].isFile()){
				usedSize += files[i].length();
			}else{
				setUsedSize(files[i]);
			}
		}
	}
	
	/**폴더를 만드는 메서드*/
	public void makeDir(String name){
		File f = new File(this.users_home+"/"+this.cr_path+"/"+name);
		f.mkdirs();
	}
	
	/**삭제*/
	public void delDir(File f){
		
		File files[] = f .listFiles();
		
		for(int i=0; i<files.length; i++){
			if(files[i].isFile()){
				files[i].delete();
			}else if(files[i].isDirectory()){
				delDir(files[i]);
				
			}
		}
		
		f.delete();
	}
	
}
