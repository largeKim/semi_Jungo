package tt.sport.recom;

import java.sql.*;

public class RecomDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public RecomDAO(){
		
	}
	
	/**추천조작 검사 메소드*/
	public boolean chkRecom(String idcode){
		try{
			conn = tt.db.ttDB.getConn();
			String sql = "SELECT idcode FROM tt_recom WHERE idcode='"+idcode+"'";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				return false;
			}
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
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
	
	public int addRecom(String idcode){
		try{
			conn = tt.db.ttDB.getConn();
		
			String sql = "INSERT INTO tt_recom values(tt_recom_idx.nextval, '"+idcode+"')";
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
	
}
