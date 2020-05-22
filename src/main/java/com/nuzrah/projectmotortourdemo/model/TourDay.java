package com.nuzrah.projectmotortourdemo.model;

public class TourDay {
	private int tourDayID;
	private int tourID;
	private String startHotel;
	private String endHotel;
	private String routeNote;
	private String routeMap;
	
	public TourDay() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TourDay(int tourDayID, int tourDay, String startHotel, String endHotel, String routeNote, String routeMap) {
		super();
		this.tourDayID = tourDayID;
		this.tourID = tourDay;
		this.startHotel = startHotel;
		this.endHotel = endHotel;
		this.routeNote = routeNote;
		this.routeMap = routeMap;
	}

	public int getTourDayID() {
		return tourDayID;
	}

	public void setTourDayID(int tourDayID) {
		this.tourDayID = tourDayID;
	}

	public int getTourID() {
		return tourID;
	}

	public void setTourID(int tourDay) {
		this.tourID = tourDay;
	}

	public String getStartHotel() {
		return startHotel;
	}

	public void setStartHotel(String startHotel) {
		this.startHotel = startHotel;
	}

	public String getEndHotel() {
		return endHotel;
	}

	public void setEndHotel(String endHotel) {
		this.endHotel = endHotel;
	}

	public String getRouteNote() {
		return routeNote;
	}

	public void setRouteNote(String routeNote) {
		this.routeNote = routeNote;
	}

	public String getRouteMap() {
		return routeMap;
	}

	public void setRouteMap(String routeMap) {
		this.routeMap = routeMap;
	}
	
	
	
}
