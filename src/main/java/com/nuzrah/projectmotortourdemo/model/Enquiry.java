package com.nuzrah.projectmotortourdemo.model;

import com.nuzrah.projectmotortourdemo.dao.ENQUIRY_CATEGORY;

public class Enquiry {
	
	private int enquiryID;
	private String firstName;
	private String lastName;
	private ENQUIRY_CATEGORY enquiryCategory;
	private String enquiryDescription;
	private int phoneNumber;
	
	public Enquiry() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public Enquiry(int enquiryID, String firstName, String lastName, ENQUIRY_CATEGORY enquiryCategory,
			String enquiryDescription, int phoneNumber) {
		super();
		this.enquiryID = enquiryID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.enquiryCategory = enquiryCategory;
		this.enquiryDescription = enquiryDescription;
		this.phoneNumber = phoneNumber;
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
	

	public ENQUIRY_CATEGORY getEnquiryCategory() {
		return enquiryCategory;
	}
	

	public void setEnquiryCategory(ENQUIRY_CATEGORY enquiryCategory) {
		this.enquiryCategory = enquiryCategory;
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
	
	
	
	
}
