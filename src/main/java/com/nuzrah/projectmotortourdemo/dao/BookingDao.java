package com.nuzrah.projectmotortourdemo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nuzrah.projectmotortourdemo.model.Booking;

public class BookingDao {

private static BookingDao newInstance = new BookingDao();
	
	public static BookingDao getInstance() {
		return newInstance;
	}
	
	public BookingDao() {
		// TODO Auto-generated constructor stub
	}
	
	
		//Fetching data from database.
		public Object getAll(){
			List<Booking> bookingList = new ArrayList<Booking>();
			
			
			try {
				
				Connection conn = Configs.getDbConnection();
				
				String sql = "SELECT * FROM tbl_booking";//Query to be execute
				PreparedStatement preparedStatement = conn.prepareStatement(sql);
				
				ResultSet resultSet = preparedStatement.executeQuery(); //Query execution.
				
				while(resultSet.next()) {
					Booking booking = new Booking();
					
					booking.setBookingID(resultSet.getInt("bookingID"));
					booking.setUserID(resultSet.getInt("userID"));
					booking.setBookingStatus(BOOKING_STATUS.valueOf(resultSet.getString("bookingStatus")));
					booking.setFeedback(resultSet.getString("feedback"));
					booking.setCost(resultSet.getInt("cost"));
				
					
					bookingList.add(booking);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Error : "+e.getMessage());
				
				Map<String, String> errMsg = new HashMap<String, String>();
				errMsg.put("Error",  e.getMessage());
				
				return errMsg;
				
			}
			
			return bookingList;
			
		}
		
		//Fetching a single data from database.
		public static Booking get(int id){
			Booking booking = new Booking();
			
			
			try {
				
				Connection conn = Configs.getDbConnection();
				
				String sql = "SELECT * FROM tbl_booking WHERE bookingID = ?";//Query to be execute
				PreparedStatement preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setInt(1, id); //binding the parameter value, 1 is for specify first parameter.
				
				ResultSet resultSet = preparedStatement.executeQuery(); //Query execution.
				
				while(resultSet.next()) {
					
					booking.setBookingID(resultSet.getInt("bookingID"));
					booking.setUserID(resultSet.getInt("userID"));
					booking.setBookingStatus(BOOKING_STATUS.valueOf(resultSet.getString("bookingStatus")));
					booking.setFeedback(resultSet.getString("feedback"));
					booking.setCost(resultSet.getInt("cost"));
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Error : "+e.getMessage());
			}
			
			return booking;
			
		}
		
		public boolean add(Booking booking) throws ClassNotFoundException, SQLException {
			
			if(booking != null) {
				
				Connection connection = Configs.getDbConnection();
				String sql = "INSERT INTO `tbl_booking` (`bookingStatus`,`feedback`, `cost`) " + 
							"VALUES (?,?,?)";
//				String sql = "INSERT INTO tbl_enquiry (firstName,lastName, enquiryCategory, enquiryDescription, phoneNumber) " + 
//						"VALUES (?,?,?,?,?)";
				
				
				PreparedStatement stmt = connection.prepareStatement(sql);
				
				stmt.setString(1, booking.getBookingStatus().toString());
				stmt.setString(2, booking.getFeedback());
				stmt.setInt(3, booking.getCost());
				
		
				
				int count = stmt.executeUpdate();
				
				if(count > 0) {
					System.out.println("Successfully Added");
					return true;
				} else {
					System.out.println("Error occured");
				}
								
			}
			
			return false;
			
		}
	

}
