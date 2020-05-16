package com.nuzrah.projectmotortourdemo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import com.google.gson.Gson;
import com.nuzrah.projectmotortourdemo.dao.ENQUIRY_CATEGORY;
import com.nuzrah.projectmotortourdemo.dao.EnquiryDao;
import com.nuzrah.projectmotortourdemo.model.Enquiry;

@Path("enquiry")
public class EnquiryResource {
	
////	Debugging - Checking if page can be accessed
//	@GET
//	@Produces(MediaType.TEXT_PLAIN)
//	public String test() {
//		return "Yes Working!";
//	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAll() {
		//GSON
		
		
		Object object = EnquiryDao.getInstance().getAll();
		
		Gson gson = new Gson();
		
		if(object instanceof List<?>) { //Data type  checking.
			
			@SuppressWarnings("unchecked")
			List<Enquiry> enquiries = (List<Enquiry>)object; //Casting.
			
			String jsonString = gson.toJson(enquiries);
			return Response
					.status(200)
					.entity(jsonString)
					.build();
		} else {
			@SuppressWarnings("unchecked")
			Map<String, String> errMsg = (Map<String, String>)object; //Casting.
			
			String jsonString = gson.toJson(errMsg);
			return Response
					.status(200)
					.entity(jsonString)
					.build();
		}
		
	}
	
	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAnEnquiry(@PathParam("enquiryID") String enquiryID) {
		
		int enquiryid = Integer.parseInt(enquiryID);
		
		Enquiry enquiry = EnquiryDao.getInstance().get(enquiryid);
		
		Gson gson = new Gson();
		String jsonString = gson.toJson(enquiry);
		
		return Response
				.status(200)
				.entity(jsonString)
				.build();
		
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	public void addEnquiry(	@FormParam("firstName") String firstName,
							@FormParam("lastName") String lastName,
							@FormParam("enquiryCategory") String enquiryCategory,
							@FormParam("enquiryDescription") String enquiryDescription,
							@FormParam("phoneNumber") int phoneNumber) throws ClassNotFoundException, SQLException {
		
		Enquiry enquiry = new Enquiry();
		
		enquiry.setFirstName(firstName);
		enquiry.setLastName(lastName);
		enquiry.setEnquiryCategory(ENQUIRY_CATEGORY.valueOf(enquiryCategory));
		enquiry.setEnquiryDescription(enquiryDescription);
		enquiry.setPhoneNumber(phoneNumber);
		
		//boolean result = EnquiryDao.getInstance().add(enquiry);
	
	}

}
