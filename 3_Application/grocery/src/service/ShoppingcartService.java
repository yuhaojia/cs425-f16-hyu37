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
				prod.setShopID(rs.getInt(2));
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

	public List queryAllproByType(int id, String type) {
		List stus = new ArrayList();
		try {
			pstmt = conn.prepareStatement(
					  "select * "
					+ "from Customer c, associate a,"
					+ "Address ad, State s, PricePerState pps, Product p "
					+ "where c.customerID = a.customerID and a.addrID = ad.addrID "
					+ "and ad.stateName = s.stateName and s.stateName = pps.stateName "
					+ "and pps.productID = p.productID and p.proType = ? and c.customerID = ?");
			pstmt.setString(1, type);
			pstmt.setInt(2, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Product prod = new Product();
				prod.setProID(rs.getInt(15));
				prod.setProType(rs.getString(18));
				prod.setProName(rs.getString(19));
				prod.setProSize(rs.getFloat(20));
				prod.setInfoType(rs.getString(21));
				prod.setInfo(rs.getString(22));
				stus.add(prod);
			}
			return stus;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public boolean addsc(int id, Product pro) {
		try {
			pstmt = conn.prepareStatement("select shopID from Shoppingcart where customerID = ?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			int shopID = 0;
			while(rs.next()){
				shopID = rs.getInt(1);
			}
			pstmt = conn.prepareStatement("insert into include values(?,?,?)");			
			pstmt.setInt(1, shopID);
			pstmt.setInt(2, pro.getProID());
			pstmt.setInt(3, 1);			
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
	
	public Shoppingcart querystatescID(int id) {
		// List stus = new ArrayList();
		try {
			pstmt = conn
					.prepareStatement("select * from shoppingcart natural join include natural join product natural join priceperstate where shopID=?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				Shoppingcart prod = new Shoppingcart();
				prod.setProductID(rs.getInt(1));
				prod.setShopID(rs.getInt(2));
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
			pstmt.setInt(1, pps.getShopID());
			pstmt.setInt(2, pps.getProductID());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}
	}
}
