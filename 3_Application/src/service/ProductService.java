package service;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Product;

import conn.Conn;
public class ProductService {
	private Connection conn;
	private PreparedStatement pstmt;
	public ProductService(){
		conn = new Conn().getConn();	//establish connection
	}

	public boolean addPro(Product pro) {
		try {
			//insert into Info first
			pstmt = conn.prepareStatement("insert into Info values(?,?)");
			pstmt.setString(1, pro.getInfoType());
			pstmt.setString(2, pro.getInfo());
			pstmt.executeUpdate();
			
			//insert into Product
			pstmt = conn.prepareStatement("insert into Product values(?,?,?,?,?,?)");
			pstmt.setInt(1, pro.getProID());
			pstmt.setString(2, pro.getProType());
			pstmt.setString(3, pro.getProName());
			pstmt.setFloat(4, pro.getProSize());
			pstmt.setString(5, pro.getInfoType());
			pstmt.setString(6, pro.getInfo());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
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

	public List queryAllpro() {
		List stus = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from Product");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Product prod = new Product();
				prod.setProID(rs.getInt(1));
				prod.setProType(rs.getString(2));
				prod.setProName(rs.getString(3));
				prod.setProSize(rs.getFloat(4));
				prod.setInfoType(rs.getString(5));
				prod.setInfo(rs.getString(6));
				stus.add(prod);
			}
			return stus;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
	public Boolean deletepro(Product pro) {
		try {
			pstmt = conn.prepareStatement("delete from Product where productID = ?");
			pstmt.setInt(1, pro.getProID());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}
	}


	public Product queryproid(int id) {
		// List stus = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from Product where productID=?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				Product pro = new Product();
				pro.setProID(rs.getInt(1));
				pro.setProType(rs.getString(2));
				pro.setProName(rs.getString(3));
				pro.setProSize(rs.getFloat(4));
				pro.setInfoType(rs.getString(5));
				pro.setInfo(rs.getString(6));
				return pro;

			}
			return null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public boolean updatepro(Product pro) {

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
	

