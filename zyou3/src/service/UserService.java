package service;

import java.sql.*;
import conn.*;
import model.*;

public class UserService {
	private Connection conn;
	private PreparedStatement pstmt;
	
	public UserService(){
		conn = new Conn().getConn();	//establish connection
	}
	
	public boolean validateCustomer(User u){
		try{
			pstmt = conn.prepareStatement("select * from Customer where customerID = ?");
			pstmt.setString(1, String.valueOf(u.getID()));
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				return true;
			}
			else{
				return false;
			}
		}
		catch(SQLException e){
			e.printStackTrace();
			return false;
		}		
	}
	
	public boolean validateStaff(User u){
		try{
			pstmt = conn.prepareStatement("select * from Staff where staffID = ?");
			pstmt.setString(1, String.valueOf(u.getID()));
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				return true;
			}
			else{
				return false;
			}
		}
		catch(SQLException e){
			e.printStackTrace();
			return false;
		}		
	}
	
}
