package tt.advertise;

import java.sql.Date;

public class AdvertiseDTO {

	private int idx;//인덱스 넘버
	private String atype;//글의 종류(광고 또는 제휴)
	private String belong;//소속
	private String yourname;//이름
	private String yourtel;//연락처
	private String yourmail;//이메일
	private String yoursub;//제목
	private String yourmsg;//메세지
	private Date writedate;//작성일
	private int rnum;//idx를 대체할 숫자
	private int ref;
	private int lev;
	private int sunbun;
//	추가 수정 부분 170401 토 시작
	private String imgpath;
	private String url;
	private int choice;
//	추가 수정 부분 170401 토 끝
	//생성자
	public AdvertiseDTO() {
		super();
	}
	//세컨 생성자 or 오버로딩
	
	public AdvertiseDTO(int idx, String atype, String belong, String yourname, String yourtel, String yourmail,
			String yoursub, String yourmsg, Date writedate) {
		super();
		this.idx = idx;
		this.atype = atype;
		this.belong = belong;
		this.yourname = yourname;
		this.yourtel = yourtel;
		this.yourmail = yourmail;
		this.yoursub = yoursub;
		this.yourmsg = yourmsg;
		this.writedate = writedate;
	}
	
	public AdvertiseDTO(int idx, String atype, String belong, String yourname, String yourtel, String yourmail,
			String yoursub, String yourmsg, int rnum, int ref, int lev, int sunbun) {
		super();
		this.idx = idx;
		this.atype = atype;
		this.belong = belong;
		this.yourname = yourname;
		this.yourtel = yourtel;
		this.yourmail = yourmail;
		this.yoursub = yoursub;
		this.yourmsg = yourmsg;
		this.rnum = rnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
	}

	public AdvertiseDTO(int idx, String atype, String belong, String yourname, String yourtel, String yourmail,
			String yoursub, String yourmsg, int rnum) {
		super();
		this.idx = idx;
		this.atype = atype;
		this.belong = belong;
		this.yourname = yourname;
		this.yourtel = yourtel;
		this.yourmail = yourmail;
		this.yoursub = yoursub;
		this.yourmsg = yourmsg;
		this.rnum = rnum;
	}
	public AdvertiseDTO(int idx, String atype, String belong, String yourname, String yourtel, String yourmail,
			String yoursub, String yourmsg) {
		super();
		this.idx = idx;
		this.atype = atype;
		this.belong = belong;
		this.yourname = yourname;
		this.yourtel = yourtel;
		this.yourmail = yourmail;
		this.yoursub = yoursub;
		this.yourmsg = yourmsg;
	}
	
	//게터&세터
	
	public int getIdx() {
		return idx;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}

	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getAtype() {
		return atype;
	}
	public void setAtype(String atype) {
		this.atype = atype;
	}
	public String getBelong() {
		return belong;
	}
	public void setBelong(String belong) {
		this.belong = belong;
	}
	public String getYourname() {
		return yourname;
	}
	public void setYourname(String yourname) {
		this.yourname = yourname;
	}
	public String getYourtel() {
		return yourtel;
	}
	public void setYourtel(String yourtel) {
		this.yourtel = yourtel;
	}
	public String getYourmail() {
		return yourmail;
	}
	public void setYourmail(String yourmail) {
		this.yourmail = yourmail;
	}
	public String getYoursub() {
		return yoursub;
	}
	public void setYoursub(String yoursub) {
		this.yoursub = yoursub;
	}
	public String getYourmsg() {
		return yourmsg;
	}
	public void setYourmsg(String yourmsg) {
		this.yourmsg = yourmsg;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	
//	추가 수정 부분 170401 토 시작
	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public int getChoice() {
		return choice;
	}

	public void setChoice(int choice) {
		this.choice = choice;
	}
//	추가 수정 부분 170401 토 끝
	
}
