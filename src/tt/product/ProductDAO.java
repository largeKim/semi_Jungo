package tt.product;

import java.sql.*;
import java.util.ArrayList;

import tt.db.ttDB;
import tt.member.MemberDTO;

public class ProductDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public ProductDAO() {
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

	
	/** 상품 등록 메소드 */
	public int proAdd(ProductDTO pd) {
		try {
			conn = tt.db.ttDB.getConn();
			plusPoint5(pd.getWriter());
			int max = getMaxRef();
			String sql = "INSERT INTO tt_product VALUES(tt_product_idx.nextval,?,?,?,?,?,sysdate,0,0,?,0,?,'',?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, pd.getSubject());
			ps.setInt(2, pd.getPrice());
			ps.setString(3, pd.getContent());
			ps.setString(4, pd.getType());
			ps.setString(5, pd.getSort());
			
//			추가 수정부분 170330 시작
			ps.setInt(6, max+1);
			ps.setString(7, pd.getEtc1());
			ps.setString(8, pd.getWriter());
//			추가 수정부분 170330 끝

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

	/**
	 * 
	 */
	public String getSort(int a){
		String sort = "all";
		switch(a){
		case 1:
			sort = "all"; break;
		case 2:
			sort = "축구"; break;
		case 3:
			sort = "야구"; break;
		case 4:
			sort = "농구"; break;
		case 5:
			sort = "배구"; break;
		case 6:
			sort = "기타"; break;
		}
		return sort;
	}
	
	
	
	
	/** 목록구성 관련 메소드 
	 * type_list = 해당 페이지의 판매유형
	 * sort_list = 해당 페이지의 판매종목
	 * cp = 현재페이지
	 * ls = 리스트사이즈
	 * */
	public ArrayList<ProductDTO> productList(String type_list, String sort_list, int cp, int ls) {
		try {
			conn = tt.db.ttDB.getConn();
			String sql = "";
			if(sort_list.equals("all")){
//				추가 수정부분 170330 목 시작
				// 추가 수정부분 170402 일 시작
				sql = "select * from (select rownum as rnum, a.* from (select * from tt_product where type='"+type_list+"' and lev=0 and sunbun=0 order by ref desc, sunbun asc)a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+"";
			}else{
				sql = "select * from (select rownum as rnum, a.* from (select * from tt_product where type='"+type_list+"' and sort='"+sort_list+"' and lev=0 and sunbun=0 order by ref desc, sunbun asc)a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+"";
				//추가 수정부분 170402 일 시작
//				추가 수정부분 170330 목 끝
			}
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<ProductDTO> product = new ArrayList<ProductDTO>();
			// name,price,content,type,sort,writedate,readnum,lev,ref,sunbun,etc1,etc2
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String subject = rs.getString("subject");
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
				
				ProductDTO dto = new ProductDTO(idx, subject, content, price, type, sort, writedate, readnum, lev, ref,
						sunbun, etc1, etc2, writer);
				
				product.add(dto);
			}
			
			return product;
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

	/** 조회수 관련 메소드 */
	public void upReadnum(int idx) {
		try {
			String sql = "UPDATE tt_product SET readnum=readnum+1 WHERE idx=" + idx;

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

	/**본문관련 메소드*/
	public ProductDTO productContent(int idx){
		try{
			conn = tt.db.ttDB.getConn();
			
			upReadnum(idx);
			
			String sql = "SELECT * FROM tt_product WHERE idx="+idx;
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ProductDTO dto = null;
			
			if(rs.next()){
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				int price = rs.getInt("price");
				String type = rs.getString("type");
				String sort = rs.getString("sort");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				String etc1 = rs.getString("etc1");
				String etc2 = rs.getString("etc2");
				String writer = rs.getString("writer");
				
				dto = new ProductDTO(idx, subject, content, price, type, sort, writedate, readnum, lev, ref, sunbun, etc1, etc2, writer);
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
	
	/** 총 게시물 수 관련 메소드 */
	public int gettotalCnt(String type) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "SELECT COUNT(*) FROM tt_product where type='"+type+"'";

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

	/** 삭제 관련 메소드 
	 * 매개변수는 int idx
	 * 어차피 session 상태로 memberDTO값이 들어올거라서 삭제기능만 있어요.
	 * */
	public int proDelete(int idx) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "DELETE FROM tt_product WHERE idx=?";
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

	/**
	 * 수정 관련 메소드
	 * 상품이름, 내용, 가격 수정
	 * 매개변수는 PruductDTO pdto, MemberDTO mdto, 상품구별하기 위한 int idx
	 * 어차피 session 상태로 memberDTO값이 들어올거라서 삭제기능만 있어요.
	 */
	public int proUpdateOK(ProductDTO pdto) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "UPDATE tt_product SET subject=?,content=?,price=?,sort=?,type=?,etc1=? WHERE idx=?";
			ps = conn.prepareStatement(sql);

			ps.setString(1, pdto.getSubject());
			ps.setString(2, pdto.getContent());
			ps.setInt(3, pdto.getPrice());
			ps.setString(4,pdto.getSort());
			ps.setString(5,pdto.getType());
			ps.setString(6, pdto.getEtc1());
			ps.setInt(7, pdto.getIdx());
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
	
// 		추가 수정부분 170329 수 시작 		//
/**게시판 내 검색관련*/
	/** 게시판 내 검색관련 총 게시물수 가져오기*/
	
	public int gettotalCnt(String type_list, String skey, String svalue) {
		try {
			conn = tt.db.ttDB.getConn();
			
			if(skey.equals("subcon")){	//제목 + 내용 검색
				
				String sql = "select count(*) from (select * from tt_product where type='"+type_list+"')a where subject like '%"+svalue+"%' or content like '%"+svalue+"%'"; 
				ps = conn.prepareStatement(sql);
				
			}else{		//제목, 내용, 작성자로 각각 검색될때
				
				String sql = "select count(*) from (select * from tt_product where type='"+type_list+"')a where "+skey+" like '%"+svalue+"%'";
				ps = conn.prepareStatement(sql);
			}

			
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
	
	public ArrayList<ProductDTO> productList2(String type_list, String sort_list, int cp, int ls, String skey, String svalue) {
		try {
			conn = tt.db.ttDB.getConn();
			String sql = "";
			if(skey.equals("subcon")){	//제목 + 내용 검색
				if(sort_list.equals("all")){				
					sql = "select * from (select rownum as rnum, b.* from (select * from (select * from tt_product where type='"+type_list+"')a where subject like '%"+svalue+"%' or content like '%"+svalue+"%' order by idx desc)b)c where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+"";
				}else{
					sql = "select * from (select rownum as rnum, b.* from (select * from (select * from tt_product where type='"+type_list+"')a where subject like '%"+svalue+"%' or content like '%"+svalue+"%' and sort='"+sort_list+"')b)c where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+"";
				}
			}else{
				if(sort_list.equals("all")){
					sql = "select * from (select rownum as rnum, b.* from (select * from (select * from tt_product where type='"+type_list+"')a where "+skey+" like '%"+svalue+"%' order by idx desc)b)c where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+"";
				}else{
					sql = "select * from (select rownum as rnum, b.* from (select * from (select * from tt_product where type='"+type_list+"')a where "+skey+" like '%"+svalue+"%' and sort='"+sort_list+"')b)c where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+"";	
				}
			}
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<ProductDTO> product = new ArrayList<ProductDTO>();
			// name,price,content,type,sort,writedate,readnum,lev,ref,sunbun,etc1,etc2
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String subject = rs.getString("subject");
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
				
				ProductDTO dto = new ProductDTO(idx, subject, content, price, type, sort, writedate, readnum, lev, ref,
						sunbun, etc1, etc2, writer);
				
				product.add(dto);
			}
			
			return product;
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
//		추가 수정부분 170329 수 끝		//
	
//	추가 수정부분 170330 목 시작
/**ref값 구하기 관련 메서드*/
public int getMaxRef(){
	try{
		String sql = "select max(ref) from tt_product";
		ps=conn.prepareStatement(sql);
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
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
		}catch(Exception e2){
			
		}
	}
	
}
public ArrayList<ProductDTO> preforList(int ref, ProductDTO dto){
	try{
		conn = tt.db.ttDB.getConn();
		
		String sql = "select * from tt_product where type=? order by ref, lev,sunbun";
		ps=conn.prepareStatement(sql);
		ps.setString(1, dto.getType());
		
		rs = ps.executeQuery();
		ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
		while(rs.next()){
			int idx = rs.getInt("idx");
			String subject = rs.getString("subject");
			String writer = rs.getString("writer");
			java.sql.Date writedate = rs.getDate("writedate");
			
			ProductDTO pdto = new ProductDTO();
			pdto.setIdx(idx);
			pdto.setSubject(subject);
			pdto.setWriter(writer);
			pdto.setWritedate(writedate);
			arr.add(pdto);
		}
		
		return arr;
		
	}catch(Exception e){
		e.printStackTrace();
		return null;
	}finally{
		try{
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}catch(Exception e2){
			
		}
	}
	
}
//	추가 수정부분 170330 목 끝

//추가 수정부분 170402 시작
/** 상품 댓글 메서드*/
public int proReWrite(ProductDTO pd) {
	try {
		
		conn = tt.db.ttDB.getConn();
		plusPoint3(pd.getWriter());
		updateSun(pd.getRef(), pd.getSunbun()+1);
		
		String sql = "INSERT INTO tt_product VALUES(tt_product_idx.nextval,?,0,?,?,?,sysdate,0,?,?,?,'','',?)";
		
					//idx//subject//price//content//type/ * /sort//writedate//readnum//lev//ref/ * /sunbun//etc1//etc2//writer	
		
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, pd.getSubject());
		
		ps.setString(2, pd.getContent());
		ps.setString(3, pd.getType());
		ps.setString(4, pd.getSort());
		
		ps.setInt(5,pd.getLev()+1);	// lev
		ps.setInt(6, pd.getRef());	// ref
		ps.setInt(7, pd.getSunbun()+1);	// sunbun
		
		ps.setString(8, pd.getWriter());


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

public void updateSun(int ref, int sun){
	try{
		String sql = "update tt_product set sunbun=sunbun+1 where ref=? and sunbun>=?";
		ps = conn.prepareStatement(sql);
		
		ps.setInt(1, ref);
		ps.setInt(2, sun);
		
		int count = ps.executeUpdate();
		
	}catch (Exception e) {
		e.printStackTrace();
	}finally{
		try{
			if(ps!=null)ps.close();
		}catch (Exception e2) {
			e2.printStackTrace();
		}
	}
}

public ArrayList<ProductDTO> productList3(String type_list, String sort_list, int cp, int ls) {
	try {
		conn = tt.db.ttDB.getConn();
		String sql = "";
		if(sort_list.equals("all")){
//			추가 수정부분 170330 목 시작
			sql = "select * from (select rownum as rnum, a.* from (select * from tt_product where type='"+type_list+"' order by ref desc, sunbun asc)a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+"";
		}else{
			sql = "select * from (select rownum as rnum, a.* from (select * from tt_product where type='"+type_list+"' and sort='"+sort_list+"' order by ref desc, sunbun asc)a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls+"";
//			추가 수정부분 170330 목 끝
		}
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		ArrayList<ProductDTO> product = new ArrayList<ProductDTO>();
		// name,price,content,type,sort,writedate,readnum,lev,ref,sunbun,etc1,etc2
		while (rs.next()) {
			int idx = rs.getInt("idx");
			String subject = rs.getString("subject");
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
			
			ProductDTO dto = new ProductDTO(idx, subject, content, price, type, sort, writedate, readnum, lev, ref,
					sunbun, etc1, etc2, writer);
			
			product.add(dto);
		}
		
		return product;
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
//추가 수정부분 170402 끝


//추가 수정부분 04월6일 새벽 시작
public int auctionAdd(ProductDTO pdto, java.sql.Date writedate){
	try {
		conn = tt.db.ttDB.getConn();
		plusPoint5(pdto.getWriter());
		int max = getMaxRef();
		String sql = "INSERT INTO tt_product VALUES(tt_product_idx.nextval,?,?,?,?,?,'"+writedate+"',0,0,?,0,?,?,?)";
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, pdto.getSubject());
		ps.setInt(2, pdto.getPrice());
		ps.setString(3, pdto.getContent());
		ps.setString(4, pdto.getType());
		ps.setString(5, pdto.getSort());
		
		
		ps.setInt(6, max+1);
		ps.setString(7, pdto.getEtc1());
		ps.setString(8, pdto.getEtc2());
		ps.setString(9, pdto.getWriter());


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
	
public int dealAuction(String dealid, int dealprice, int idx){
	try {
		conn = tt.db.ttDB.getConn();
		
		String etc2 = "";
		
		String pre_etc2 = getEtc2_s(idx);
		
		System.out.println("pre_etc2 = "+pre_etc2);
		
		if(pre_etc2==null || pre_etc2.equals("")){	//3.etc2(즉시구매 가격)에 값이 없고 경매에 처음 참여하는 사람인 경우
			
			System.out.println("3.============================");
			etc2 = dealid;
			
		}else{	//etc2 에 뭔가가 있을때	
			
			if(pre_etc2.indexOf("/")>=0){		//1.즉시구매가격이 있을떄
				System.out.println("1.============================");
				pre_etc2 = pre_etc2.substring(0, pre_etc2.indexOf("/")+1);
				
				
				etc2 = pre_etc2.concat(dealid);
				System.out.println("pre_etc2 = "+ pre_etc2);
				System.out.println("etc2 = "+etc2);
				
				
			}else{ 	//2. 즉시구매 가격이 없고 기존에 경매에 참여한 사람만 있는경우
				
				System.out.println("2.============================");
				etc2 = pre_etc2.concat(dealid);
			}
		}
		
		
		String sql = "update tt_product set price=?, etc2=? where idx=?";
		ps = conn.prepareStatement(sql);
		
		ps.setInt(1, dealprice);
		ps.setString(2, etc2);
		ps.setInt(3, idx);

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


	
	
	public int getAuction(String dealid, int dealprice, int idx){	//즉시구매 신청
		try {
			conn = tt.db.ttDB.getConn();
			
			
			String sql = "update tt_product set price=?, etc2=?, writedate=sysdate where idx=?";
			
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, dealprice);
			ps.setString(2, dealid);
			ps.setInt(3, idx);
			
			
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
	
	public String getEtc2_s(int idx){
		try {
			
			String sql = "select etc2 from tt_product where idx=?";
			ps = conn.prepareStatement(sql);
			
			
			ps.setInt(1, idx);

			rs = ps.executeQuery();
			
			if(rs.next()){
				String etc2 = rs.getString(1);
				
				return etc2;
			}

			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
//추가 수정부분 04월6일 새벽 끝



}


