package tt.sport.comment;

import java.sql.Date;

public class Sport_CommentDTO {
	private int idx;
	private int sportidx;
	private String writer;
	private String repcont;
	private java.sql.Date writedate;
	private int lev;
	private int ref;
	private int sunbun;
	
	public Sport_CommentDTO(){
		
	}

	public Sport_CommentDTO(int idx, int sportidx, String writer, String repcont, Date writedate, int lev, int ref,
			int sunbun) {
		super();
		this.idx = idx;
		this.sportidx = sportidx;
		this.writer = writer;
		this.repcont = repcont;
		this.writedate = writedate;
		this.lev = lev;
		this.ref = ref;
		this.sunbun = sunbun;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getSportidx() {
		return sportidx;
	}

	public void setSportidx(int sportidx) {
		this.sportidx = sportidx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRepcont() {
		return repcont;
	}

	public void setRepcont(String repcont) {
		this.repcont = repcont;
	}

	public java.sql.Date getWritedate() {
		return writedate;
	}

	public void setWritedate(java.sql.Date writedate) {
		this.writedate = writedate;
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
}
