package tt.member;

import java.sql.*;

public class MemberDTO {
	private int idx;
	private String name;
	private String id;
	private String pwd;
	private String addr;
	private String email;
	private String tel;
	private Date joindate;	//가입날짜
	private String list;
	private String grade;
	private int black;
	private int point;
	
	public MemberDTO() {
		System.out.println("MemberDTO 생성됨");
	}
		
	public MemberDTO(int idx, String name, String id,String pwd, String addr, String email, String tel, Date joindate,
			String list, String grade, int black, int point) {
		super();
		this.idx = idx;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.addr = addr;
		this.email = email;
		this.tel = tel;
		this.joindate = joindate;
		this.list = list;
		this.grade = grade;
		this.black = black;
		this.point = point;
	}
	
	

	public int getPoint() {
		return point;
	}

	public void setBlack(int black) {
		this.black = black;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}

	public int getBlack() {
		return black;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public String getList() {
		return list;
	}

	public void setList(String list) {
		this.list = list;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
}
