package service;

import java.sql.*;

import conn.Conn;
	
public class checkoutService {
	private Connection conn;
	private PreparedStatement pstmt;
	
	public checkoutService(){
		conn = new Conn().getConn();	//establish connection
	}
	
	public float getBalance(int id){
		try{
			pstmt = conn.prepareStatement("select customerID from shoppingcart where shopID = ?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			int customerID = 0;
			while(rs.next()){
				customerID = rs.getInt(1);
			}
			
			pstmt = conn.prepareStatement("select balance from customer where customerID = ?");
			pstmt.setInt(1, customerID);
			rs = pstmt.executeQuery();
			float balance = 0;
			while(rs.next()){
				balance = rs.getFloat(1);
			}
			if(balance != 0){
				return balance;
			}
			else{
				return -1;
			}
		}
		catch(SQLException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}
	
	public float cost(int id){
		try{
			pstmt = conn.prepareStatement("select statePrice, quantity from include natural join product natural join "
					+ "priceperstate where shopID = ?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			float quantity = 0;
			float price = 0;
			float total = 0;
			while(rs.next()){
				price = rs.getFloat(1);
				quantity = rs.getInt(2);
				total += price * quantity;				
			}
			return total;
		}
		catch(SQLException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}
	
	public float net(int id){
		return getBalance(id) - cost(id);
	}
	
	public boolean decreaseBalance(int id){
		float remain = net(id);
		if(remain < 0){
			return false;
		}
		else{
			try{
				pstmt = conn.prepareStatement("select customerID from shoppingcart where shopID = ?");
				pstmt.setInt(1, id);
				ResultSet rs = pstmt.executeQuery();
				int customerID = 0;
				while(rs.next()){
					customerID = rs.getInt(1);
				}
				
				pstmt = conn.prepareStatement("update Customer set balance = ? where customerID = ?");
				pstmt.setFloat(1, remain);
				pstmt.setInt(2, customerID);
				pstmt.executeUpdate();
				return true;
			}
			catch(SQLException e){
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
	}
}
