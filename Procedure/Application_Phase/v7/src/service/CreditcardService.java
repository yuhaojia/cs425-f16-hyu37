package service;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;
import model.Creditcard;
import conn.Conn;

public class CreditcardService {
	private Connection conn;
	private PreparedStatement pstmt;

	public CreditcardService() {
		conn = new Conn().getConn();
	}

	public boolean addCred(Creditcard cred) {
		try {
			pstmt = conn.prepareStatement("insert into CreditCard values(?,?,?,?,?)");
			pstmt.setLong(1, cred.getCardNum());
			pstmt.setString(2, cred.getExpDate());
			pstmt.setString(3, cred.getHolder());
			pstmt.setInt(4, cred.getCustomerID());
			pstmt.setInt(5, cred.getAddrID());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	public List queryAllCus(int id) {
		List creds = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from CreditCard natural join Address where customerID =?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()){
				Creditcard cred = new Creditcard();
				cred.setCardNum(rs.getLong(2));
				cred.setExpDate(rs.getString(3));
				cred.setHolder(rs.getString(4));
				cred.setCustomerID(rs.getInt(5));
				cred.setAddrID(rs.getInt(1));				
				creds.add(cred);
			}
			return creds;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public Creditcard queryCusbyID(long cardnumb) {
		// List cuses = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from CreditCard where cardNum = ?");
			pstmt.setLong(1, cardnumb);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Creditcard cred = new Creditcard();
				cred.setCardNum(rs.getLong(1));
				cred.setExpDate(rs.getString(2));
				cred.setHolder(rs.getString(3));
				cred.setCustomerID (rs.getInt(4));
				cred.setAddrID (rs.getInt(5));			
				return cred;
			}
			return null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public boolean updateCus(Creditcard cred) {

		try {
			pstmt = conn.prepareStatement("update CreditCard set cardNum=?, expDate=?, holder=?, customerID=?, addrID=? where cardNum=?");
			pstmt.setLong(1, cred.getCardNum());
			pstmt.setString(2, cred.getExpDate());
			pstmt.setString(3, cred.getHolder());
			pstmt.setInt(4, cred.getCustomerID());
			pstmt.setInt(5, cred.getAddrID());
			pstmt.setLong(6, cred.getCardNum());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public Boolean deleteCus(Creditcard cred) {
		try {
			pstmt = conn.prepareStatement("delete from CreditCard where cardNum=?");
			pstmt.setLong(1, cred.getCardNum());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}

	}
}