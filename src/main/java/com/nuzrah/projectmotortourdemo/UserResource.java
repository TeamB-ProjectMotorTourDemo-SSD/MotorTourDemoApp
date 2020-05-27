package com.nuzrah.projectmotortourdemo;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.google.gson.Gson;
import com.nuzrah.projectmotortourdemo.dao.UserDao;
import com.nuzrah.projectmotortourdemo.factory.USER_ROLES;
import com.nuzrah.projectmotortourdemo.model.User;

import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("user")
public class UserResource {

private static Logger logger = LogManager.getLogger(UserResource.class);
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAll() {
		//GSON
		
		
		Object object = UserDao.getInstance().getAll();
		
		Gson gson = new Gson();
		
		if(object instanceof List<?>) { //Data type  checking.
			
			@SuppressWarnings("unchecked")
			List<User> users = (List<User>)object; //Casting.
			
			String jsonString = gson.toJson(users);
			
			logger.info("All users were fetched from the database successfully!");
			
			return Response
					.status(200)
					.entity(jsonString)
					.build();
		} else {
			@SuppressWarnings("unchecked")
			Map<String, String> errMsg = (Map<String, String>)object; //Casting.
			
			String jsonString = gson.toJson(errMsg);
			
			logger.error("Unable to fetch all users from the database");
			
			return Response
					.status(200)
					.entity(jsonString)
					.build();
		}
		
	}
	
	@GET
	@Path("{userID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAnUser(@PathParam("userID") String userID) {
		
		int userid = Integer.parseInt(userID);
		
		User user = UserDao.getInstance().get(userid);
		
		Gson gson = new Gson();
		String jsonString = gson.toJson(user);
		
		logger.info("User was fetched from the database successfully!");
		
		return Response
				.status(200)
				.entity(jsonString)
				.build();
		
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	public void addUser(	@FormParam("userRole") String userRole,
							@FormParam("firstName") String firstName,
							@FormParam("lastName") String lastName,
							@FormParam("email") String email,
							@FormParam("password") String password,
							@FormParam("dob") Date dob ,
							@FormParam("addressLine1") String addressLine1,
							@FormParam("addressLine2") String addressLine2,
							@FormParam("city") String city,
							@FormParam("gender") String gender,
							@FormParam("phoneNumber") String phoneNumber) throws ClassNotFoundException, SQLException, IOException {
		
		User user = new User();
		
		user.setUserRole(userRole);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setPassword(password);
		user.setDob(dob);
		user.setAddressLine1(addressLine1);
		user.setAddressLine2(addressLine2);
		user.setCity(city);
		user.setGender(gender);
		user.setPhoneNumber(phoneNumber);
		
		UserDao.getInstance();
		UserDao.add(user);
		
		logger.info("User was submitted to the database successfully!");
	
	}

}
