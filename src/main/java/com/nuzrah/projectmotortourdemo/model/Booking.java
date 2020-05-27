package com.nuzrah.projectmotortourdemo.model;

import com.nuzrah.projectmotortourdemo.dao.BOOKING_STATUS;

public class Booking {
	
	private int bookingID;
	private int userID;
	private BOOKING_STATUS bookingStatus;
	private String feedback;
	private int cost;
	
	public Booking() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Booking(int bookingID, int userID, BOOKING_STATUS bookingStatus, String feedback, int cost, int phoneNumber) {
		super();
		this.bookingID = bookingID;
		this.userID = userID;
		this.bookingStatus = bookingStatus;
		this.feedback = feedback;
		this.cost = cost;
	}


	public int getBookingID() {
		return bookingID;
	}


	public void setBookingID(int bookingID) {
		this.bookingID = bookingID;
	}


	public int getUserID() {
		return userID;
	}


	public void setUserID(int userID) {
		this.userID = userID;
	}


	public BOOKING_STATUS getBookingStatus() {
		return bookingStatus;
	}


	public void setBookingStatus(BOOKING_STATUS bookingStatus) {
		this.bookingStatus = bookingStatus;
	}


	public String getFeedback() {
		return feedback;
	}


	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}


	public int getCost() {
		return cost;
	}


	public void setCost(int cost) {
		this.cost = cost;
	}
	

}

