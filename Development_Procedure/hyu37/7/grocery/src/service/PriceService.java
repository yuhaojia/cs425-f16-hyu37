package service;
import java.sql.*;

import conn.Conn;
public class PriceService {
	private Connection conn;
	private PreparedStatement pstmt;
	public PriceService(){
		conn = new Conn().getConn();
	}
	public int getaddrID() 
	{
		try
		{
			pstmt = conn.prepareStatement("select * from pricePerState where = ?");
			pstmt.setString();
			pstmt.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public String getproType() 
	{
		try
		{
			pstmt = conn.prepareStatement("select * from pricePerState where = ?");
		
			pstmt.setString();
			pstmt.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public String getproName() 
	{
		try
		{
			pstmt = conn.prepareStatement("select * from pricePerState where = ?");
		
		pstmt.setString();
			pstmt.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public float getstatePrice() 
	{
		try
		{
			pstmt = conn.prepareStatement("select * from pricePerState where = ?");
		
		pstmt.setString();
			pstmt.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
}
