package com.nuzrah.projectmotortourdemo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nuzrah.projectmotortourdemo.model.TourRideOut;

public class TourRideOutDao {
	
	private static TourRideOutDao newInstance = new TourRideOutDao();
	
	public static TourRideOutDao getInstance() {
		return newInstance;
	}
	
	private TourRideOutDao() {
		
	}

	
	//Fetching data from database.
	public Object getAll(){
		List<TourRideOut> tourRideOutList = new ArrayList<TourRideOut>();
		
		
		try {
			
			Connection conn = Configs.getDbConnection();
			
			String sql = "SELECT * FROM tbl_tour_ride";//Query to be execute
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			
			ResultSet resultSet = preparedStatement.executeQuery(); //Query execution.
			
			while(resultSet.next()) {
				TourRideOut tourRideOut = new TourRideOut();
				
				tourRideOut.setTourID(resultSet.getInt("tourID"));
				tourRideOut.setTourName(resultSet.getString("tourName"));
				tourRideOut.setTourDescription(resultSet.getString("tourDescription"));
				tourRideOut.setTourDuration(resultSet.getInt("tourDuration"));
				tourRideOut.setLegalRequirements(resultSet.getString("legalRequirements"));
				tourRideOut.setTourLeaderFirstName(resultSet.getString("tourLeaderFirstName"));
				tourRideOut.setTourLeaderLastName(resultSet.getString("tourLeaderLastName"));
				tourRideOut.setAvailability(TOUR_AVAILABILITY.valueOf(resultSet.getString("availability")));
				tourRideOut.setStartLocation(resultSet.getString("startLocation"));
				tourRideOut.setEndLocation(resultSet.getString("endLocation"));
				
				tourRideOutList.add(tourRideOut);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error : "+e.getMessage());
			
			Map<String, String> errMsg = new HashMap<String, String>();
			errMsg.put("Error",  e.getMessage());
			
			return errMsg;
			
		}
		
		return tourRideOutList;
		
	}
	
	//Fetching a single data from database.
	public TourRideOut get(int id){
		TourRideOut tourRideOut = new TourRideOut();
		
		
		try {
			
			Connection conn = Configs.getDbConnection();
			
			String sql = "SELECT * FROM tbl_tour_ride WHERE tourID = ?";//Query to be execute
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, id); //binding the parameter value, 1 is for specify first parameter.
			
			ResultSet resultSet = preparedStatement.executeQuery(); //Query execution.
			
			while(resultSet.next()) {
				
				tourRideOut.setTourID(resultSet.getInt("tourID"));
				tourRideOut.setTourName(resultSet.getString("tourName"));
				tourRideOut.setTourDescription(resultSet.getString("tourDescription"));
				tourRideOut.setTourDuration(resultSet.getInt("tourDuration"));
				tourRideOut.setLegalRequirements(resultSet.getString("legalRequirements"));
				tourRideOut.setTourLeaderFirstName(resultSet.getString("tourLeaderFirstName"));
				tourRideOut.setTourLeaderLastName(resultSet.getString("tourLeaderLastName"));
				tourRideOut.setAvailability(TOUR_AVAILABILITY.valueOf(resultSet.getString("availability")));
				tourRideOut.setStartLocation(resultSet.getString("startLocation"));
				tourRideOut.setEndLocation(resultSet.getString("endLocation"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error : "+e.getMessage());
		}
		
		return tourRideOut;
		
	}
	
	public boolean add(TourRideOut tourRideOut) throws ClassNotFoundException, SQLException {
		
		if(tourRideOut != null) {
			
			Connection connection = Configs.getDbConnection();
			String sql = "INSERT INTO `tbl_tour_ride` (	`tourName`,`tourDescription`,`tourDuration`, `legalRequirements`, `tourLeaderFirstName`, `tourLeaderLastName`, `availability`, `startLocation`, `endLocation` " + 
						"VALUES (?,?,?,?,?,?,?,?,?)";
//			String sql = "INSERT INTO tbl_enquiry (firstName,lastName, enquiryCategory, enquiryDescription, phoneNumber) " + 
//					"VALUES (?,?,?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, tourRideOut.getTourName());
			stmt.setString(2, tourRideOut.getTourDescription());
			stmt.setInt(3, tourRideOut.getTourDuration());
			stmt.setString(4, tourRideOut.getLegalRequirements());
			stmt.setString(5, tourRideOut.getTourLeaderFirstName());
			stmt.setString(6, tourRideOut.getTourLeaderLastName());
			stmt.setString(7, tourRideOut.getAvailability().toString());
			stmt.setString(8, tourRideOut.getStartLocation());
			stmt.setString(9, tourRideOut.getEndLocation());
			
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
