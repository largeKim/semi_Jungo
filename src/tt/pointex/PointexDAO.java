package tt.pointex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import tt.member.*;
import tt.sendpresent.SendPresentDTO;

public class PointexDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public PointexDAO() {
		// TODO Auto-generated constructor stub
	}
	
	/**포인트상품 정보 수정 메소드*/
	public int pointExUpdate(PointexDTO podto){
		try{
			conn = tt.db.ttDB.getConn();
			
			String sql = "update tt_pointex set pname=?,pprice=?,pnum=?,picpath=?,pcode=? where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, podto.getPname());
			ps.setInt(2, podto.getPprice());
			ps.setInt(3, podto.getPnum());
			ps.setString(4, podto.getPicpath());
			ps.setString(5, podto.getPcode());
			ps.setInt(6, podto.getIdx());
			
			
			int count = ps.executeUpdate();
			
			return count;
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
	
	/**포인트상품 삭제 메소드*/
	public int pointExDelete(int idx_){
		try{
			conn = tt.db.ttDB.getConn();
			
			String sql = "DELETE FROM tt_pointex WHERE idx="+idx_;
			ps = conn.prepareStatement(sql);
			
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/**포인트상품 정보 조회 메소드*/
	public PointexDTO pointExContent(int idx_){
		try{
			conn = tt.db.ttDB.getConn();
			
			String sql = "SELECT * FROM tt_pointex where idx="+idx_;
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			PointexDTO podto = null;
			if(rs.next()){
				int idx = rs.getInt("idx");
				String pname = rs.getString("pname");
				int pprice = rs.getInt("pprice");
				int pnum = rs.getInt("pnum");
				String picpath = rs.getString("picpath");
				String pcode = rs.getString("pcode");
				String etc1 = rs.getString("etc1");
				String etc2 = rs.getString("etc2");
				
				podto = new PointexDTO(idx, pname, pprice, pnum, picpath, pcode, etc1, etc2);
			}
			
			return podto;
			
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
	
	/**포인트상품 추가 메소드*/
	public int pointExAdd(PointexDTO podto){
		try{
			conn = tt.db.ttDB.getConn();
			
			String sql = "INSERT INTO tt_pointex VALUES(tt_pointex_idx.nextval,?,?,?,?,?,'','')";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, podto.getPname());
			ps.setInt(2, podto.getPprice());
			ps.setInt(3, podto.getPnum());
			ps.setString(4, podto.getPicpath());
			ps.setString(5, podto.getPcode());
			
			int count = ps.executeUpdate();
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/**상품명으로된 배열 만들기*/
	public ArrayList<PointexDTO> pointList(int cp, int ls){
		try{
		conn=tt.db.ttDB.getConn();
		String sql = "select * from(select rownum as rnum,a.* from (select distinct pname, pprice, picpath from tt_pointex)a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+" order by rnum desc";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		ArrayList<PointexDTO> arr = new ArrayList<PointexDTO>();
		while(rs.next()){
//			int idx = rs.getInt("idx");
			String pname = rs.getString("pname");
			int pprice = rs.getInt("pprice");
			String picpath="";
			picpath = rs.getString("picpath")==null?"":rs.getString("picpath");
//			int pnum = rs.getInt("pnum");
//			String picpath = rs.getString("picpath");
//			String pcode = rs.getString("pcode");
//			String etc1 = rs.getString("etc1");
//			String etc2 = rs.getString("etc2");
			
//			PointexDTO pedto = new PointexDTO(idx, pname, pprice, pnum, picpath, pcode, etc1, etc2);
			PointexDTO pedto = new PointexDTO();
			pedto.setPname(pname);
			pedto.setPprice(pprice);
			pedto.setPicpath(picpath);
			arr.add(pedto);
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
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
	
	/*관리자 포인트 상품 리스트*/
	public ArrayList<PointexDTO> pointexList(int cp, int ls){
		try{
			conn=tt.db.ttDB.getConn();
			String sql = "select * from(select rownum as rnum,a.* from (select * from tt_pointex)a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+" order by rnum desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<PointexDTO> arr = new ArrayList<PointexDTO>();
			while(rs.next()){
				int idx = rs.getInt("idx");
				String pname = rs.getString("pname");
				int pprice = rs.getInt("pprice");
				int pnum = rs.getInt("pnum");
				String picpath = rs.getString("picpath");
				String pcode = rs.getString("pcode");
				String etc1 = rs.getString("etc1");
				String etc2 = rs.getString("etc2");
				
				PointexDTO pedto = new PointexDTO(idx, pname, pprice, pnum, picpath, pcode, etc1, etc2);
				arr.add(pedto);
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
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
/*포인트 정보 확인 메서드*/
	
	public int getUserpoint(String user){
		try{
			conn = tt.db.ttDB.getConn();
			ps = conn.prepareStatement("select point from tt_member where id=?");
			ps.setString(1, user);
			rs = ps.executeQuery();
			int userpoint = 0;
			if(rs.next()){
				userpoint = rs.getInt(1);
			}
			return userpoint;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	
	/*포인트 차감 메서드*/
	
	public int setMinuspoint(String user, int minus){
		try{
			int userpoint,minuspoint,totalpoint = 0;
			userpoint = getUserpoint(user);
			System.out.println("userpoint : "+userpoint);
			minuspoint = minus;
			System.out.println("minuspoint : "+minuspoint);
			totalpoint = userpoint-minuspoint;
			System.out.println("totalpoint : "+totalpoint);
			conn = tt.db.ttDB.getConn();
			ps = conn.prepareStatement("update tt_member set point=? where id=?");
			if(userpoint>minuspoint){
				ps.setInt(1, userpoint-minuspoint);
				ps.setString(2, user);
			}else{
				return -1;
			}
			ps.setString(2, user);
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
	
	/*등급별 할인율 메서드*/
	public double getDiscount(String user){
		try{
			double userdc = 0.00;
			MemberDAO mdao = new MemberDAO();
			int usergrade = Integer.parseInt(mdao.getGrade(user));
			System.out.println(usergrade);
			switch(usergrade){
			case 1:
				userdc = 0.05;break;
			case 2:
				userdc = 0.10;break;
			case 3:
				userdc = 0.15;break;
			case 4:
				userdc = 0.20;break;
			case 5:
				userdc = 0.25;break;
			}
			System.out.println("할인율 : "+userdc);
			return userdc;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}finally{
			try{
				
			}catch(Exception e2){}
		}
	}
	
	/**총 게시물 수 관련 메서드*/
	public int getTotalCnt(){
		try{
			conn = tt.db.ttDB.getConn();
			ps = conn.prepareStatement("select count(*) from tt_pointex");
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
	
	//전체 상품 목록에서 상품 선택할 때
		public ArrayList<PointexDTO> getPresentInfo(String pname){
			try{
				conn = tt.db.ttDB.getConn();
				String sql = "select * from tt_pointex where pname=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, pname);
				
				rs = ps.executeQuery();
				
				ArrayList<PointexDTO> arr = new ArrayList<PointexDTO>();
				while(rs.next()){
					int idx = rs.getInt("idx");
					
					int pprice = rs.getInt("pprice");
					int pnum = rs.getInt("pnum");
					String picpath = rs.getString("picpath");
					String pcode = rs.getString("pcode");
					String etc1 = rs.getString("etc1");
					String etc2 = rs.getString("etc2");
					
					PointexDTO pdto = new PointexDTO(idx, pname, pprice, pnum, picpath, pcode, etc1, etc2);
					
					arr.add(pdto);
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
				}catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
		//상품 코드(색상) 선택후 재고 가져오기
		
		public int getPresentPnum(String pcode){
			try{
				conn = tt.db.ttDB.getConn();
				String sql = "select pnum from tt_pointex where pcode=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, pcode);
				
				rs = ps.executeQuery();
				
				int pnum=0;
				if(rs.next()){
					pnum = rs.getInt(1);
				}
				
				return pnum;
				
			}catch(Exception e){
				e.printStackTrace();
				return -1;
			}finally{
				try{
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
}
