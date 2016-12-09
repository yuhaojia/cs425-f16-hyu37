package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.Conn;
import model.PricePerState;
import model.Stock;;
public class StockService {
	private Connection conn;
	private PreparedStatement pstmt;
	public StockService(){
		conn = new Conn().getConn();
	}
	public List queryAllstock() {
		List stus = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from stock");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Stock pps = new Stock();
				pps.setProductID(rs.getInt(1));
				pps.setWareHouseID(rs.getInt(2));
				pps.setQuanity(rs.getInt(3));
				stus.add(pps);
			}
			return stus;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
	public boolean addstock(Stock pps) {
		try {
			pstmt = conn.prepareStatement("insert into stock values(?,?,?)");
				pstmt.setInt(1, pps.getProductID());
			pstmt.setInt(2, pps.getWareHouseID());
			pstmt.setInt(3, pps.getQuanity());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
}
