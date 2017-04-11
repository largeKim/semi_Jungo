package tt.search;

import tt.member.*;
import tt.notice.NoticeDTO;
import tt.product.*;
import tt.sport.*;

import tt.complain.*;
import tt.question.*;
import tt.faq.*;

import java.sql.*;
import java.util.*;

public class SearchDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private ProductDTO pdto;

	public SearchDAO() {
		System.out.println("SearchDAO 생성 !");
	}

	public ArrayList<ProductDTO> searchProduct(String sv) {
		try {
			conn = tt.db.ttDB.getConn();
			
			String sql = "select * from tt_product where subject like '%"+sv+"%' or content like '%"+sv+"%' or writer like '%"+sv+"%'";
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			ArrayList<ProductDTO> pdal = new ArrayList<ProductDTO>();
			while(rs.next()){
				int idx = rs.getInt("idx");
				String name = rs.getString("subject");
				String content = rs.getString("content");
				int price = rs.getInt("price");
				String type = rs.getString("type");
				String sort = rs.getString("sort");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int lev = rs.getInt("lev");
				int ref = rs.getInt("ref");
				int sunbun = rs.getInt("sunbun");
				String etc1 = rs.getString("etc1");
				String etc2 = rs.getString("etc2");
				String writer = rs.getString("writer");
				
				ProductDTO dto = new ProductDTO(idx, name, content, price, type, sort, writedate, readnum, lev, ref,
						sunbun, etc1, etc2, writer);
				pdal.add(dto);
			}
			
			return pdal;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	/* 추가 수정부분 170329 수 시작 */
	public ArrayList<SportDTO> searchSport(String sv) {
		try {
			conn = tt.db.ttDB.getConn();
			
			String sql = "select * from tt_sport where subject like '%"+sv+"%' or content like '%"+sv+"%'";
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			ArrayList<SportDTO> sport = new ArrayList<SportDTO>();
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String sort = rs.getString("sort");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int recom = rs.getInt("recom");
				int lev = rs.getInt("lev");
				int ref = rs.getInt("ref");
				int sunbun = rs.getInt("sunbun");
				String picpath = rs.getString("picpath");
				String writer = rs.getString("writer");

				SportDTO dto = new SportDTO(idx, subject, content, sort, writedate, readnum, recom, lev, ref, sunbun,
						picpath, writer);

				sport.add(dto);
			}
			
			return sport;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	/* 추가 수정부분 170329 수 끝 */
	
	public ArrayList<ComplainDTO> searchComplain(String sv) {
		try {
			conn = tt.db.ttDB.getConn();
			
			String sql="select * from tt_complain where subject like '%"+sv+"%' or content like '%"+sv+"%' or type like '%"+sv+"%' or writer like '%"+sv+"%'";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<ComplainDTO> arr = new ArrayList<ComplainDTO>();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String type = rs.getString("type");
				String writer = rs.getString("writer");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int lev = rs.getInt("lev");
				int ref = rs.getInt("ref");
				int sunbun = rs.getInt("sunbun");
				String etc1 = rs.getString("etc1");
				String etc2 = rs.getString("etc2");

				
				ComplainDTO dto = new ComplainDTO(idx, subject, content, type, writer, writedate, readnum, lev, ref,
						sunbun, etc1, etc2);
				arr.add(dto);
			}
			
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public ArrayList<QuestionDTO> searchQuestion(String sv) {
		try {
			conn = tt.db.ttDB.getConn();
			String sql = "select * from tt_question where subject like '%"+sv+"%' or content like '%"+sv+"%' or type like '%"+sv+"%' or writer like '%"+sv+"%'";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<QuestionDTO> arr = new ArrayList<QuestionDTO>();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String type = rs.getString("type");
				String writer = rs.getString("writer");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int lev = rs.getInt("lev");
				int ref = rs.getInt("ref");
				int sunbun = rs.getInt("sunbun");
				String etc1 = rs.getString("etc1");
				String etc2 = rs.getString("etc2");

				
				QuestionDTO dto = new QuestionDTO(idx, subject, content, type, writer, writedate, readnum, lev, ref,
						sunbun, etc1, etc2);
				arr.add(dto);
			}
			
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public ArrayList<FaqDTO> searchFaq(String sv) {
		try {
			conn = tt.db.ttDB.getConn();
			
			String sql="select * from tt_faq where subject like '%"+sv+"%' or content like '%"+sv+"%' or type like '%"+sv+"%' or writer like '%"+sv+"%'";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<FaqDTO> arr = new ArrayList<FaqDTO>();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String type = rs.getString("type");
				String writer = rs.getString("writer");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int lev = rs.getInt("lev");
				int ref = rs.getInt("ref");
				int sunbun = rs.getInt("sunbun");
				String etc1 = rs.getString("etc1");
				String etc2 = rs.getString("etc2");

				
				FaqDTO dto = new FaqDTO(idx, subject, content, type, writer, writedate, readnum, lev, ref,
						sunbun, etc1, etc2);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public ArrayList<NoticeDTO> searchNotice(String sv) {
		try {
			conn = tt.db.ttDB.getConn();
			String sql = "select * from tt_notice where type like '%"+sv+"%' or subject like '%"+sv+"%' or content like '%"+sv+"%' or type like '%"+sv+"%' or writer like '%"+sv+"%'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<NoticeDTO> arr = new ArrayList<NoticeDTO>();
			while(rs.next()){
				int idx = rs.getInt("idx");
				String type = rs.getString("type");
				String subject = rs.getString("subject");
				String writer = rs.getString("writer");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				int rnum = rs.getInt("rnum");
				String pwd = rs.getString("pwd");
				String content = rs.getString("content");
				String name = rs.getString("name");
				
				NoticeDTO ndto = new NoticeDTO(idx, type, subject, writer, writedate, readnum, ref, lev, sunbun, rnum, pwd, content, name);
				arr.add(ndto);
			}
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}
