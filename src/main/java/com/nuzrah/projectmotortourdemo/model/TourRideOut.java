package com.nuzrah.projectmotortourdemo.model;

import com.nuzrah.projectmotortourdemo.dao.TOUR_AVAILABILITY;

public class TourRideOut {
	private int tourID;
	private String tourName;
	private String tourDescription;
	private int tourDuration;
	private String legalRequirements;
	private String tourLeaderFirstName;
	private String tourLeaderLastName;
	private TOUR_AVAILABILITY availability;
	private String startLocation;
	private String endLocation;
	
	public TourRideOut() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TourRideOut(int tourID, String tourName, String tourDescription, int tourDuration, String legalRequirements,
			String tourLeaderFirstName, String tourLeaderLastName, TOUR_AVAILABILITY availability, String startLocation,
			String endLocation) {
		super();
		this.tourID = tourID;
		this.tourName = tourName;
		this.tourDescription = tourDescription;
		this.tourDuration = tourDuration;
		this.legalRequirements = legalRequirements;
		this.tourLeaderFirstName = tourLeaderFirstName;
		this.tourLeaderLastName = tourLeaderLastName;
		this.availability = availability;
		this.startLocation = startLocation;
		this.endLocation = endLocation;
	}



	public int getTourID() {
		return tourID;
	}

	public void setTourID(int tourID) {
		this.tourID = tourID;
	}

	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	public String getTourDescription() {
		return tourDescription;
	}

	public void setTourDescription(String tourDescription) {
		this.tourDescription = tourDescription;
	}

	public int getTourDuration() {
		return tourDuration;
	}

	public void setTourDuration(int tourDuration) {
		this.tourDuration = tourDuration;
	}

	public String getLegalRequirements() {
		return legalRequirements;
	}

	public void setLegalRequirements(String legalRequirements) {
		this.legalRequirements = legalRequirements;
	}

	public String getTourLeaderFirstName() {
		return tourLeaderFirstName;
	}

	public void setTourLeaderFirstName(String tourLeaderFirstName) {
		this.tourLeaderFirstName = tourLeaderFirstName;
	}

	public String getTourLeaderLastName() {
		return tourLeaderLastName;
	}

	public void setTourLeaderLastName(String tourLeaderLastName) {
		this.tourLeaderLastName = tourLeaderLastName;
	}

	public String getStartLocation() {
		return startLocation;
	}

	public void setStartLocation(String startLocation) {
		this.startLocation = startLocation;
	}

	public String getEndLocation() {
		return endLocation;
	}

	public void setEndLocation(String endLocation) {
		this.endLocation = endLocation;
	}

	public TOUR_AVAILABILITY getAvailability() {
		return availability;
	}

	public void setAvailability(TOUR_AVAILABILITY availability) {
		this.availability = availability;
	}
	
	
	
}
