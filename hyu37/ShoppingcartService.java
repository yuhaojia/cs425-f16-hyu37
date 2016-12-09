package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Shoppingcart;
import conn.Conn;
import model.PricePerState;
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
	public 	Shoppingcart querystatescID(int id) {
		// List stus = new ArrayList();
		try {
			pstmt = conn
					.prepareStatement("select * from shoppingcart natural join include natural join product natural join priceperstate where shopID=?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				Shoppingcart prod = new Shoppingcart();
				prod.setProductID(rs.getInt(1));
				prod.setShoppingID(rs.getInt(2));
				prod.setQuantity(rs.getInt(4));
				prod.setProductname(rs.getString(6));
				prod.setProducttype(rs.getString(5));				
				prod.setPrice(rs.getFloat(11));
				return prod;

			}
			return null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
}
	public Boolean deletesc(Shoppingcart pps) {
		try {
			pstmt = conn.prepareStatement("delete from include where shopID=? and productID=?");
			pstmt.setInt(1, pps.getShoppingID());
			pstmt.setInt(2, pps.getProductID());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}
	}
}
