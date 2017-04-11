package tt.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tt.complain.ComplainDTO;

public class FaqDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public FaqDAO(){
		// TODO Auto-generated constructor stub
	}
	
	
	/**faq 수정메소드*/
	public int faqUpdate(FaqDTO dto){
		try{
			conn = tt.db.ttDB.getConn();
			String sql = "UPDATE tt_faq SET subject=?, content=? WHERE idx=?";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getSubject());
			ps.setString(2, dto.getContent());
			ps.setInt(3, dto.getIdx());
			
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
	
	/**faq 삭제 메소드*/
	public int faqDelete(int idx){
		try{
			conn = tt.db.ttDB.getConn();
			String sql = "DELETE FROM tt_faq WHERE idx="+idx;
			ps = conn.prepareStatement(sql);
			
			return ps.executeUpdate();
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
	
	/*ref값 구하기 관련 메서드*/
	public int getMaxRef(){
		try{
			//쓰기 기능과 관련해서 사용하기 때문에 db연동을 따로 하지 않아도 됨
			String sql="select max(ref) from tt_faq";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int max=0;
			if(rs.next()){
				max=rs.getInt(1);
			}
			System.out.println(max);
			return max;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				//conn은 닫지않음. 밑에서 쓰기 기능과 관련이 있기때문
			}catch(Exception e2){
				
			}
		}
	}
	
	/** 조회수 관련 메소드 */
	public void upReadnum(int idx) {
		try {
			String sql = "UPDATE tt_faq SET readnum=readnum+1 WHERE idx=" + idx;

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
	
	/** 신고게시물 등록 메소드 */
	public int FaqAdd(FaqDTO dto) {
		try {
			conn = tt.db.ttDB.getConn();
			int max= getMaxRef();
			String sql = "insert into tt_faq values(tt_complain_idx.nextval,?,?,?,?,sysdate,0,0,?,0,'','')";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getSubject());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getType());
			ps.setString(4, dto.getWriter());
			ps.setInt(5, max+1);
			System.out.println(max);

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
	
	/*게시글 목록관련 메서드*/
	public ArrayList<FaqDTO> faqlist(int cp, int ls){
		try{
			conn=tt.db.ttDB.getConn();
			String sql="select * from(select rownum as rnum,a.* from(select * from tt_faq order by ref desc,sunbun asc)a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls;
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
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if (rs != null)rs.close();
		        if (ps != null)ps.close();
		        if (conn != null)conn.close();
			}catch(Exception e){
				
			}
		}
	}
	
	/*총 게시물 수 관련 메서드*/
	public int getTotalcnt(){
		try{
			conn=tt.db.ttDB.getConn();
			String sql="select count(*) from tt_faq";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count==0? 1: count;
		}catch(Exception e){
			e.printStackTrace();
			return 1;
		}finally{
			try{
				if (rs != null)rs.close();
		        if (ps != null)ps.close();
		        if (conn != null)conn.close();
			}catch(Exception e){
				
			}
		}
	}
	
	/*순번수정 관련 메서드*/
	public void updateSun(int ref, int sun){
		try{
			String sql="update tt_faq set sunbun=sunbun+1 where ref=? and sunbun>=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sun);
			int count = ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(ps!=null)ps.close();
			}catch(Exception e){
				
			}
		}
	}
	
	/**사용자 등급 획득하기*/
	public String getGrade(String user){
		try{
			conn = tt.db.ttDB.getConn();
			String sql="select grade from tt_member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user);
			rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){
				
			}
		}
	}
	
	/*본문관련 메서드*/
	public FaqDTO faqContent(int idx_){
		try{
			conn=tt.db.ttDB.getConn();
			upReadnum(idx_);
			String sql="select * from tt_faq where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx_);
			rs=ps.executeQuery();
			FaqDTO dto=null;
			if(rs.next()){
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

				
				dto = new FaqDTO(idx, subject, content, type, writer, writedate, readnum, lev, ref,
						sunbun, etc1, etc2);
			}
			return dto;
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if (rs != null)rs.close();
		        if (ps != null)ps.close();
		        if (conn != null)conn.close();
			}catch(Exception e){
				
			}
		}
	}
	

}
