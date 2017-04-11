package tt.question;

import java.sql.*;

public class QuestionDTO {

	private int idx; // 게시물번호
	private String subject; // 게시물 제목
	private String content; // 게시물 내용
	private String type; // 게시물 상품 판매유형(신고, 질문, 관리자작성)
	private String writer; // 게시물 작성자
	private Date writedate; // 게시물 날짜
	private int readnum; // 게시물 조회수
	private int lev;
	private int ref;
	private int sunbun;
	private String etc1; // 기타1
	private String etc2; // 기타2
	
	public QuestionDTO() {
		// TODO Auto-generated constructor stub
	}

	public QuestionDTO(int idx, String subject, String content, String type, String writer, Date writedate, int readnum,
			int lev, int ref, int sunbun, String etc1, String etc2) {
		super();
		this.idx = idx;
		this.subject = subject;
		this.content = content;
		this.type = type;
		this.writer = writer;
		this.writedate = writedate;
		this.readnum = readnum;
		this.lev = lev;
		this.ref = ref;
		this.sunbun = sunbun;
		this.etc1 = etc1;
		this.etc2 = etc2;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
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
