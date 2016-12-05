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
			pstmt = conn.prepareStatement("insert into Product values(?,?,?,?,?)");
			pstmt.setString(1, pro.getProType());
			pstmt.setString(2, pro.getProName());
			pstmt.setFloat(3, pro.getProSize());
			pstmt.setString(4, pro.getInfoType());
			pstmt.setString(5, pro.getInfo());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	public List queryAllpro() {
		List stus = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from Product");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Product prod = new Product();
				prod.setProType(rs.getString(1));
				prod.setProName(rs.getString(2));
				prod.setProSize(rs.getFloat(3));
				prod.setInfoType(rs.getString(4));
				prod.setInfo(rs.getString(5));
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
			pstmt = conn.prepareStatement("delete from Product where infoType=? and info=?");
			pstmt.setString(1, pro.getInfoType());
			pstmt.setString(2, pro.getInfo());
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement("delete from Product where proname=?");
			pstmt.setString(1, pro.getProName());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}
	}


	public 	Product queryproname(String proname) {
		// List stus = new ArrayList();
		try {
			pstmt = conn
					.prepareStatement("select * from Product where proName=?");
			pstmt.setString(1, proname);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				Product pro = new Product();
				pro.setProType(rs.getString(1));
				pro.setProName(rs.getString(2));
				pro.setProSize(rs.getFloat(3));
				pro.setInfoType(rs.getString(4));
				pro.setInfo(rs.getString(5));
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
			pstmt = conn
					.prepareStatement("update  Product set proType=? , ProName=? , proSize=? ,infoType=? ,"
							+ " info=?f");
			pstmt.setString(1, pro.getProType());
			pstmt.setString(2, pro.getProName());
			pstmt.setFloat(3, pro.getProSize());
			pstmt.setString(4, pro.getInfoType());
			pstmt.setString(5, pro.getInfo());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	

	}
	

