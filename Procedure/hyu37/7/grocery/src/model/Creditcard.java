package model;

import java.sql.Date;

public class Creditcard {
	private int cardNum;	
	private Date expDate;
	private String holder;
	private int customerID;
	private int addrID;
	
	public int getCardNum() {
		return cardNum;
	}
	public void setCardNum(int cardNum) {
		this.cardNum = cardNum;
	}
	public Date getExpDate() {
		return expDate;
	}
	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}
	public String getHolder() {
		return holder;
	}
	public void setHolder(String holder) {
		this.holder = holder;
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public int getAddrID() {
		return addrID;
	}
	public void setAddrID(int addrID) {
		this.addrID = addrID;
	}
	
}