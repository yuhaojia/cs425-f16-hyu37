package service;
import java.sql.*;
import java.util.*;
import model.*;
import conn.Conn;

public class ProductService {
	private Connection conn;
	private PreparedStatement pstmt;
	public ProductService(){
		conn = new Conn().getConn();	//establish connection
	}
/*
	public String getProType() 
	{
		try
		{
			pstmt = conn.prepareStatement("select * from product where productID = ?");
		
		//pstmt.setString());
		String rs = pstmt.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
*/	
	public boolean addProduct(Product pro) {
		try {
			pstmt = conn.prepareStatement("insert into Product"
					+ "(proType,proName,proSize) "
					+ "values(?,?,?)");
			pstmt.setString(1, pro.getProType());
			pstmt.setString(2, pro.getProName());
			pstmt.setString(3, pro.getProSize());

			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
			return false;
		}

	}

	/*
	public String getProName(int a)
	{
		
		try
		{
			pstmt = conn.prepareStatement("select * from product where productID = ?");
		
		pstmt.setString();
		String rs = pstmt.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public int getProSize() 
	{
		try
		{
			pstmt = conn.prepareStatement("select * from product where productID = ?");
		
		pstmt.setString();
		String rs = pstmt.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	*/

	public List queryAllPro() {
		List pros = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from Product");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Product pro = new Product();
				pro.setProType(rs.getString(1));
				pro.setProName(rs.getString(2));
				pro.setProSize(rs.getString(3));
				/*
				if (rs.getDate(5) != null)
					stu.(rs.getDate(5).toString());
				pro.(rs.getString(6));
				if (rs.(7) != null)
					stu.(rs.getString(7).split("&"));
				if (rs.getString(8) != null)
					stu.(rs.getString(8).split("&"));
				pro.(rs.getString(9));
				*/
				pros.add(pro);

			}
			return pros;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
	/*	
	public Product queryPro(int id) {
		// List stus = new ArrayList();
		try {
			pstmt = conn
					.prepareStatement("select");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
		
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

	public boolean updateProduct(product pro) {

		try {
			pstmt = conn
					.prepareStatement();
			pstmt.setString(1, stu.());
			pstmt.setString(2, stu.());
			pstmt.setByte(3, stu.());
			pstmt.setString(4, stu.());
			pstmt.setString(5, stu.());
			pstmt.setString(6, stu.());
			pstmt.setString(7, stu.());
			pstmt.setString(8, stu.());
			pstmt.setInt(9, stu.());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public Boolean deletePro(int id) {

		try {
			pstmt = conn.prepareStatement("delete from  studentinfo where id=?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}

	}
	*/
	
}
