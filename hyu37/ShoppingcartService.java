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
			pstmt = conn.prepareStatement("select * from shoppingcart natural join include natural join product where customerID = ? ");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Shoppingcart prod  = new Shoppingcart();
				prod.setProducttype(rs.getString(5));
				prod.setProductname(rs.getString(6));
				prod.setPrice(rs.getFloat(11));
				prod.setQuantity(rs.getInt(4));
				prod.setProductID(rs.getInt(1));
				stus.add(prod);
			}
			return stus;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
}
	public boolean updatesc(Shopingcart pro) {

		try {
			pstmt = conn.prepareStatement(
				"update Product set proType=?, ProName=?, proSize=?, infoType=?, info=? where productID =?");
			pstmt.setString(1, pro.getProType());
			pstmt.setString(2, pro.getProName());
			pstmt.setFloat(3, pro.getProSize());
			pstmt.setString(4, pro.getInfoType());
			pstmt.setString(5, pro.getInfo());
			pstmt.setInt(6, pro.getProID());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
