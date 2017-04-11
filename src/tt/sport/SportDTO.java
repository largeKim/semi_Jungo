package tt.sport;

import java.sql.*;

public class SportDTO {
	
	private int idx; // idx
	private String subject; // 글제목
	private String content; // 글 내용
	private String sort; // 게시판 종류
	private java.sql.Date writedate; // 글 쓴 날짜
	private int readnum; // 조회수
	private int recom; // 추천수
	private int lev; // 답글관련
	private int ref; // 답글관련
	private int sunbun; // 답글관련
	private String picpath; // 사진올리면 경로
	private String writer; // 글쓴 사람
	
	public SportDTO(){
		
	}

	public SportDTO(int idx, String subject, String content, String sort, Date writedate, int readnum, int recom,
			int lev, int ref, int sunbun, String picpath, String writer) {
		super();
		this.idx = idx;
		this.subject = subject;
		this.content = content;
		this.sort = sort;
		this.writedate = writedate;
		this.readnum = readnum;
		this.recom = recom;
		this.lev = lev;
		this.ref = ref;
		this.sunbun = sunbun;
		this.picpath = picpath;
		this.writer = writer;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public java.sql.Date getWritedate() {
		return writedate;
	}

	public void setWritedate(java.sql.Date writedate) {
		this.writedate = writedate;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public int getRecom() {
		return recom;
	}

	public void setRecom(int recom) {
		this.recom = recom;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}

	public String getPicpath() {
		return picpath;
	}

	public void setPicpath(String picpath) {
		this.picpath = picpath;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
	
}
