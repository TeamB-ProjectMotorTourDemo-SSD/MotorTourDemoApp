package com.nuzrah.projectmotortourdemo.dao;

public enum BOOKING_STATUS {
		CONFIRMATION("Confirm"),
		CANCELLATION("Cancel");
		
		
		private String name;

	    private BOOKING_STATUS(String stringVal) {
	        name=stringVal;
	    }
	    public String toString(){
	        return name;
	    }

	    public static String getEnumByString(String code){
	        for(BOOKING_STATUS e : BOOKING_STATUS.values()){
	            if(e.name.equals(code)) return e.name();
	        }
	        return null;
	    }
}
