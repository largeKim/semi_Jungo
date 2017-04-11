package tt.message;

import java.sql.*;
import java.util.ArrayList;

import tt.message.MessageDTO;
import tt.product.ProductDTO;
import tt.question.QuestionDTO;


public class MessageDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public int messageAdd(MessageDTO dto) {
		try {
			conn = tt.db.ttDB.getConn();
			
			String sql = "INSERT INTO tt_message VALUES(tt_message_idx.nextval,?,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getReceiver());
			ps.setString(2, dto.getSender());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getContent());
			
			System.out.println(dto.getReceiver());
			System.out.println(dto.getSender());
			System.out.println(dto.getSubject());
			System.out.println(dto.getContent());
			
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
	
	/**본문관련 메소드*/
	public MessageDTO messageContent(int idx){
		try{
			conn = tt.db.ttDB.getConn();
			
			String sql = "SELECT * FROM tt_message WHERE idx="+idx;
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			MessageDTO dto = null;
			
			if(rs.next()){
				String receiver = rs.getString("receiver");
				String sender = rs.getString("sender");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				
				dto = new MessageDTO(idx, receiver, sender, subject, content, writedate);
			}
			
			return dto;
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
	
	/** 삭제 관련 메소드 
	 * 매개변수는 int idx
	 * 어차피 session 상태로 memberDTO값이 들어올거라서 삭제기능만 있어요.
	 * */
	public int messageDelete(int idx) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "DELETE FROM tt_message WHERE idx=?";
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
	
	/** 사용자 정보 획득하기 (ID저장) */
	public String getUserInfo(String user) {
		try {

			String sql = "select name from tt_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user);
			rs = ps.executeQuery();
			rs.next();
			return rs.getString(1);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();

			} catch (Exception e) {

			}
		}
	}
	
	/*받은쪽지 목록관련 메서드*/ //cp=현재페이지 ls=페이지리스트
	public ArrayList<MessageDTO> messageReceivelist(int cp, int ls, String user){
		try{
			conn=tt.db.ttDB.getConn();
			getUserInfo(user);
			String sql="select * from(select rownum as rnum,a.* from(select * from tt_message)a)b where receiver='"+user+"'";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<MessageDTO> arr = new ArrayList<MessageDTO>();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String receiver = rs.getString("receiver");
				String sender = rs.getString("sender");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				
				MessageDTO dto = new MessageDTO(idx, receiver, sender, subject, content, writedate);
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
	
	/*보낸쪽지 목록관련 메서드*/ //cp=현재페이지 ls=페이지리스트
	public ArrayList<MessageDTO> messageSendlist(int cp, int ls, String user){
		try{
			conn=tt.db.ttDB.getConn();
			getUserInfo(user);
			String sql="select * from(select rownum as rnum,a.* from(select * from tt_message)a)b where sender='"+user+"'";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<MessageDTO> arr = new ArrayList<MessageDTO>();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String receiver = rs.getString("receiver");
				String sender = rs.getString("sender");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				
				MessageDTO dto = new MessageDTO(idx, receiver, sender, subject, content, writedate);
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
			String sql="select count(*) from tt_message";
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
}
