package com.nuzrah.projectmotortourdemo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
import com.nuzrah.projectmotortourdemo.dao.TOUR_AVAILABILITY;
import com.nuzrah.projectmotortourdemo.dao.TourRideOutDao;
import com.nuzrah.projectmotortourdemo.model.TourRideOut;

@Path("tourrideout")
public class TourRideOutResource {
	
	////Debugging - Checking if page can be accessed
	//@GET
	//@Produces(MediaType.TEXT_PLAIN)
	//public String test() {
	//	return "Yes Working!";
	//}
	
	private static final Logger logger = LogManager.getLogger(TourRideOutResource.class);
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAll() {
		//GSON
		
		
		Object object = TourRideOutDao.getInstance().getAll();
		
		Gson gson = new Gson();
		
		if(object instanceof List<?>) { //Data type  checking.
			
			@SuppressWarnings("unchecked")
			List<TourRideOut> tourRideOuts = (List<TourRideOut>)object; //Casting.
			
			String jsonString = gson.toJson(tourRideOuts);
			
			logger.info("All Tours and Ride-Outs were fetched from the database successfully!");
			
			return Response
					.status(200)
					.entity(jsonString)
					.build();
		} else {
			@SuppressWarnings("unchecked")
			Map<String, String> errMsg = (Map<String, String>)object; //Casting.
			
			String jsonString = gson.toJson(errMsg);
			
			logger.error("Unable to fetch all Tours and Ride-Outs from the database");
			
			return Response
					.status(200)
					.entity(jsonString)
					.build();
		}
		
	}
	
	
	@GET
	@Path("{tourID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getATourRideOut(@PathParam("tourID") String tourID) {
		
		int tourid = Integer.parseInt(tourID);
		
		TourRideOut tourRideOut = TourRideOutDao.getInstance().get(tourid);
		
		Gson gson = new Gson();
		String jsonString = gson.toJson(tourRideOut);
		
		logger.info("Tour and Ride-Out was fetched from the database successfully!");
		
		return Response
				.status(200)
				.entity(jsonString)
				.build();
		
	}
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	public void addTourRideOut(	@FormParam("tourName") String tourName,
								@FormParam("tourDescription") String tourDescription,
								@FormParam("tourDuration") int tourDuration,
								@FormParam("legalRequirements") String legalRequirements,
								@FormParam("tourLeaderFirstName") String tourLeaderFirstName,
								@FormParam("tourLeaderLastName") String tourLeaderLastName,
								@FormParam("availability") String availability,
								@FormParam("startLocation") String startLocation,
								@FormParam("endLocation") String endLocation) throws ClassNotFoundException, SQLException {
		
		TourRideOut tourRideOut = new TourRideOut();
		
		tourRideOut.setTourName(tourName);
		tourRideOut.setTourDescription(tourDescription);
		tourRideOut.setTourDuration(tourDuration);
		tourRideOut.setLegalRequirements(legalRequirements);
		tourRideOut.setTourLeaderFirstName(tourLeaderFirstName);
		tourRideOut.setTourLeaderLastName(tourLeaderLastName);
		tourRideOut.setAvailability(TOUR_AVAILABILITY.valueOf(availability));
		tourRideOut.setStartLocation(startLocation);
		tourRideOut.setEndLocation(endLocation);
		
		TourRideOutDao.getInstance().add(tourRideOut);
		
		logger.info("Tour and Ride-Out was submitted to the database successfully!");
	
	}

}
