package tt.sport;

import java.sql.*;
import java.util.*;

import tt.product.ProductDTO;

public class SportDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public SportDAO() {

	}
	/**게시글 수정 관련 메소드*/
	public int updateContent(SportDTO sdto){
		try{
			conn = tt.db.ttDB.getConn();
			
			String sql = "UPDATE tt_sport SET subject=?,content=? WHERE idx=?";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, sdto.getSubject());
			ps.setString(2, sdto.getContent());
			ps.setInt(3, sdto.getIdx());
			
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null){
					ps.close();
				}
				if(conn!=null){
					conn.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/** 게시글 댓글 삭제 관련 메소드 */
	public int deleteCtntComment(int sportidx) {
		try {
			String sql = "DELETE FROM tt_sport_comment WHERE sportidx=" + sportidx;
			ps = conn.prepareStatement(sql);

			int count = ps.executeUpdate();
			System.out.println(count);
			return count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/** 게시글 삭제관련 메소드 */
	public int deleteContent(int idx) {
		try {
			conn = tt.db.ttDB.getConn();
			int dcc = deleteCtntComment(idx);
			
			if(dcc<0){
				return -1;
			}
			
			String sql = "DELETE FROM tt_sport WHERE idx="+idx;
			ps = conn.prepareStatement(sql);
			
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/** 게시글 추천 관련 메소드 */
	public int recomContent(int idx) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "UPDATE tt_sport SET recom=recom+1 where idx=" + idx;
			ps = conn.prepareStatement(sql);

			int count = ps.executeUpdate();

			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/** 인덱스화면 best목록구성 관련 메소드 */
	public ArrayList<SportDTO> sportBestList(int cp, int ls) {
		try {
			conn = tt.db.ttDB.getConn();
			
			String sql = "SELECT * FROM (SELECT rownum as rnum,a.* from (select * from tt_sport ORDER BY recom DESC, ref DESC, sunbun ASC)a)b WHERE rnum>=("+cp+"-1)*"+ls+"+1 AND rnum<="+cp+"*"+ls;
			
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	/** 목록구성 관련 메소드 */
	public ArrayList<SportDTO> sportList(String sort_list, int cp, int ls, String orderby) {
		try {
			conn = tt.db.ttDB.getConn();
			String sql = "";
			if(orderby.equals("all")){
				sql = "SELECT * FROM (SELECT rownum as rnum,a.* from (select * from tt_sport where sort='"+sort_list+"' ORDER BY ref DESC, sunbun ASC)a)b WHERE rnum>=("+cp+"-1)*"+ls+"+1 AND rnum<="+cp+"*"+ls;	
			}else if(orderby.equals("best")){
				sql = "SELECT * FROM (SELECT rownum as rnum,a.* from (select * from tt_sport where sort='"+sort_list+"' ORDER BY recom DESC, ref DESC, sunbun ASC)a)b WHERE rnum>=("+cp+"-1)*"+ls+"+1 AND rnum<="+cp+"*"+ls;
			}else if(orderby.equals("hot")){
				sql = "SELECT * FROM (SELECT rownum as rnum,a.* from (select * from tt_sport where sort='"+sort_list+"' ORDER BY readnum DESC, ref DESC, sunbun ASC)a)b WHERE rnum>=("+cp+"-1)*"+ls+"+1 AND rnum<="+cp+"*"+ls;
			}
			
			
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	/**목록구성 관련 메소드(검색)*/
	   public ArrayList<SportDTO> sportList2(String sort_list, int cp, int ls, String skey, String svalue) {
	      try {
	         conn = tt.db.ttDB.getConn();
	         String sql = "";
	         if(skey.equals("subcon")){   //제목 + 내용 검색
	            sql = "select * from (select rownum as rnum, b.* from (select * from (select * from tt_sport where sort='"+sort_list+"')a where subject like '%"+svalue+"%' or content like '%"+svalue+"%' order by idx desc)b)c where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+"";
	         }else{
	            sql = "select * from (select rownum as rnum, b.* from (select * from (select * from tt_sport where sort='"+sort_list+"')a where "+skey+" like '%"+svalue+"%' order by idx desc)b)c where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+"";
	         }
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
	            
	            SportDTO dto = new SportDTO(idx, subject, content, sort, writedate, readnum, recom, lev, ref, sunbun, picpath, writer);
	            
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
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }

	   }
	
	/** 총 게시물 수 관련 메소드 */
	public int getTotalCnt(String sort) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "SELECT COUNT(*) FROM tt_sport WHERE sort='"+sort+"'";

			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			rs.next();

			int count = rs.getInt(1);
			return count == 0 ? 1 : count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**ref값 구하기 관련 메소드*/ 
	public int getMaxRef() {
		try {
			String sql = "SELECT MAX(ref) FROM tt_sport";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int max = 0;
			
			if (rs.next()) {
				max = rs.getInt(1);
			}
			
			return max;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/** sport 게시판 글 올리기 */
	public int sportAdd(SportDTO dto) {
		try {
			conn = tt.db.ttDB.getConn();
			int max = getMaxRef();
			String sql = "INSERT INTO tt_sport VALUES(tt_sport_idx.nextval,?,?,?,sysdate,0,0,0,?,0,?,?)";

			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getSubject());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getSort());
			ps.setInt(4, max+1);
			ps.setString(5, dto.getPicpath());
			ps.setString(6, dto.getWriter());
			
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	/**순번수정 관련 메소드*/
	public void updateSun(int ref, int sun){
		try{
			String sql = "UPDATE tt_sport SET sunbun=sunbun+1 WHERE ref=? and sunbun>=?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sun);
			
			int count = ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(ps!=null)ps.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/**답변쓰기 관련 메소드*/
	public int sportReWrite(SportDTO dto){
		try{
			conn = tt.db.ttDB.getConn();
			
			updateSun(dto.getRef(),dto.getSunbun()+1);
			
			String sql = "INSERT INTO tt_sport VALUES(tt_sport_idx.nextval,?,?,?,SYSDATE,0,0,?,?,?,?,?)";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getSubject());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getSort());
			ps.setInt(4, dto.getLev()+1);
			ps.setInt(5, dto.getRef());
			ps.setInt(6, dto.getSunbun()+1);
			ps.setString(7, dto.getPicpath());
			ps.setString(8, dto.getWriter());
			
			int count = ps.executeUpdate();
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)ps.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/** 조회수 관련 메소드 */
	public void upReadnum(int idx) {
		try {

			String sql = "UPDATE tt_sport SET readnum=readnum+1 WHERE idx=" + idx;

			ps = conn.prepareStatement(sql);

			int count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public SportDTO sportContent(int idx_sc) {
		try {
			conn = tt.db.ttDB.getConn();

			upReadnum(idx_sc);

			String sql = "SELECT * FROM tt_sport WHERE idx='" + idx_sc + "'";

			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			if (rs.next()) {
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

				SportDTO sdto = new SportDTO(idx, subject, content, sort, writedate, readnum, recom, lev, ref, sunbun,
						picpath, writer);

				return sdto;
			} else {
				return null;
			}

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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
