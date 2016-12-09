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
			pstmt = conn.prepareStatement("insert into State"
					+ "(stateName) "
					+ "values(?)");
			
			pstmt.setString(1, addr.getStateName());

			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("insert into Address"
					+ "(street,city,state,zipcode,addrType) "
					+ "values(?,?,?,?,?)");
			pstmt.setInt(1, addr.getAddrID());
			pstmt.setString(2, addr.getStreet());
			pstmt.setString(3, addr.getCity());
			pstmt.setString(4, addr.getStateName());
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
				addr.setStateName(rs.getString(4));
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
				addr.setStateName(rs.getString(4));
				addr.setZipcode(rs.getInt(5));
				addr.setAddrType(rs.getString(6));
				addr.setStateName(rs.getString(7));
				return addr;

			}
			return null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public boolean updateCus(Address addr) {

		try {
			pstmt = conn
					.prepareStatement("update  Address set street=?,city=?,state=?,zipcode=?,addrType=?, StateName=? where addrID=?");
			pstmt.setInt(1, addr.getAddrID());
			pstmt.setString(2, addr.getStreet());
			pstmt.setString(3, addr.getCity());
			pstmt.setString(4, addr.getStateName());
			pstmt.setInt(5, addr.getZipcode());
			pstmt.setString(6, addr.getAddrType());
			pstmt.setString(7, addr.getStateName());
			/*
			addr.setAddrID(rs.getInt(1));
			addr.setStreet(rs.getString(2));
			addr.setCity(rs.getString(3));
			addr.setState(rs.getString(4));
			addr.setZipcode(rs.getInt(5));
			addr.setAddrType(rs.getString(6));
			*/
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public Boolean deleteCus(Address addr) {

		try {
			pstmt = conn.prepareStatement("delete from State where stateName=?");
			pstmt.setString(1, addr.getStateName());
			pstmt = conn.prepareStatement("delete from Address where addrID=?");
			pstmt.setInt(1, addr.getAddrID());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}

	}
}