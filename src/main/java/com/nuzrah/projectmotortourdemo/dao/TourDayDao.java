package com.nuzrah.projectmotortourdemo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nuzrah.projectmotortourdemo.model.TourDay;

public class TourDayDao {
	
private static TourDayDao newInstance = new TourDayDao();
	
	public static TourDayDao getInstance() {
		return newInstance;
	}
	
	private TourDayDao() {
		
	}

	
	//Fetching data from database.
	public Object getAll(){
		List<TourDay> tourDayList = new ArrayList<TourDay>();
		
		
		try {
			
			Connection conn = Configs.getDbConnection();
			
			String sql = "SELECT * FROM tbl_tour_day INNER JOIN tbl_tour_ride ON tbl_tour_day.tourID = tbl_tour_ride.tourID"; //Query to be execute
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			
			ResultSet resultSet = preparedStatement.executeQuery(); //Query execution.
			
			while(resultSet.next()) {
				TourDay tourDay = new TourDay();
				
				tourDay.setTourDayID(resultSet.getInt("tourDayID"));
				tourDay.setTourID(resultSet.getInt("tourID"));
				tourDay.setStartHotel(resultSet.getString("startHotel"));
				tourDay.setEndHotel(resultSet.getString("endHotel"));
				tourDay.setRouteNote(resultSet.getString("routeNote"));
				tourDay.setRouteMap(resultSet.getString("routeMap"));
				
				tourDayList.add(tourDay);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error : "+e.getMessage());
			
			Map<String, String> errMsg = new HashMap<String, String>();
			errMsg.put("Error",  e.getMessage());
			
			return errMsg;
			
		}
		
		return tourDayList;
		
	}
	
	//Fetching a single data from database.
	public TourDay get(int id){
		TourDay tourDay = new TourDay();
		
		
		try {
			
			Connection conn = Configs.getDbConnection();
			
			String sql = "SELECT * FROM tbl_tour_day INNER JOIN tbl_tour_ride ON tbl_tour_day.tourID = tbl_tour_ride.tourID WHERE tbl_tour_ride.tourID = ?";//Query to be execute
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, id); //binding the parameter value, 1 is for specify first parameter.
			
			ResultSet resultSet = preparedStatement.executeQuery(); //Query execution.
			
			while(resultSet.next()) {
				
				tourDay.setTourDayID(resultSet.getInt("tourDayID"));
				tourDay.setTourID(resultSet.getInt("tourID"));
				tourDay.setStartHotel(resultSet.getString("startHotel"));
				tourDay.setEndHotel(resultSet.getString("endHotel"));
				tourDay.setRouteNote(resultSet.getString("routeNote"));
				tourDay.setRouteMap(resultSet.getString("routeMap"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error : "+e.getMessage());
		}
		
		return tourDay;
		
	}
	
	public boolean add(TourDay tourDay) throws ClassNotFoundException, SQLException {
		
		if(tourDay != null) {
			
			Connection connection = Configs.getDbConnection();
			String sql =	"INSERT INTO `tbl_tour_day` (`tourID`, `startHotel`, `endHotel`, `routeNote`, `routeMap`)" + 
					"VALUES ( (SELECT tourID from tbl_tour_ride where tbl_tour_ride.tourID = ?), ?, ?, ?, ?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, tourDay.getTourID());
			stmt.setString(2, tourDay.getStartHotel());
			stmt.setString(3, tourDay.getEndHotel());
			stmt.setString(4, tourDay.getRouteNote());
			stmt.setString(5, tourDay.getRouteMap());
			
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
