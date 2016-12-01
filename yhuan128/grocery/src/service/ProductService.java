package service;
import java.sql.*;

import conn.Conn;
public class ProductService {
	private Connection conn;
	private PreparedStatement pstmt;
	public ProductService(){
		conn = new Conn().getConn();	//establish connection
	}

	public String getProType() 
	{
		try
		{
			pstmt = conn.prepareStatement("select * from product where productID = ?");
		
		pstmt.setString());
		String rs = pstmt.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public String getProName(int a)
	{
		
		try
		{
			pstmt = conn.prepareStatement("select * from product where productID = ?");
		
		pstmt.setString();
		String rs = pstmt.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public int getProSize() 
	{
		try
		{
			pstmt = conn.prepareStatement("select * from product where productID = ?");
		
		pstmt.setString();
		String rs = pstmt.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	
}
