package tt.question;

import java.sql.*;
import java.util.ArrayList;

import tt.complain.ComplainDTO;
import tt.product.ProductDTO;
import tt.question.*;

public class QuestionDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public QuestionDAO(){
		// TODO Auto-generated constructor stub
	}
	/** 본문작성 포인트 증가 +5 */
	public void plusPoint5(String id) {
		try {
			String sql = "update tt_member set point = (point+5) where id='"+id+"'";
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			int count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (ps != null)
					ps.close();
				System.out.println("ps닫힘!");
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/** 댓글작성 포인트 증가 +3 */
	public void plusPoint3(String id) {
		try {
			String sql = "update tt_member set point = (point+3) where id='"+id+"'";
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			int count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (ps != null)
					ps.close();
				System.out.println("ps닫힘!");
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public int questionUpdateOK(QuestionDTO dto) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "UPDATE tt_question SET subject=?,content=?,type=? WHERE idx=?";
			ps = conn.prepareStatement(sql);

			ps.setString(1, dto.getSubject());
			ps.setString(2, dto.getContent());
			ps.setString(3,dto.getType());
			ps.setInt(4, dto.getIdx());
			
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
	
	public int questionDelete(int idx) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "DELETE FROM tt_question WHERE idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);

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
	
	/*ref값 구하기 관련 메서드*/
	public int getMaxRef(){
		try{
			//쓰기 기능과 관련해서 사용하기 때문에 db연동을 따로 하지 않아도 됨
			String sql="select max(ref) from tt_question";
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
			String sql = "UPDATE tt_question SET readnum=readnum+1 WHERE idx=" + idx;

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
	
	/** 질문게시물 등록 메소드 */
	public int questionAdd(QuestionDTO dto) {
		try {
			conn = tt.db.ttDB.getConn();
			plusPoint5(dto.getWriter());
			int max= getMaxRef();
			String sql = "insert into tt_question values(tt_question_idx.nextval,?,?,?,?,sysdate,0,0,?,0,'','')";
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
	
	/*게시글 목록관련 메서드*/ //cp=현재페이지 ls=페이지리스트
	public ArrayList<QuestionDTO> questionlist(int cp, int ls){
		try{
			conn=tt.db.ttDB.getConn();
			String sql="select * from(select rownum as rnum,a.* from(select * from tt_question order by ref desc,sunbun asc)a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls;
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
			String sql="select count(*) from tt_question";
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
			String sql="update tt_question set sunbun=sunbun+1 where ref=? and sunbun>=?";
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
	
	/*답변쓰기 관련 메서드*/
	public int questionReWrite(QuestionDTO dto){
		try{
			conn=tt.db.ttDB.getConn();
			plusPoint3(dto.getWriter());
			updateSun(dto.getRef(), dto.getSunbun()+1);
			String sql="insert into tt_question values(tt_question_idx.nextval,?,?,?,?,sysdate,0,?,?,?,'','')";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getSubject());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getType());
			ps.setString(4, dto.getWriter());
			ps.setInt(5, dto.getLev()+1);
			ps.setInt(6, dto.getRef());
			ps.setInt(7, dto.getSunbun()+1);
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if (rs != null)rs.close();
		        if (ps != null)ps.close();
		        if (conn != null)conn.close();
			}catch(Exception e){
				
			}
		}
	}
	
	/*본문관련 메서드*/
	public QuestionDTO questionContent(int idx_){
		try{
			conn=tt.db.ttDB.getConn();
			upReadnum(idx_);
			String sql="select * from tt_question where idx=?";
			
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx_);
			rs=ps.executeQuery();
			QuestionDTO dto=null;
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

				
				dto = new QuestionDTO(idx, subject, content, type, writer, writedate, readnum, lev, ref,
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
