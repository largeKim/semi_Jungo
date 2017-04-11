package tt.notice;

import java.sql.Date;

public class NoticeDTO {
	
	private int idx;
	private String type;
	private String subject;
	private String writer;
	private Date writedate;
	private int readnum;
	private int ref;
	private int lev;
	private int sunbun;
	private int rnum;//idx를 대체할 숫자
	private String pwd;
	private String content;
	private String name;//관리자 이름
	
	

	public NoticeDTO(int idx, String type, String subject, String writer, Date writedate, int readnum, int ref, int lev,
			int sunbun, int rnum, String pwd, String content, String name) {
		super();
		this.idx = idx;
		this.type = type;
		this.subject = subject;
		this.writer = writer;
		this.writedate = writedate;
		this.readnum = readnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
		this.rnum = rnum;
		this.pwd = pwd;
		this.content = content;
		this.name = name;
	}


	public NoticeDTO(int idx, String type, String subject, String writer, Date writedate, int readnum, int ref, int lev,
			int sunbun, String pwd, String content, String name) {
		super();
		this.idx = idx;
		this.type = type;
		this.subject = subject;
		this.writer = writer;
		this.writedate = writedate;
		this.readnum = readnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
		this.pwd = pwd;
		this.content = content;
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public NoticeDTO() {
		super();
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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
	
	
}
