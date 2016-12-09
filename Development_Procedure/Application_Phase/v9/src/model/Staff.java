/*****************************************************************************
 * Copyright © 2016 Haojia Yu
 * All rights reserved.
 *****************************************************************************/

package model;

public class Staff {
	private int staffID;
	private String lastName;
	private String firstName;
	private String jobTitle;

	//A default constructor is generated automatically.
	public int getStaffID() {
		return staffID;
	}
	public void setStaffID(int staffID) {
		this.staffID = staffID;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	
}