package com.nuzrah.projectmotortourdemo.model;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletResponse;

import com.nuzrah.projectmotortourdemo.factory.Admin;
import com.nuzrah.projectmotortourdemo.factory.Customer;
import com.nuzrah.projectmotortourdemo.factory.TourLeader;
import com.nuzrah.projectmotortourdemo.factory.USER_ROLES;

public class User {

	private int userID;
	private String userRole;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private Date dob;
	private String addressLine1;
	private String addressLine2;
	private String city;
	private String gender;
	private String phoneNumber;
	private HttpServletResponse response;
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public User(int userID, String userRole, String firstName, String lastName, String email, String password, Date dob,
			String addressLine1, String addressLine2, String city, String gender, String phoneNumber) {
		super();
		this.userID = userID;
		this.userRole = userRole;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.dob = dob;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.city = city;
		this.gender = gender;
		this.phoneNumber = phoneNumber;
	}


	public int getUserID() {
		return userID;
	}


	public void setUserID(int userID) {
		this.userID = userID;
	}


	public String getUserRole() throws IOException{
		response = null;
		if (userRole. equalsIgnoreCase ("ADMIN")){
			//String redirectURL = "sample.jsp";
	        response.sendRedirect("sample.jsp");
   
	     }else if(userRole. equalsIgnoreCase ("TOUR LEADER")){
	    	 response.sendRedirect("CP.jsp");
	            
	     }else if(userRole. equalsIgnoreCase ("CUSTOMER")){
	    	 response.sendRedirect("index.jsp");
	     }
		
		throw new IllegalArgumentException("No such User");
	     
		//return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public Date getDob() {
		return dob;
	}


	public void setDob(Date dob) {
		this.dob = dob;
	}


	public String getAddressLine1() {
		return addressLine1;
	}


	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}


	public String getAddressLine2() {
		return addressLine2;
	}


	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public void viewUser() {
	
	}
	
	public void addUser() {
		
	}
	
	public void updateUser() {
		
	}
	
	public void maintainUser() {
		
	}
	
	public void deleteUser() {
		
	}
	

}
