package service;
import java.sql.*;

import conn.Conn;
public class WarehouseService {
	private Connection conn;
	private PreparedStatement pstmt;
	public WarehouseService(){
		conn = new Conn().getConn();	
	}
	public String getcapacity() 
	{
		try
		{
			pstmt = conn.prepareStatement("select * from warehouse where  = ?");
		
		pstmt.setString();
		String rs = pstmt.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public String getaddrID(int a)
	{
		
		try
		{
			pstmt = conn.prepareStatement("select * from warehouse where = ?");
		
		pstmt.setString();
		String rs = pstmt.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public String getWarehouseID() 
	{
		try
		{
			pstmt = conn.prepareStatement("select * from warehouse where = ?");
		
		pstmt.setString();
		String rs = pstmt.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
}
