package service;

import java.sql.*;
import conn.*;
import model.*;

public class UserService {
	private Connection conn;
	private Connection pstmt;
	
	public UserService(){
		conn = new Conn().getConn();	//establish connection
	}
	
	
}
