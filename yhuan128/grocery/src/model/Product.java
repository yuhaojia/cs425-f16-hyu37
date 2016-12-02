package model;

public class Product {
	private String proType;
	private String proName;
	private float proSize;
	private String infoType;
	private String info;
	
	public String getInfoType() {
		return infoType;
	}
	public void setInfoType(String infoType) {
		this.infoType = infoType;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public void setProSize(float proSize) {
		this.proSize = proSize;
	}
	public String getProType() {
		return proType;
	}
	public void setProType(String proType) {
		this.proType = proType;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public float getProSize() {
		return proSize;
	}
	
}