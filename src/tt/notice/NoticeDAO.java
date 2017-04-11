package tt.notice;

import java.sql.*;
import java.util.ArrayList;
import tt.member.*;
import com.sun.glass.ui.GestureSupport;

import tt.complain.ComplainDTO;

public class NoticeDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public NoticeDAO() {
		
	}
	/**ref값 구하기 관련 메서드*/
	public int getMaxRef(){
		try{
			ps = conn.prepareStatement("select max(ref) from tt_notice");
			rs = ps.executeQuery();
			int max = 0;
			if(rs.next()){
				max = rs.getInt(1);
			}
			return max;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			}catch(Exception e2){}
		}
	}
		
	/**글쓰기 관련 메서드*/
	public int noticeWrite(NoticeDTO ndto){
		try{
			conn = tt.db.ttDB.getConn();
			int max = getMaxRef();
			ps = conn.prepareStatement("insert into tt_notice values(tt_notice_idx.nextval,?,?,?,sysdate,0,?,0,0,0,?,?)");
			ps.setString(1, ndto.getType());
			ps.setString(2, ndto.getSubject());
			ps.setString(3, ndto.getWriter());
			ps.setInt(4, max+1);
			ps.setString(5, ndto.getContent());
			ps.setString(6, ndto.getName());
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	
	/**순번 수정 관련메서드*/
	public void updateSun(int ref, int sun){
		try{
			ps = conn.prepareStatement("update tt_notice set sunbun=sunbun+1 where ref=? and sunbun>=?");
			ps.setInt(1, ref);
			ps.setInt(2, sun);
			int count = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(ps!=null)ps.close();
			}catch(Exception e2){}
		}
	}
	
	/**답변쓰기 관련 메서드*/
	public int noticeReWrite(NoticeDTO ndto){
		try{
			conn = tt.db.ttDB.getConn();
			updateSun(ndto.getRef(), ndto.getSunbun()+1);
			ps = conn.prepareStatement("insert into tt_notice values(tt_notice_idx.nextval,?,?,?,sysdate,0,?,?,?,?,?,?");
			ps.setString(1, ndto.getType());
			ps.setString(2, ndto.getSubject());
			ps.setString(3, ndto.getWriter());
			ps.setInt(4, ndto.getRef());
			ps.setInt(5, ndto.getLev());
			ps.setInt(6, ndto.getSunbun()+1);
			ps.setString(7, ndto.getPwd());
			ps.setString(8, ndto.getContent());
			ps.setString(9, ndto.getName());
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	
	/**notice 목록관련 메서드*/
	   public ArrayList<NoticeDTO> noticeList(int cp, int ls){
	      try{
	         conn=tt.db.ttDB.getConn();
	         ps = conn.prepareStatement("select * from(select rownum as rnum,a.* from (select * from tt_notice order by ref DESC, sunbun asc)a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+" order by ref desc");
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
	      }catch(Exception e){
	         e.printStackTrace();
	         return null;
	      }finally{
	         try{
	            if(rs!=null)rs.close();
	            if(ps!=null)ps.close();
	            if(conn!=null)conn.close();
	         }catch(Exception e2){}
	      }
	   }
	/** 조회수 관련 메소드 */
	public void upReadnum(int idx) {
		try {
			String sql = "UPDATE tt_notice SET readnum=readnum+1 WHERE idx=" + idx;

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
	
	/**본문 관련 메서드*/
	public NoticeDTO noticeContent(int idx){
		try{
			conn = tt.db.ttDB.getConn();
			upReadnum(idx);
			ps = conn.prepareStatement("select * from tt_notice where idx=?");
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			NoticeDTO ndto = null;
			if(rs.next()){
				String type = rs.getString("type");
				String subject = rs.getString("subject");
				String writer = rs.getString("writer");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				String pwd = rs.getString("pwd");
				String content = rs.getString("content");
				String name = rs.getString("name");

				
				ndto = new NoticeDTO(idx, type, subject, writer, writedate, readnum, ref, lev, sunbun, pwd, content, name);
				
			}
			return ndto;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	/**삭제 관련 메서드*/
	public int noticeDelete(int idx){
		try{
			conn = tt.db.ttDB.getConn();
			ps = conn.prepareStatement("delete from tt_notice where idx=?");
			ps.setInt(1, idx);
			
			int count = ps.executeUpdate();
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)ps.close();
			}catch(Exception e2){}
		}
	}
	/**수정 관련 메서드*/
	public int noticeModify(NoticeDTO ndto){
		try{
			conn = tt.db.ttDB.getConn();
			ps = conn.prepareStatement("update tt_notice set subject=?,content=? where idx=?");
			ps.setString(1, ndto.getSubject());
			ps.setString(2, ndto.getContent());
			ps.setInt(3, ndto.getIdx());
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	
	/**총 게시물 수 관련 메서드*/
	public int getTotalCnt(){
		try{
			conn = tt.db.ttDB.getConn();
			ps = conn.prepareStatement("select count(*) from tt_notice");
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count==0?1:count;
		}catch(Exception e){
			e.printStackTrace();
			return 1;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
}
