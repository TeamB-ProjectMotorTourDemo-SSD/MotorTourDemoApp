package com.nuzrah.projectmotortourdemo.dao;

public enum ENQUIRY_CATEGORY {
	FUTURE_RIDEOUT_TOURS("Upcoming Tours and Ride-outs"),
	BOOKING_TOURS("Booking tours"),
	TOUR_LEGAL_REQUIREMENTS("Legal requirements for tour participation"),
	OTHER("Other");
	
	
	private String name;

    private ENQUIRY_CATEGORY(String stringVal) {
        name=stringVal;
    }
    public String toString(){
        return name;
    }

    public static String getEnumByString(String code){
        for(ENQUIRY_CATEGORY e : ENQUIRY_CATEGORY.values()){
            if(e.name.equals(code)) return e.name();
        }
        return null;
    }
}
