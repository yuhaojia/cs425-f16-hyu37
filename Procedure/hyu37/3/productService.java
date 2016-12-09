package service;
import java.sql.*;

import conn.Conn;
public class productService {
	private Connection conn;
	private PreparedStatement pstmt;
	public productService(){
		conn = new Conn().getConn();	//establish connection
	}

	public String getProType() 
	{
		try
		{
			pstmt = conn.prepareStatement("select * from product where productID = ?");
		
		pstmt.setString());
		String rs = pstmt.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public boolean addProduct(product pr) {
		try {
			pstmt = conn.prepareStatement("insert into prodentinfo"
					+ "() "
					+ ");"
			pstmt.setString(1, pro.());
			pstmt.setString(2, pro.());
			pstmt.setByte(3, pro.());
			pstmt.setString(4, pro.());
			pstmt.setString(5, pro.());
			pstmt.setString(6, pro.());
			pstmt.setString(7, pro.());
			pstmt.setString(8, pro.());

			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
			return false;
		}

	}

	
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
	

	public List queryAllPro() {
		List pros = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from prodentinfo");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				pro.setId(rs.getInt(1));
				pro.(rs.getString(2));
				pro.(rs.getString(3));
				pro.(rs.getByte(4));
				if (rs.getDate(5) != null)
					pro.(rs.getDate(5).toString());
				pro.(rs.getString(6));
				if (rs.(7) != null)
					pro.(rs.getString(7).split("&"));
				if (rs.getString(8) != null)
					pro.(rs.getString(8).split("&"));
				pro.(rs.getString(9));
				pro.add(pro);

			}
			return pros;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public product queryPro(int id) {
		// List pros = new ArrayList();
		try {
			pstmt = conn
					.prepareStatement("select");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				
				pro.setId(rs.getInt(1));
				pro.setNicheng(rs.getString(2));
				pro.setTruename(rs.getString(3));
				pro.setXb(rs.getByte(4));
				if (rs.getDate(5) != null)
					pro.setCsrq(rs.getDate(5).toString());
				pro.setZy(rs.getString(6));
				if (rs.getString(7) != null)
					pro.setKc(rs.getString(7).split("&"));
				if (rs.getString(8) != null)
					pro.setXq(rs.getString(8).split("&"));
				pro.setBz(rs.getString(9));
				// pros.add(pro);
				return pro;

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
			pstmt.setString(1, pro.());
			pstmt.setString(2, pro.());
			pstmt.setByte(3, pro.());
			pstmt.setString(4, pro.());
			pstmt.setString(5, pro.());
			pstmt.setString(6, pro.());
			pstmt.setString(7, pro.());
			pstmt.setString(8, pro.());
			pstmt.setInt(9, pro.());
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
			pstmt = conn.prepareStatement("delete from  prodentinfo where id=?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}

	}
	
	
}
