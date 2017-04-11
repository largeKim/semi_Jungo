package tt.advertise;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdvertiseDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public AdvertiseDAO() {
		super();
	}
	
	/*제휴,광고 메세지 보내는 메서드*/
	public int insertAdv(AdvertiseDTO adto){
		try{
			conn = tt.db.ttDB.getConn();
//			추가 수정 부분 170401 토 시작
			ps = conn.prepareStatement("insert into tt_advertise values(tt_advertise_idx.nextval,?,?,?,?,?,?,?,sysdate,?,?,0)");
//			추가 수정 부분 170401 토 끝
			ps.setString(1, adto.getAtype());
			ps.setString(2, adto.getBelong());
			ps.setString(3, adto.getYourname());
			ps.setString(4, adto.getYourtel());
			ps.setString(5, adto.getYourmail());
			ps.setString(6, adto.getYoursub());
			ps.setString(7, adto.getYourmsg());
			
//			추가 수정 부분 170401 토 시작
			ps.setString(8, adto.getImgpath());
			ps.setString(9, adto.getUrl());
//			추가 수정 부분 170401 토 끝
			
			int count = ps.executeUpdate();
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	
	/*제휴,광고 목록보기 메서드*/
	public ArrayList<AdvertiseDTO> advList(int cp, int ls){
		try{
			conn = tt.db.ttDB.getConn();
			ps = conn.prepareStatement("select * from(select rownum as rnum,a.* from (select * from tt_advertise)a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+" order by rnum desc");
			rs = ps.executeQuery();
			ArrayList<AdvertiseDTO> arr = new ArrayList<AdvertiseDTO>();
			while(rs.next()){
				int idx = rs.getInt("idx");
				String atype = rs.getString("atype");
				String belong = rs.getString("belong");
				String yourname = rs.getString("yourname");
				String yourtel = rs.getString("yourtel");
				String yourmail = rs.getString("yourmail");
				String yoursub = rs.getString("yoursub");
				String yourmsg = rs.getString("yourmsg");
				int rnum = rs.getInt("rnum");
				
//				추가 수정 부분 170401 토 시작
				String imgpath = rs.getString("imgpath");
				String url = rs.getString("url");
				int choice = rs.getInt("choice");
				
				AdvertiseDTO adto = new AdvertiseDTO(idx, atype, belong, yourname, yourtel, yourmail, yoursub, yourmsg, rnum);
				
				adto.setImgpath(imgpath);
				adto.setUrl(url);
				adto.setChoice(choice);
				
//				추가 수정 부분 170401 토 끝
				
				arr.add(adto);
			}
			return arr;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	/*제휴,광고 내용 확인하는 메서드*/
	public AdvertiseDTO advContent(int idx){
		try{
			conn = tt.db.ttDB.getConn();
			ps = conn.prepareStatement("select * from tt_advertise where idx=?");
			ps.setInt(1, idx);
			AdvertiseDTO adto = null;
			rs = ps.executeQuery();
			if(rs.next()){
				String atype = rs.getString("atype");
				String belong = rs.getString("belong");
				String yourname = rs.getString("yourname");
				String yourtel = rs.getString("yourtel");
				String yourmail = rs.getString("yourmail");
				String yoursub = rs.getString("yoursub");
				String yourmsg = rs.getString("yourmsg");
				java.sql.Date writedate = rs.getDate("writedate");
				
//				추가 수정 부분 170401 토 시작
				String imgpath = rs.getString("imgpath");
				String url = rs.getString("url");
				int choice = rs.getInt("choice");
				
				adto = new AdvertiseDTO(idx, atype, belong, yourname, yourtel, yourmail, yoursub, yourmsg, writedate);
				adto.setImgpath(imgpath);
				adto.setUrl(url);
				adto.setChoice(choice);
				
//				추가 수정 부분 170401 토 끝
			}
			return adto;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	/*삭제 관련 메서드*/
	public int advDelete(int idx){
		try{
			conn = tt.db.ttDB.getConn();
			ps = conn.prepareStatement("delete from tt_advertise where idx=?");
			ps.setInt(1, idx);
			
			int count = ps.executeUpdate();
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)ps.close();
			}catch(Exception e2){}
		}
	}
	/*총 게시물 수 관련 메서드*/
	public int getTotalCnt(){
		try{
			conn = tt.db.ttDB.getConn();
			ps = conn.prepareStatement("select count(*) from tt_advertise");
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count==0?1:count;
		}catch(Exception e){
			e.printStackTrace();
			return 1;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}

//	추가 수정 부분 170401 토 시작
	public int advChoice(int idx){
		try{
			conn = tt.db.ttDB.getConn();
			String sql = "update tt_advertise set choice=0 where choice=1";
			ps = conn.prepareStatement(sql);
			
			int count = ps.executeUpdate();
			
			String sql2 = "update tt_advertise set choice=1 where idx=?";
			ps = conn.prepareStatement(sql2);
			
			ps.setInt(1, idx);
			
			count += ps.executeUpdate();
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}
	
	public int advCancel(int idx){
		try{
			conn = tt.db.ttDB.getConn();
			
			String sql = "update tt_advertise set choice=0 where idx=?";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, idx);
			
			int count = ps.executeUpdate();
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public AdvertiseDTO advList(){
		try{
			conn = tt.db.ttDB.getConn();
			
			String sql = "select imgpath,url from tt_advertise where choice=1";
			ps = conn.prepareStatement(sql);
			
			AdvertiseDTO adto = new AdvertiseDTO();
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				String imgpath = rs.getString(1);
				String url = rs.getString(2);
				adto.setImgpath(imgpath);
				adto.setUrl(url);
			}
			
			
			return adto;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
//	추가 수정 부분 170401 토 끝
	
}
