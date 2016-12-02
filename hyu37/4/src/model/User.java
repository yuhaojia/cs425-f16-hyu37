package model;

public class User {
	private int ID;	//customer id: 1 - 99
					//staff id: 101 - 199
	private String type;
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
