package com.nuzrah.projectmotortourdemo.factory;

public enum USER_ROLES {
	ADMIN("ADMIN"),
	LEADER("TOUR LEADER"),
	CUSTOMER("CUSTOMER");
	
	private String name;

    private USER_ROLES(String stringVal) {
        name=stringVal;
    }
    public String toString(){
        return name;
    }

    public static String getEnumByString(String code){
        for(USER_ROLES e : USER_ROLES.values()){
            if(e.name.equals(code)) return e.name();
        }
        return null;
    }

	
}
