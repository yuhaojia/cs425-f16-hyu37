package service;
import java.sql.*;
import java.util.*;
import model.Address;
import conn.Conn;

public class AddressService {
	private Connection conn;
	private PreparedStatement pstmt;

	public AddressService() {
		conn = new Conn().getConn();
	}

	public boolean addAddr(Address addr) {
		try {
			pstmt = conn.prepareStatement("select * from State where stateName = ?");
			pstmt.setString(1, addr.getStateName());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){	//has this state
				pstmt = conn.prepareStatement("insert into Address values(?,?,?,?,?,?)");
				pstmt.setInt(1, addr.getAddrID());
				pstmt.setString(2, addr.getStreet());
				pstmt.setString(3, addr.getCity());
				pstmt.setString(4, addr.getStateName());
				pstmt.setInt(5, addr.getZipcode());
				pstmt.setString(6, addr.getAddrType());
				pstmt.executeUpdate();
			}
			else{	//do not have this state
				//insert state first
				pstmt = conn.prepareStatement("insert into State values(?)");				
				pstmt.setString(1, addr.getStateName());
				pstmt.executeUpdate();
				
				//then update address
				pstmt = conn.prepareStatement("insert into Address values(?,?,?,?,?,?)");
				pstmt.setInt(1, addr.getAddrID());
				pstmt.setString(2, addr.getStreet());
				pstmt.setString(3, addr.getCity());
				pstmt.setString(4, addr.getStateName());
				pstmt.setInt(5, addr.getZipcode());
				pstmt.setString(6, addr.getAddrType());
				pstmt.executeUpdate();
			}
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public List queryAllCus(int id) {
		List addrs = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from Address natural join associate natural join Customer where customerID = ?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Address addr = new Address();
				addr.setAddrID(rs.getInt(2));
				addr.setStreet(rs.getString(3));
				addr.setCity(rs.getString(4));
				addr.setStateName(rs.getString(5));
				addr.setZipcode(rs.getInt(6));
				addr.setAddrType(rs.getString(7));
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
			pstmt = conn.prepareStatement("select * from Address where addrID=?");
			pstmt.setInt(1, addrID);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Address addr = new Address();
				addr.setAddrID(rs.getInt(1));
				addr.setStreet(rs.getString(2));
				addr.setCity(rs.getString(3));
				addr.setStateName(rs.getString(4));
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

	public boolean updateCus(Address addr) {

		try {
			pstmt = conn
					.prepareStatement("update  Address set street=?, city=?,stateName=?,zipcode=?,addrType=? where addrID=?");
			pstmt.setString(1, addr.getStreet());
			pstmt.setString(2, addr.getCity());
			pstmt.setString(3, addr.getStateName());
			pstmt.setInt(4, addr.getZipcode());
			pstmt.setString(5, addr.getAddrType());
			pstmt.setInt(6, addr.getAddrID());
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
			//pstmt = conn.prepareStatement("delete from Address where stateName=?");
			//pstmt.setString(1, addr.getStateName());
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