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
			pstmt = conn.prepareStatement("insert into Product"
					+ "(proType,proName,proSize,infoType,info) "
					+ "values(?,?,?,?,?)");
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
	public Boolean deleteStu(String proname) {

		try {
			pstmt = conn.prepareStatement("delete from Product where proName=?");
			pstmt.setString(1, proname);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}

	/*public stuInfo queryStubyID(int id) {
		// List stus = new ArrayList();
		try {
			pstmt = conn
					.prepareStatement("select * from studentinfo where id=?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				stuInfo stu = new stuInfo();
				stu.setId(rs.getInt(1));
				stu.setNicheng(rs.getString(2));
				stu.setTruename(rs.getString(3));
				stu.setXb(rs.getByte(4));
				if (rs.getDate(5) != null)
					stu.setCsrq(rs.getDate(5).toString());
				stu.setZy(rs.getString(6));
				if (rs.getString(7) != null)
					stu.setKc(rs.getString(7).split("&"));
				if (rs.getString(8) != null)
					stu.setXq(rs.getString(8).split("&"));
				stu.setBz(rs.getString(9));
				// stus.add(stu);
				return stu;

			}
			return null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public boolean updateStu(stuInfo stu) {

		try {
			pstmt = conn
					.prepareStatement("update  studentinfo set nicheng=? , truename=? , xb=? ,csrq=? ,"
							+ " zy=? ,kc=? , xq=?, bz=?   where id=?");
			pstmt.setString(1, stu.getNicheng());
			pstmt.setString(2, stu.getTruename());
			pstmt.setByte(3, stu.getXb());
			pstmt.setString(4, stu.getCsrq());
			pstmt.setString(5, stu.getZy());
			pstmt.setString(6, stu.getKcs());
			pstmt.setString(7, stu.getXqs());
			pstmt.setString(8, stu.getBz());
			pstmt.setInt(9, stu.getId());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	

	}*/
	
}
