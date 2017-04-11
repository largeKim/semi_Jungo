package tt.db;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class ttDB {
	static DataSource ds; // 스태틱이 발동될떄 같이 발동되도록 만들어줌
	
	static{ 
		//스태틱 영역은 누가 호출하는 기능이 아니라 프로그램이 시작하면 무조건 실행되는 영역
		try{
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public static Connection getConn() throws Exception{
		return ds.getConnection();
	}
}
