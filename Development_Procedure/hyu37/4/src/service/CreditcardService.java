package service;
import java.sql.*;
import java.util.*;
import model.*;
import conn.Conn;

public class CreditcardService {
	private Connection conn;
	private PreparedStatement pstmt;

	public CreditcardService() {
		conn = new Conn().getConn();
	}

	public boolean addCred(Creditcard cred) {
		try {
			pstmt = conn.prepareStatement("insert into Creditcard"
					+ "(cardNum,expDate,holder) "
					+ "values(?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, cred.getCardNum());
			pstmt.setDate(2, cred.getExpDate());
			pstmt.setString(3, cred.getHolder());
			

			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
			return false;
		}

	}

	public List queryAllCus() {
		List creds = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from Creditcard");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Creditcard cred = new Creditcard();
				cred.setCardNum(rs.getInt(1));
				cred.setExpDate(rs.getDate(2));
				cred.setHolder(rs.getString(3));
				
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
			pstmt = conn.prepareStatement("select * from Creditcard");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Creditcard cred = new Creditcard();
				cred.setCardNum(rs.getInt(1));
				cred.setExpDate(rs.getDate(2));
				cred.setHolder(rs.getString(3));
				
				
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
			pstmt = conn
					.prepareStatement("update  Creditcard set cardNum=? , expDate=? , holder=? where cardNum=?");
			pstmt.setInt(1, cred.getCardNum());
			pstmt.setDate(2, cred.getExpDate());
			pstmt.setString(3, cred.getHolder());
			
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public Boolean deleteCus(int cardNumb) {

		try {
			pstmt = conn.prepareStatement("delete from  Customer where cardNum=?");
			pstmt.setInt(1, cardNumb);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}

	}
}