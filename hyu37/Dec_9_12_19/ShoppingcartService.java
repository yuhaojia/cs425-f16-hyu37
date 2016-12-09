package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Shoppingcart;
import conn.Conn;
import model.Product;

public class ShoppingcartService {
	private Connection conn;
	private PreparedStatement pstmt;
	public ShoppingcartService(){
		conn = new Conn().getConn();	//establish connection
	}


	public List queryAllsc(int id) {
		List stus = new ArrayList();
		try {
			pstmt = conn.prepareStatement(
				"select * from shoppingcart natural join include natural join product natural join priceperstate where customerID = ?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Shoppingcart prod  = new Shoppingcart();
				prod.setProductID(rs.getInt(1));
				prod.setQuantity(rs.getInt(4));
				prod.setProductname(rs.getString(6));
				prod.setProducttype(rs.getString(5));				
				prod.setPrice(rs.getFloat(11));				
				stus.add(prod);
			}
			return stus;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public List queryAllproByType(String type) {
		List stus = new ArrayList();
		try {
			pstmt = conn.prepareStatement(
				"select * from shoppingcart natural join include natural join product natural join priceperstate where proType = ?");
			pstmt.setString(1, type);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Shoppingcart prod  = new Shoppingcart();
				prod.setProductID(rs.getInt(1));
				prod.setQuantity(rs.getInt(4));
				prod.setProductname(rs.getString(6));
				prod.setProducttype(rs.getString(5));				
				prod.setPrice(rs.getFloat(11));				
				stus.add(prod);
			}
			return stus;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public boolean addsc(Shoppingcart pro) {

		try {
			pstmt = conn.prepareStatement("insert into include values(?,?,?)");
			
			pstmt.setInt(1, pro.getShopID());
			pstmt.setInt(2, pro.getProductID());
			pstmt.setInt(3, pro.getQuantity());
			
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	
	public boolean updatesc(Shoppingcart pro) {
		try {
			pstmt = conn.prepareStatement(
				"update include set quantity=? where productID =?");
			pstmt.setInt(1, pro.getQuantity());
			pstmt.setInt(2, pro.getProductID());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
