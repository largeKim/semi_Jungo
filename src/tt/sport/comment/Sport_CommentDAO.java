package tt.sport.comment;

import java.sql.*;
import java.util.*;

import tt.sport.SportDTO;

public class Sport_CommentDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public Sport_CommentDAO(){
		
	}
	
	/**댓글 수 구하기 메소드*/
	public int getCommNum(int sportidx){
		try{
			conn = tt.db.ttDB.getConn();
			
			String sql = "SELECT COUNT(idx) FROM tt_sport_comment WHERE sportidx="+sportidx;
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				return rs.getInt(1);
			}
			return -1;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/**댓글삭제 관련 메소드*/
	public int delComm(int idx){
		try{
			conn = tt.db.ttDB.getConn();
			
			String sql = "DELETE FROM tt_sport_comment WHERE idx="+idx;
			ps = conn.prepareStatement(sql);
			
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
	/**ref값 구하기 관련 메소드*/ 
	public int getMaxRef(int sportidx) {
		try {
			String sql = "SELECT MAX(ref) FROM tt_sport_comment WHERE sportidx="+sportidx;
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
	
	/**댓글쓰기 관련 메소드*/
	public int addComm(Sport_CommentDTO sdto){
		try{
			conn = tt.db.ttDB.getConn();
			int max = getMaxRef(sdto.getSportidx());
			String sql = "INSERT INTO tt_sport_comment VALUES(tt_sport_comment_idx.nextval,?,?,?,sysdate,0,?,0)";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, sdto.getSportidx());
			ps.setString(2, sdto.getWriter());
			ps.setString(3, sdto.getRepcont());
			ps.setInt(4, max+1);
			
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
	
	/**순번수정 관련 메소드*/
	public void updateSun(int ref, int sun){
		try{
			String sql = "UPDATE tt_sport_comment SET sunbun=sunbun+1 WHERE ref=? and sunbun>=?";
			
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
	public int sportCommReWrite(Sport_CommentDTO dto){
		try{
			conn = tt.db.ttDB.getConn();
			
			updateSun(dto.getRef(),dto.getSunbun()+1);
			
			String sql = "INSERT INTO tt_sport_comment VALUES(tt_sport_comment_idx.nextval,?,?,?,SYSDATE,?,?,?)";
			
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, dto.getSportidx());
			ps.setString(2, dto.getWriter());
			ps.setString(3, dto.getRepcont());
			ps.setInt(4, dto.getLev()+1);
			ps.setInt(5, dto.getRef());
			ps.setInt(6, dto.getSunbun()+1);
			
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
	
	/**댓글보기 관련 메소드*/
	public ArrayList<Sport_CommentDTO> scList(int sportidx_){
		try{
			conn = tt.db.ttDB.getConn();
			
			String sql = "SELECT * FROM tt_sport_comment WHERE sportidx="+sportidx_;
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<Sport_CommentDTO> scomment = new ArrayList<Sport_CommentDTO>();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				int sportidx = rs.getInt("sportidx");
				String writer = rs.getString("writer");
				String repcont = rs.getString("repcont");
				java.sql.Date writedate = rs.getDate("writedate");
				int lev = rs.getInt("lev");
				int ref = rs.getInt("ref");
				int sunbun = rs.getInt("sunbun");
				
				Sport_CommentDTO dto = new Sport_CommentDTO(idx, sportidx, writer, repcont, writedate, lev, ref, sunbun);
				
				scomment.add(dto);
			}
			
			return scomment;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/** 총 게시물 수 관련 메소드 */
	public int getTotalCnt(int idx) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "SELECT COUNT(*) FROM tt_sport_comment WHERE sportidx=?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
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
}
