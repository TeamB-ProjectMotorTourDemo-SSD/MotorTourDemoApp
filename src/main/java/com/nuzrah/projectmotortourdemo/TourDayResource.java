package com.nuzrah.projectmotortourdemo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.google.gson.Gson;
import com.nuzrah.projectmotortourdemo.dao.TourDayDao;
import com.nuzrah.projectmotortourdemo.model.TourDay;

import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("tourday")
public class TourDayResource {
	
////Debugging - Checking if page can be accessed
	//@GET
	//@Produces(MediaType.TEXT_PLAIN)
	//public String test() {
	//	return "Yes Working!";
	//}
	
	private static final Logger logger = LogManager.getLogger(TourDayResource.class);
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAll() {
		//GSON
		
		
		Object object = TourDayDao.getInstance().getAll();
		
		Gson gson = new Gson();
		
		if(object instanceof List<?>) { //Data type  checking.
			
			@SuppressWarnings("unchecked")
			List<TourDay> tourDays = (List<TourDay>)object; //Casting.
			
			String jsonString = gson.toJson(tourDays);
			
			logger.info("All Tours Days were fetched from the database successfully!");
			
			return Response
					.status(200)
					.entity(jsonString)
					.build();
		} else {
			@SuppressWarnings("unchecked")
			Map<String, String> errMsg = (Map<String, String>)object; //Casting.
			
			String jsonString = gson.toJson(errMsg);
			
			logger.error("Unable to fetch all Tours Days from the database");
			
			return Response
					.status(200)
					.entity(jsonString)
					.build();
		}
		
	}
	
	
	@GET
	@Path("{tourDayID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getATourDay(@PathParam("tourDayID") String tourDayID) {
		
		int tourdayid = Integer.parseInt(tourDayID);
		
		TourDay tourDay = TourDayDao.getInstance().get(tourdayid);
		
		Gson gson = new Gson();
		String jsonString = gson.toJson(tourDay);
		
		logger.info("Tour and Ride-Out was fetched from the database successfully!");
		
		return Response
				.status(200)
				.entity(jsonString)
				.build();
		
	}
	
	@GET
	@Path("specific/{tourID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getSpecificTourDay(@PathParam("tourID") String tourID) {
		
		int tourid = Integer.parseInt(tourID);
		
		TourDay tourDay = TourDayDao.getInstance().getSpecificTourDay(tourid);
		
		Gson gson = new Gson();
		String jsonString = gson.toJson(tourDay);
		
		logger.info("Tour and Ride-Out was fetched from the database successfully!");
		
		return Response
				.status(200)
				.entity(jsonString)
				.build();
		
	}
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	public void addTourDay(		@FormParam("tourID") int tourID,
								@FormParam("startHotel") String startHotel,
								@FormParam("endHotel") String endHotel,
								@FormParam("routeNote") String routeNote,
								@FormParam("routeNote") String routeMap) throws ClassNotFoundException, SQLException {
		
		TourDay tourDay = new TourDay();
		
		tourDay.setTourID(tourID);
		tourDay.setStartHotel(startHotel);
		tourDay.setEndHotel(endHotel);
		tourDay.setRouteNote(routeNote);
		tourDay.setRouteMap(routeMap);
		
		TourDayDao.getInstance().add(tourDay);
		
		logger.info("Tour and Ride-Out was submitted to the database successfully!");
	
	}

}
