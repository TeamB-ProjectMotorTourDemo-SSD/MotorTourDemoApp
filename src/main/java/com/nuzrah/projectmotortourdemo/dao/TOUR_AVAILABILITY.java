package com.nuzrah.projectmotortourdemo.dao;

public enum TOUR_AVAILABILITY {
	ONGOING("ONGOING"),
	UPCOMING("UPCOMING"),
	COMPLETED("COMPLETED");
	
	
	private String name;

    private TOUR_AVAILABILITY(String stringVal) {
        name=stringVal;
    }
    public String toString(){
        return name;
    }

    public static String getEnumByString(String code){
        for(TOUR_AVAILABILITY e : TOUR_AVAILABILITY.values()){
            if(e.name.equals(code)) return e.name();
        }
        return null;
    }
	
}
