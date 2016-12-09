package model;

public class Address {
	
	private int addrID;	
	private String street;
	private String city;
	private String state;
	private int zipcode;
	//public enum AddressType {
	//    SUNDAY, MONDAY, TUESDAY, WEDNESDAY,
	//    THURSDAY, FRIDAY, SATURDAY 
	//}
	private String addrType;
	public int getAddrID() {
		return addrID;
	}
	public void setAddrID(int addrID) {
		this.addrID = addrID;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddrType() {
		return addrType;
	}
	public void setAddrType(String addrType) {
		if(addrType == "SUNDAY" || addrType == "MONDAY" || addrType == "TUESDAY" || addrType == "WEDNESDAY" 
				|| addrType == "THURSDAY" || addrType == "FRIDAY" || addrType == "SATURDAY")
		{
			this.addrType = addrType;
		}
		else
		{
			this.addrType = "NotValidType";
		}
		
	}
	
}