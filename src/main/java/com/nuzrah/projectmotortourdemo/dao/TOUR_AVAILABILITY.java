package com.nuzrah.projectmotortourdemo.dao;

public enum TOUR_AVAILABILITY {
<<<<<<< HEAD
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
	
=======
	ONGOING("Completed Tour"),
	UPCOMING("On-going Tour"),
	COMPLETED("Upcoming Tour");
	
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
>>>>>>> branch 'Version_4_Merge' of https://github.com/TeamB-ProjectMotorTourDemo-SSD/MotorTourDemoApp.git
}
