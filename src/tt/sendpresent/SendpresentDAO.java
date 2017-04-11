package tt.sendpresent;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tt.notice.NoticeDTO;

public class SendpresentDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
		
	public SendpresentDAO() {
		super();
	}

	/*포인트 배송주소 저장*/
	public int insertPex(SendPresentDTO sedto){
		try{
			conn = tt.db.ttDB.getConn();
			ps = conn.prepareStatement("insert into tt_sendpresent values(tt_sendpresent_idx.nextval,?,?,?,?,?,?,sysdate)");
			ps.setString(1, sedto.getRaddress());
			ps.setString(2, sedto.getId());
			ps.setString(3, sedto.getStel());
			ps.setString(4, sedto.getYourorder());
			ps.setString(5, sedto.getPname());
			ps.setInt(6, sedto.getPnumber());
			
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
	
	/*포인트 배송 주소 리스트(목록)*/
	public ArrayList<SendPresentDTO> peList(int cp, int ls){
		try{
			conn=tt.db.ttDB.getConn();
			ps = conn.prepareStatement("select * from(select rownum as rnum,a.* from (select * from tt_sendpresent)a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+" order by rnum desc");
			rs = ps.executeQuery();
			ArrayList<SendPresentDTO> arr = new ArrayList<SendPresentDTO>();
			while(rs.next()){
				int rnum = rs.getInt("rnum");
				int idx = rs.getInt("idx");
				String raddress = rs.getString("raddress");
				String id = rs.getString("id");
				String stel = rs.getString("stel");
				String yourorder = rs.getString("yourorder");
				String pname = rs.getString("pname");
				int pnumber = rs.getInt("pnumber");
				Date senddate = rs.getDate("senddate");
				String userid = rs.getString("userid");
				
				SendPresentDTO sedto = new SendPresentDTO(idx, raddress, id, stel, yourorder, pname, pnumber, rnum, senddate,userid);
				arr.add(sedto);
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
	
	/*포인트 배송 주소 리스트(목록)*/
	public ArrayList<SendPresentDTO> peList2(String user,int cp, int ls){
		try{
			conn=tt.db.ttDB.getConn();
			ps = conn.prepareStatement("select * from(select rownum as rnum,a.* from (select * from tt_sendpresent where userid='"+user+"')a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+" order by rnum desc");
			rs = ps.executeQuery();
			ArrayList<SendPresentDTO> arr = new ArrayList<SendPresentDTO>();
			while(rs.next()){
				int rnum = rs.getInt("rnum");
				int idx = rs.getInt("idx");
				String raddress = rs.getString("raddress");
				String id = rs.getString("id");
				String stel = rs.getString("stel");
				String yourorder = rs.getString("yourorder");
				String pname = rs.getString("pname");
				int pnumber = rs.getInt("pnumber");
				Date senddate = rs.getDate("senddate");
				String userid = rs.getString("userid");
				
				SendPresentDTO sedto = new SendPresentDTO(idx, raddress, id, stel, yourorder, pname, pnumber, rnum, senddate,userid);
				arr.add(sedto);
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
	
	/*내용 확인*/
	public SendPresentDTO peContent(int idx_s){
		try{
			conn = tt.db.ttDB.getConn();
			ps = conn.prepareStatement("select * from tt_sendpresent where idx=?");
			ps.setInt(1, idx_s);
			rs = ps.executeQuery();
			SendPresentDTO sedto = null;
			if(rs.next()){
				int rnum = 0;
				int idx = rs.getInt("idx");
				String raddress = rs.getString("raddress");
				String id = rs.getString("id");
				String stel = rs.getString("stel");
				String yourorder = rs.getString("yourorder");
				String pname = rs.getString("pname");
				int pnumber = rs.getInt("pnumber");
				Date senddate = rs.getDate("senddate");
				String userid = rs.getString("userid");
				
				sedto = new SendPresentDTO(idx, raddress, id, stel, yourorder, pname, pnumber, rnum, senddate,userid);
				
			}
			return sedto;
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
	public int peDelete(int idx){
		try{
			conn = tt.db.ttDB.getConn();
			ps = conn.prepareStatement("delete from tt_sendpresent where idx=?");
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
	public int peModify(SendPresentDTO sedto){
		try{
			conn = tt.db.ttDB.getConn();
			ps = conn.prepareStatement("update tt_sendpresent set raddress=?,yourorder=? where idx=?");
			ps.setString(1, sedto.getRaddress());
			ps.setString(2, sedto.getYourorder());
			ps.setInt(3, sedto.getIdx());
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
			ps = conn.prepareStatement("select count(*) from tt_sendpresent");
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

	
	public int orderPresent(SendPresentDTO sdto){
		try{
			conn = tt.db.ttDB.getConn();
			String sql = "insert into tt_sendpresent values(tt_sendpresent_idx.nextval,?,?,?,?,?,?,sysdate,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, sdto.getRaddress());
			ps.setString(2, sdto.getId());
			ps.setString(3, sdto.getStel());
			ps.setString(4, sdto.getYourorder());
			ps.setString(5, sdto.getPname());
			ps.setInt(6, sdto.getPnumber());
			ps.setString(7, sdto.getUserid());
			
			int count = ps.executeUpdate();
			if(count > 0){
				int result = subPresentPnum(sdto.getPname(), sdto.getPnumber()); 
				
				return result;
			}
			return 0;
			
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			try{
				
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	// 구매하면 포인트 차감
	public int pointCal(String userid, int point){
		try{
			conn = tt.db.ttDB.getConn();
			String sql = "update tt_member set point=point-? where id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, point);
			ps.setString(2, userid);
			
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
	}
	
		//상품 재고감소 ( 주문정보 넘기기와 같이 실행)
		public int subPresentPnum(String pcode, int pnumber){ // 상품코드 , 주문수
			try{
				
				String sql = "update tt_pointex set pnum=pnum-? where pcode=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, pnumber);
				ps.setString(2, pcode);
				
				int count = ps.executeUpdate();
				
				return count;
				
			}catch(Exception e){
				e.printStackTrace();
				return -1;
			}finally{
				try{
					
					if(ps!=null)ps.close();
				}catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
}
