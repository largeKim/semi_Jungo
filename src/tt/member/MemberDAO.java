package tt.member;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import tt.member.MemberDTO;
import tt.product.*;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public static final int LOGIN_OK = 1; // 로그인 성공
	public static final int LOGIN_NO = 0; // 로그인 실패
	public static final int ERROR = -1; // 에러

	public static final int BLACK_YES = -2;
	public static final int BLACK_NO = 0;

	public MemberDAO() {
		System.out.println();
	}

	/** 회원가입 관련 */
	public int memberJoin(MemberDTO dto) {
		try {
			conn = tt.db.ttDB.getConn();
			String sql = "insert into tt_member values(tt_member_idx.nextval,?,?,?,?,?,?,sysdate,?,?,?,0)";
 
			ps = conn.prepareStatement(sql);

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPwd());
			ps.setString(4, dto.getAddr());
			ps.setString(5, dto.getEmail());
			ps.setString(6, dto.getTel());
			ps.setString(7, "");
			ps.setString(8, "1");
			ps.setInt(9, 0);

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

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

	/** 회원가입 관련 아이디 중복 체크 */
	public boolean idCheck(String id) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "select id from tt_member where id=?";

			ps = conn.prepareStatement(sql);

			ps.setString(1, id);

			rs = ps.executeQuery();

			if (rs.next()) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/** 로그인 관련 아이디, 비밀번호 체크 */
	public int memberLogin(String id, String pwd) {
		try {
			conn = tt.db.ttDB.getConn();
			System.out.println("로그인DAO/" + id);
			System.out.println(pwd);
			String sql = "select black,pwd from tt_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				String pass = rs.getString("pwd");
				String black = rs.getString("black");
	            if(black.equals("1")){
	               return BLACK_YES;
	            }
				if (pass.equals(pwd)) {
					System.out.println("로그인ok로 보낸다");
					return LOGIN_OK;
				} else {
					return LOGIN_NO;
				}

			} else {
				return LOGIN_NO;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/** 포인트 체크하기 */
	public int getPoint(String user) {
		try {
			conn = tt.db.ttDB.getConn();
			String sql = "select point from tt_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);

			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 포인트 체크하기 */
	public int getPoint2(String user) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "select point from tt_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);

			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 포인트에따른 랭크차등 */
	public void pointRank(int point, String user) {
		try {
			System.out.println("메서드 들어갈때 포인트"+point);
			conn = tt.db.ttDB.getConn();
			String sql = "";
			switch (point / 1000) {
			case 0:
				sql = "update tt_member set grade=1 where id='" + user + "' and point>=0 and point<1000";
				break;
			case 1:
				sql = "update tt_member set grade=2 where id='" + user + "' and point>=1000 and point<2000";
				break;
			case 2:
				sql = "update tt_member set grade=3 where id='" + user + "' and point>=2000 and point<3000";
				break;
			case 3:
				sql = "update tt_member set grade=? where id='" + user + "' and point>=3000 and point<4000";
				break;
			case 4:
				sql = "update tt_member set grade=? where id='" + user + "' and point>=4000 and point<5000";
			}
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			
			int count = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}


	/** 사용자 정보 획득하기 (ID저장) */
	public String getUserInfo(String user) {
		try {
			conn = tt.db.ttDB.getConn();
			String sql = "select name from tt_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user);
			rs = ps.executeQuery();
			
//			추가 수정부분 170330 목 시작 //
			
				if(rs.next()){
					return rs.getString(1);
				}else{
					return null;
				}
				
				//		추가 수정부분 170330 목 끝 //

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

			}
		}
	}

	/** 사용자 등급 획득하기 */
	public String getGrade(String user) {
		try {
			conn = tt.db.ttDB.getConn();
			String sql = "select grade from tt_member where id=?";
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
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 사용자 비밀번호 획득하기 */
	public String getPwd(String user) {
		try {
			conn = tt.db.ttDB.getConn();
			String sql = "select pwd from tt_member where id=?";
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
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 회원 아이디 찾기 */
	public String findId(String name, String tel) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "select id from tt_member where name=? and tel=?";

			ps = conn.prepareStatement(sql);

			ps.setString(1, name);
			ps.setString(2, tel);

			rs = ps.executeQuery();

			String id = "";

			if (rs.next()) {
				id = rs.getString(1);
			}

			return id;
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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/** 회원 비밀번호 찾기 */
	public String findPwd(String id, String tel) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "select pwd from tt_member where id=? and tel=?";

			ps = conn.prepareStatement(sql);

			ps.setString(1, id);
			ps.setString(2, tel);

			rs = ps.executeQuery();

			String pwd = "";
			if (rs.next()) {
				pwd = rs.getString(1);
			}

			return pwd;

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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/** 회원 탈퇴하기 */
	public int memberOut(String id, String pwd) {
		try {

			conn = tt.db.ttDB.getConn();

			String sql = "delete from tt_member where id=? and pwd=?";

			ps = conn.prepareStatement(sql);

			ps.setString(1, id);
			ps.setString(2, pwd);

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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/** 회원 정보수정 */
	public int memberModify(MemberDTO dto) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "update tt_member set pwd=?, addr=?, email=?, tel=? where id=?";

			ps = conn.prepareStatement(sql);

			ps.setString(1, dto.getPwd());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getAddr());
			ps.setString(4, dto.getTel());
			ps.setString(5, dto.getId());
			
			System.out.println("회원정보수정비밀번호:"+dto.getPwd());

			int count = ps.executeUpdate();

			return count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/** 관심있는 상품(장바구니) 업데이트 */
	public int addFavorProduct(int idx, String id) {
		try {
			conn = tt.db.ttDB.getConn();

			String list = favorProductList(id);
			int eq = 0;
			if (!(list == null || list.equals(""))) {
				System.out.println("list = " + list);
				String idx_s = Integer.toString(idx);

				String list_arr[] = list.split("/");

				for (int i = 0; i < list_arr.length; i++) {
					if ((list_arr[i].equals(idx_s))) {
						eq++;
					}
				}

			}
			if (eq == 0) {
				String sql = "update tt_member set list=? where id=?";

				ps = conn.prepareStatement(sql);
				if (!(list == null || list.equals(""))) {
					ps.setString(1, list + "/" + idx);
					ps.setString(2, id);

				} else {
					ps.setString(1, "" + idx);
					ps.setString(2, id);
				}

				int count = ps.executeUpdate();

				return count;
			} else {
				return -2;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/** 관심있는 상품 리스트 가져오기 */
	public String[] favorProductList2(String id) {
		try {

			conn = tt.db.ttDB.getConn();

			String sql = "select list from tt_member where id=?";

			ps = conn.prepareStatement(sql);

			ps.setString(1, id);

			rs = ps.executeQuery();

			String list = "";
			// 변경부분 170328 화 시작///////////
			if (rs.next()) {
				list = rs.getString(1);

			}
			System.out.println("list = " + list);

			if (list == null || list.equals("")) {

				return null;

			} else {

				String listarr[] = list.split("/");

				return listarr;
			}

			// 변경부분 170328 화 끝///////////


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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

	/** 관심있는 상품(장바구니) 리스트 체크용 */
	public String favorProductList(String id) {
		try {

			String sql = "select list from tt_member where id=?";

			ps = conn.prepareStatement(sql);

			ps.setString(1, id);

			rs = ps.executeQuery();
			String list = "";

			if (rs.next()) {
				list = rs.getString(1);
			}
			System.out.println("list========" + list);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/** 상품 상세정보 가져오기 */
	/* 추가 수정 부분 170329 수 시작 */
	public ArrayList<ProductDTO> favorProductGetInfo(String listarr[], String id) {
	/* 추가 수정 부분 170329 수 끝 */
		try {
			
			
			// 변경부분 170328 화 시작///////////
			if (listarr == null)
				return null;
			// 변경부분 170328 화 끝///////////

			conn = tt.db.ttDB.getConn();

			String sql = "select idx, type, subject, price, etc1 from tt_product where idx=?";
			ps = conn.prepareStatement(sql);

			ArrayList<ProductDTO> al = new ArrayList<ProductDTO>();

			for (int i = 0; i < listarr.length; i++) {

				ps.setInt(1, Integer.parseInt(listarr[i]));

				rs = ps.executeQuery();

				if (rs.next()) {
					int idx = rs.getInt("idx");
					String type = rs.getString("type");
					String subject = rs.getString("subject");
					int price = rs.getInt("price");
					String etc1 = rs.getString("etc1");

					ProductDTO pdto = new ProductDTO();

					pdto.setIdx(idx);
					pdto.setType(type);
					pdto.setSubject(subject);
					pdto.setPrice(price);
					pdto.setEtc1(etc1);

					al.add(pdto);
				/* 추가 수정 부분 170329 수 시작 */
				}else{
					delFavorProduct(Integer.parseInt(listarr[i]),id);
				}
				/* 추가 수정 부분 170329 수 끝 */
				

			}

			return al;

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

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/** 관심있는 상품(장바구니) 삭제 */
	public int delFavorProduct(int idx, String id) {
		try {
			conn = tt.db.ttDB.getConn();
			/** 장바구니 목록 가져와서 삭제한 물건 빼기 */
			String list = favorProductList(id); // 가져온 리스트
			String list_arr[] = list.split("/");

			String arr = "";
			String idx_s = Integer.toString(idx); // 글번호
			int a = list.indexOf(idx_s); // 글번호 숫자

			for (int i = 0; i < list_arr.length; i++) {
				if (!(list_arr[i].equals(idx_s))) {
					if (arr.equals("")) {
						arr += list_arr[i];
					} else {
						arr = arr + "/" + list_arr[i];
					}
				}
			}

			String sql = "update tt_member set list=? where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, arr);
			ps.setString(2, id);

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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	// -----------------------------------------------------------------//
	/** 관리자 전용 기능 */
	/** 회원관리 */
	/** 1. 회원정보 */
	/** 1-1.회원정보 보기 */
	public MemberDTO memberInfo(String id) {
		try {
			conn = tt.db.ttDB.getConn();
			String sql = "select * from tt_member where id=?";

			ps = conn.prepareStatement(sql);

			ps.setString(1, id);

			rs = ps.executeQuery();
			MemberDTO mdto = null;
			if (rs.next()) {
				int idx = rs.getInt("idx");
				String name = rs.getString("name");

				String pwd = rs.getString("pwd");
				String addr = rs.getString("addr");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				Date joindate = rs.getDate("joindate");
				String list = rs.getString("list");
				String grade = rs.getString("grade");
				int black = rs.getInt("black");
				int point = rs.getInt("point");

				mdto = new MemberDTO(idx, name, id, pwd, addr, email, tel, joindate, list, grade, black, point);
			}

			return mdto;

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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/** 2. 블랙리스트 관련 */
	/** 2-1.블랙리스트 체크 */
	public int checkBalck(String id) {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "select black from tt_member where id =?";

			ps = conn.prepareStatement(sql);

			ps.setString(1, id);

			rs = ps.executeQuery();
			int black = ERROR;
			if (rs.next()) {
				black = rs.getInt(1);
			}

			if (black == BLACK_NO) {
				return BLACK_NO;
			} else if (black == BLACK_YES) {
				return BLACK_YES;
			} else {
				return ERROR;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

	/** 2-2.블랙리스트 추가 */
	public int addBlack(String id) {
		try {
			if (checkBalck(id) == BLACK_NO) {
				conn = tt.db.ttDB.getConn();

				String sql = "update tt_member set black='-2' where id=?";

				ps = conn.prepareStatement(sql);

				ps.setString(1, id);

				int count = ps.executeUpdate();

				return count;

			} else {
				return ERROR;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/** 2-3.블랙리스트 제거 */
	public int delBlack(String id) {
		try {
			if (checkBalck(id) == BLACK_YES) {
				conn = tt.db.ttDB.getConn();
				System.out.println("블랙삭제하러들어옴 ");
				String sql = "update tt_member set black='0' where id=?";

				ps = conn.prepareStatement(sql);

				ps.setString(1, id);
				System.out.println("id:" + id);
				int count = ps.executeUpdate();

				return count;

			} else {
				return ERROR;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/** 2-4.전체 블랙리스트 불러오기 */
	public ArrayList<String> totalBlack() {
		try {
			conn = tt.db.ttDB.getConn();

			String sql = "select id from tt_member where black=-2";

			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();

			ArrayList<String> bl = new ArrayList<String>();

			while (rs.next()) {

				bl.add(rs.getString("id"));

			}

			return bl;

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
			} catch (Exception e2) {
				e2.printStackTrace();

			}
		}
	}

}
