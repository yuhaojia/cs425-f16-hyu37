package model;

public class PricePerState {
	String stateName;
	int productID;
	float statePrice;
	String protype;
	String proname;
	public String getProtype() {
		return protype;
	}
	public void setProtype(String protype) {
		this.protype = protype;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}

	
	public String getstateName() {
		return stateName;
	}
	public void setstateName(String stateName) {
		this.stateName = stateName;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public float getStatePrice() {
		return statePrice;
	}
	public void setStatePrice(float statePrice) {
		this.statePrice = statePrice;
	}
	

}
