package tt.product;

import java.sql.*;

public class ProductDTO {

	private int idx; // 게시물번호
	private String subject; // 게시물 제목
	private String content; // 게시물 내용
	private int price; // 게시물 가격
	private String type; // 게시물 상품 판매유형(판매, 구매, 교환)
	private String sort; // 게시물 상품 종류
	private Date writedate; // 게시물 날짜
	private int readnum; // 게시물 조회수
	private int lev;
	private int ref;
	private int sunbun;
	private String etc1; // 기타1
	private String etc2; // 기타2
	private String writer;

	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductDTO(int idx, String subject, String content, int price, String type, String sort, Date writedate,
			int readnum, int lev, int ref, int sunbun, String etc1, String etc2, String writer) {

		this.idx = idx;
		this.subject = subject;
		this.content = content;
		this.price = price;
		this.type = type;
		this.sort = sort;
		this.writedate = writedate;
		this.readnum = readnum;
		this.lev = lev;
		this.ref = ref;
		this.sunbun = sunbun;
		this.etc1 = etc1;
		this.etc2 = etc2;
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
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
	
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
}