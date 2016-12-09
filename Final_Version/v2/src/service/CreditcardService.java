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

	public List queryAllCus() {
		List creds = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from CreditCard");
			//pstmt = conn.prepareStatement("select * from CreditCard  where customerID=?");
			//pstmt.setInt(1, custID);
			//pstmt.executeUpdate();
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()){
				Creditcard cred = new Creditcard();
				cred.setCardNum(rs.getLong(1));
				cred.setExpDate(rs.getString(2));
				cred.setHolder(rs.getString(3));
				cred.setCustomerID(rs.getInt(4));
				cred.setAddrID(rs.getInt(5));				
				creds.add(cred);
			}
			return creds;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	
	////what?
	public Creditcard queryCusbyID(int cardnumb) {
		// List cuses = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from CreditCard");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Creditcard cred = new Creditcard();
				cred.setCardNum(rs.getLong(1));
				cred.setExpDate(rs.getString(2));
				cred.setHolder(rs.getString(3));
				cred.setCustomerID (rs.getInt(4));
				cred.setAddrID (rs.getInt(5));			
				// cuses.add(cus);
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
			pstmt = conn.prepareStatement("update CreditCard set cardNum=?, expDate=?, holder=?, customerID=?, addrID=? "
					+ "where cardNum=?");
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

	public Boolean deleteCus(Creditcard cred) {

		try {
			pstmt = conn.prepareStatement("delete from  Customer where cardNum=?");
			pstmt.setInt(1, cred.getCustomerID());
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement("delete from  Address where cardNum=?");
			pstmt.setInt(1, cred.getAddrID());
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement("delete from  CreditCard where cardNum=?");
			pstmt.setLong(1, cred.getCardNum());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}

	}
}