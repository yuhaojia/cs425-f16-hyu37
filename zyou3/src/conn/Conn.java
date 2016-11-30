package conn;

import java.sql.*;

public class Conn {
	public Connection getConn(){
		Connection conn = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");	//load driver
			String serverName = "fourier.cs.iit.edu";
		    String portNumber = "1521";
		    String sid = "orcl";
			String url = "jdbc:oracle:thin:@" + serverName + ":" + portNumber + ":" + sid;
		    String username = "zyou3";
		    String password = "zyou33";
		    conn = DriverManager.getConnection(url, username, password);	//connect to server
		    System.out.println(conn.getMetaData().getURL());	//Test for success
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return conn;
	}
}
