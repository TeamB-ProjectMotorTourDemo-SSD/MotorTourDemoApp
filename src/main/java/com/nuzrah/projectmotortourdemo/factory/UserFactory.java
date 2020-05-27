package com.nuzrah.projectmotortourdemo.factory;

import com.nuzrah.projectmotortourdemo.model.User;

public class UserFactory {
	

	       public static User createUser (String user) {
	    	   
	       if (user. equalsIgnoreCase ("ADMIN")){
	              return new Admin();
	              
	       }else if(user. equalsIgnoreCase ("TOUR LEADER")){
	              return new TourLeader();
	              
	       }else if(user. equalsIgnoreCase ("CUSTOMER")){
	              return new Customer();
	       }
	       
	       throw new IllegalArgumentException("No such User");
	       }

}
