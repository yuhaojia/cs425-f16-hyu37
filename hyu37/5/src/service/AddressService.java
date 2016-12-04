package service;
import java.sql.*;
import java.util.*;
import model.*;
import conn.Conn;

public class AddressService {
	private Connection conn;
	private PreparedStatement pstmt;

	public AddressService() {
		conn = new Conn().getConn();
	}

	public boolean addCus(Address addr) {
		try {
			pstmt = conn.prepareStatement("insert into Address"
					+ "(street,city,state,zipcode,addrType) "
					+ "values(?,?,?,?,?)");
			pstmt.setInt(1, addr.getAddrID());
			pstmt.setString(2, addr.getStreet());
			pstmt.setString(3, addr.getCity());
			pstmt.setString(4, addr.getState());
			pstmt.setInt(5, addr.getZipcode());
			pstmt.setString(6, addr.getAddrType());
			

			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
			return false;
		}

	}

	public List queryAllCus() {
		List addrs = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from Address");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Address addr = new Address();
				addr.setAddrID(rs.getInt(1));
				addr.setStreet(rs.getString(2));
				addr.setCity(rs.getString(3));
				addr.setState(rs.getString(4));
				addr.setZipcode(rs.getInt(5));
				addr.setAddrType(rs.getString(6));
				
				addrs.add(addr);

			}
			return addrs;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public Address queryCusbyID(int addrID) {
		// List cuses = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from Address");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Address addr = new Address();
				addr.setAddrID(rs.getInt(1));
				addr.setStreet(rs.getString(2));
				addr.setCity(rs.getString(3));
				addr.setState(rs.getString(4));
				addr.setZipcode(rs.getInt(5));
				addr.setAddrType(rs.getString(6));
				return addr;

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
					.prepareStatement("update  Address set street=?,city=?,state=?,zipcode=?,addrType=? where addrID=?");
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

	public Boolean deleteCus(int addrID) {

		try {
			pstmt = conn.prepareStatement("delete from Address where addrID=?");
			pstmt.setInt(1, addrID);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}

	}
}