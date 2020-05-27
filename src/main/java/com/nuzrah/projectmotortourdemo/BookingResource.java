package com.nuzrah.projectmotortourdemo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.google.gson.Gson;
import com.nuzrah.projectmotortourdemo.dao.BOOKING_STATUS;
import com.nuzrah.projectmotortourdemo.dao.BookingDao;
import com.nuzrah.projectmotortourdemo.model.Booking;

import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;


@Path("booking")
public class BookingResource {

private static Logger logger = LogManager.getLogger(BookingResource.class);
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAll() {
		//GSON
		
		
		Object object = BookingDao.getInstance().getAll();
		
		Gson gson = new Gson();
		
		if(object instanceof List<?>) { //Data type  checking.
			
			@SuppressWarnings("unchecked")
			List<Booking> bookings = (List<Booking>)object; //Casting.
			
			String jsonString = gson.toJson(bookings);
			
			logger.info("All bookings were fetched from the database successfully!");
			
			return Response
					.status(200)
					.entity(jsonString)
					.build();
		} else {
			@SuppressWarnings("unchecked")
			Map<String, String> errMsg = (Map<String, String>)object; //Casting.
			
			String jsonString = gson.toJson(errMsg);
			
			logger.error("Unable to fetch all bookings from the database");
			
			return Response
					.status(200)
					.entity(jsonString)
					.build();
		}
		
	}
	
	@GET
	@Path("{bookingID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAnBooking(@PathParam("bookingID") String bookingID) {
		
		int bookingid = Integer.parseInt(bookingID);
		
		Booking booking = BookingDao.getInstance().get(bookingid);
		
		Gson gson = new Gson();
		String jsonString = gson.toJson(booking);
		
		logger.info("Booking was fetched from the database successfully!");
		
		return Response
				.status(200)
				.entity(jsonString)
				.build();
		
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	public void addBooking(	@FormParam("bookingStatus") String bookingStatus,
							@FormParam("feedback") String feedback,
							@FormParam("cost") int cost) throws ClassNotFoundException, SQLException {
		
		
		Booking booking = new Booking();
		
		booking.setBookingStatus(BOOKING_STATUS.valueOf(bookingStatus));
		booking.setFeedback(feedback);
		booking.setCost(cost);
		
		BookingDao.getInstance().add(booking);
		
		logger.info("Booking was submitted to the database successfully!");
	
	}

}

