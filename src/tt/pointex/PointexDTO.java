package tt.pointex;

public class PointexDTO {
	
	private int idx;		//상품 인덱스 넘버
	private String pname;	//상품 이름
	private int pprice;		//소요포인트
	private int pnum;		//재고
	private String picpath;	//경로
	private String pcode;	//코드or색상
	private String etc1;	//기타1
	private String etc2;	//기타2

	//생성자
	public PointexDTO() {
		super();
	}
	//인자생성자
	public PointexDTO(int idx, String pname, int pprice, int pnum, String picpath, String pcode, String etc1,
			String etc2) {
		super();
		this.idx = idx;
		this.pname = pname;
		this.pprice = pprice;
		this.pnum = pnum;
		this.picpath = picpath;
		this.pcode = pcode;
		this.etc1 = etc1;
		this.etc2 = etc2;
	}
	//게터 세터
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPicpath() {
		return picpath;
	}
	public void setPicpath(String picpath) {
		this.picpath = picpath;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getEtc1() {
		return etc1;
	}
	public void setEtc1(String etc1) {
		this.etc1 = etc1;
	}
	public String getEtc2() {
		return etc2;
	}
	public void setEtc2(String etc2) {
		this.etc2 = etc2;
	}
}
