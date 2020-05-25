package com.nuzrah.projectmotortourdemo.model;

public class Enquiry {
	
	private int enquiryID;
	private String firstName;
	private String lastName;
	private String enquiryCategory;
	private String enquiryDescription;
	private int phoneNumber;
	private String email;
	
	public Enquiry() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public Enquiry(int enquiryID, String firstName, String lastName, String enquiryCategory,
			String enquiryDescription, int phoneNumber, String email) {
		super();
		this.enquiryID = enquiryID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.enquiryCategory = enquiryCategory;
		this.enquiryDescription = enquiryDescription;
		this.phoneNumber = phoneNumber;
		this.email = email;
	}


	public int getEnquiryID() {
		return enquiryID;
	}
	

	public void setEnquiryID(int enquiryID) {
		this.enquiryID = enquiryID;
	}
	

	public String getFirstName() {
		return firstName;
	}
	

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	

	public String getLastName() {
		return lastName;
	}
	

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	

	public String getEnquiryCategory() {
		return enquiryCategory;
	}
	

	public void setEnquiryCategory(String string) {
		this.enquiryCategory = string;
	}
	

	public String getEnquiryDescription() {
		return enquiryDescription;
	}
	

	public void setEnquiryDescription(String enquiryDescription) {
		this.enquiryDescription = enquiryDescription;
	}
	

	public int getPhoneNumber() {
		return phoneNumber;
	}
	

	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
}
