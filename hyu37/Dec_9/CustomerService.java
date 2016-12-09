package service;
import java.sql.*;
import java.util.*;
import model.*;
import conn.Conn;

public class CustomerService {
	private Connection conn;
	private PreparedStatement pstmt;

	public CustomerService() {
		conn = new Conn().getConn();
	}

	public boolean addCus(Customer cus) {
		try {
			pstmt = conn.prepareStatement("insert into Customer"
					+ "(lastName,firstName,balance) "
					+ "values(?,?,?)");
			pstmt.setString(1, cus.getLastName());
			pstmt.setString(2, cus.getFirstName());
			pstmt.setDouble(3, cus.getBalance());
			

			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
			return false;
		}

	}

	public List queryAllCus(int IDID) {
		List cuses = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from Customer");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()&&(rs.getInt(1)==IDID)) {
				Customer cus = new Customer();
				cus.setID(rs.getInt(1));
				cus.setBalance(rs.getDouble(2));
				cus.setLastName(rs.getString(3));
				cus.setFirstName(rs.getString(4));
				cuses.add(cus);

			}
			return cuses;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public Customer queryCusbyID(int id) {
		// List cuses = new ArrayList();
		try {
			pstmt = conn
					.prepareStatement("select * from Customer where id=?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				Customer cus = new Customer();
				cus.setID(rs.getInt(1));
				cus.setLastName(rs.getString(2));
				cus.setFirstName(rs.getString(3));
				cus.setBalance(rs.getDouble(4));
				// cuses.add(cus);
				return cus;

			}
			return null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public boolean updateCus(Customer cus) {

		try {
			pstmt = conn
					.prepareStatement("update  Customer set lastName=? , firstName=? , balance=? where id=?");
			pstmt.setString(1, cus.getLastName());
			pstmt.setString(2, cus.getFirstName());
			pstmt.setDouble(3, cus.getBalance());
			
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public Boolean deleteCus(int id) {

		try {
			pstmt = conn.prepareStatement("delete from  Customer where id=?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}

	}
}