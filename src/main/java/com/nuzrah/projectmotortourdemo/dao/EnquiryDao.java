package com.nuzrah.projectmotortourdemo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nuzrah.projectmotortourdemo.model.Enquiry;

public class EnquiryDao {
	
	private static EnquiryDao newInstance = new EnquiryDao();
	
	public static EnquiryDao getInstance() {
		return newInstance;
	}
	
	private EnquiryDao() {
		
	}
	

	
	//Fetching data from database.
	public Object getAll(){
		List<Enquiry> enquiryList = new ArrayList<Enquiry>();
		
		
		try {
			
			Connection conn = Configs.getDbConnection();
			
			String sql = "SELECT * FROM tbl_enquiry";//Query to be execute
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			
			ResultSet resultSet = preparedStatement.executeQuery(); //Query execution.
			
			while(resultSet.next()) {
				Enquiry enquiry = new Enquiry();
				
				enquiry.setEnquiryID(resultSet.getInt("enquiryID"));
				enquiry.setFirstName(resultSet.getString("firstName"));
				enquiry.setLastName(resultSet.getString("lastName"));
				enquiry.setEnquiryCategory(resultSet.getString("enquiryCategory"));
				enquiry.setEnquiryDescription(resultSet.getString("enquiryDescription"));
				enquiry.setPhoneNumber(resultSet.getInt("phoneNumber"));
				enquiry.setEmail(resultSet.getString("email"));
				
				enquiryList.add(enquiry);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error : "+e.getMessage());
			
			Map<String, String> errMsg = new HashMap<String, String>();
			errMsg.put("Error",  e.getMessage());
			
			return errMsg;
			
		}
		
		return enquiryList;
		
	}
	
	//Fetching a single data from database.
	public Enquiry get(int id){
		Enquiry enquiry = new Enquiry();
		
		
		try {
			
			Connection conn = Configs.getDbConnection();
			
			String sql = "SELECT * FROM tbl_enquiry WHERE enquiryID = ?";//Query to be execute
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, id); //binding the parameter value, 1 is for specify first parameter.
			
			ResultSet resultSet = preparedStatement.executeQuery(); //Query execution.
			
			while(resultSet.next()) {
				
				enquiry.setEnquiryID(resultSet.getInt("enquiryID"));
				enquiry.setFirstName(resultSet.getString("firstName"));
				enquiry.setLastName(resultSet.getString("lastName"));
				enquiry.setEnquiryCategory(resultSet.getString("enquiryCategory"));
				enquiry.setEnquiryDescription(resultSet.getString("enquiryDescription"));
				enquiry.setPhoneNumber(resultSet.getInt("phoneNumber"));
				enquiry.setEmail(resultSet.getString("email"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error : "+e.getMessage());
		}
		
		return enquiry;
		
	}
	
	public boolean add(Enquiry enquiry) throws ClassNotFoundException, SQLException {
		
		if(enquiry != null) {
			
			Connection connection = Configs.getDbConnection();
			String sql = "INSERT INTO `tbl_enquiry` (`firstName`,`lastName`, `enquiryCategory`, `enquiryDescription`, `phoneNumber`, `email`) " + 
						"VALUES (?,?,?,?,?,?)";
//			String sql = "INSERT INTO tbl_enquiry (firstName,lastName, enquiryCategory, enquiryDescription, phoneNumber) " + 
//					"VALUES (?,?,?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, enquiry.getFirstName());
			stmt.setString(2, enquiry.getLastName());
			stmt.setString(3, enquiry.getEnquiryCategory());
			stmt.setString(4, enquiry.getEnquiryDescription());
			stmt.setInt(5, enquiry.getPhoneNumber());
			stmt.setString(6, enquiry.getEmail());
			
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
