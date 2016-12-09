package service;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import conn.Conn;
import model.PricePerState;
public class PriceService {
	private Connection conn;
	private PreparedStatement pstmt;
	public PriceService(){
		conn = new Conn().getConn();
	}
	public boolean addPrice(PricePerState pps) {
		try {
			//insert into PricePerState
			//Price can only inserted when this product exsits
			pstmt = conn.prepareStatement("insert into pricePerState values(?,?,?)");
			pstmt.setString(1, pps.getstateName());
			pstmt.setInt(2, pps.getProductID());
			pstmt.setFloat(3, pps.getStatePrice());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public List queryAllpps() {
		List stus = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from PricePerState natural join product ");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				PricePerState pps = new PricePerState();
				pps.setProductID(rs.getInt(1));
				pps.setstateName(rs.getString(2));
				pps.setStatePrice(rs.getFloat(3));
				pps.setProtype(rs.getString(4));
				pps.setProname(rs.getString(5));
				stus.add(pps);
			}
			return stus;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
	public Boolean deletepps(PricePerState pps) {
		try {
			pstmt = conn.prepareStatement("delete from PricePerState where stateName=? and productID=?");
			pstmt.setString(1, pps.getstateName());
			pstmt.setInt(2, pps.getProductID());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}
	}


	public 	PricePerState querystatePrice(float statePrice) {
		// List stus = new ArrayList();
		try {
			pstmt = conn
					.prepareStatement("select * from PricePerState where statePrice=?");
			pstmt.setFloat(1, statePrice);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				PricePerState pps = new PricePerState();
				pps.setstateName(rs.getString(1));
				pps.setProductID(rs.getInt(2));
				pps.setStatePrice(rs.getFloat(3));
				return pps;

			}
			return null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public boolean updatepro(PricePerState pps) {

		try {
			pstmt = conn.prepareStatement("update  PricePerState set statePrice=? where productID=? , stateName=?");
			pstmt.setFloat(1, pps.getStatePrice());
			pstmt.setInt(2, pps.getProductID());
				pstmt.setString(3, pps.getstateName());
			pstmt.executeUpdate();
		
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

}
