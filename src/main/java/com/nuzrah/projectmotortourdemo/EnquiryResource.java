package com.nuzrah.projectmotortourdemo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

//import javax.ws.rs.Consumes;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

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
	
	private static final Logger logger = LogManager.getLogger(EnquiryResource.class);
	
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
			
			logger.info("All enquries were fetched from the database successfully!");
			
			return Response
					.status(200)
					.entity(jsonString)
					.build();
		} else {
			@SuppressWarnings("unchecked")
			Map<String, String> errMsg = (Map<String, String>)object; //Casting.
			
			String jsonString = gson.toJson(errMsg);
			
			logger.error("Unable to fetch all enquiries from the database");
			
			return Response
					.status(200)
					.entity(jsonString)
					.build();
		}
		
	}
	
	@GET
	@Path("{enquiryID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAnEnquiry(@PathParam("enquiryID") String enquiryID) {
		
		int enquiryid = Integer.parseInt(enquiryID);
		
		Enquiry enquiry = EnquiryDao.getInstance().get(enquiryid);
		
		Gson gson = new Gson();
		String jsonString = gson.toJson(enquiry);
		
		logger.info("Enquiry was fetched from the database successfully!");
		
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
							@FormParam("phoneNumber") int phoneNumber,
							@FormParam("email") String email) throws ClassNotFoundException, SQLException {
		
		Enquiry enquiry = new Enquiry();
		
		enquiry.setFirstName(firstName);
		enquiry.setLastName(lastName);
		enquiry.setEnquiryCategory(ENQUIRY_CATEGORY.getEnumByString(enquiryCategory));
		enquiry.setEnquiryDescription(enquiryDescription);
		enquiry.setPhoneNumber(phoneNumber);
		enquiry.setEmail(email);
		
		EnquiryDao.getInstance().add(enquiry);
		
		logger.info("Enquiry was submitted to the database successfully!");
	
	}
	
	@POST
	@Path("update")
	@Produces(MediaType.APPLICATION_JSON)
	public void updateEnquiry(	@FormParam("firstName") String firstName,
								@FormParam("lastName") String lastName,
								@FormParam("enquiryCategory") String enquiryCategory,
								@FormParam("enquiryDescription") String enquiryDescription,
								@FormParam("phoneNumber") int phoneNumber,
								@FormParam("email") String email,
								@PathParam("enquiryID") int enquiryID) throws ClassNotFoundException, SQLException {
		
		Enquiry enquiry = new Enquiry();
		
		enquiry.setFirstName(firstName);
		enquiry.setLastName(lastName);
		enquiry.setEnquiryCategory(ENQUIRY_CATEGORY.getEnumByString(enquiryCategory));
		enquiry.setEnquiryDescription(enquiryDescription);
		enquiry.setPhoneNumber(phoneNumber);
		enquiry.setEmail(email);
		enquiry.setEnquiryID(enquiryID);
		
		EnquiryDao.getInstance().update(enquiry);
		
		logger.info("Enquiry was submitted to the database successfully!");
	
	}

}
