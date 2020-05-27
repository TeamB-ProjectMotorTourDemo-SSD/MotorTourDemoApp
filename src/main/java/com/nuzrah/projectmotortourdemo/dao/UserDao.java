package com.nuzrah.projectmotortourdemo.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nuzrah.projectmotortourdemo.factory.USER_ROLES;
import com.nuzrah.projectmotortourdemo.model.User;

public class UserDao {

private static UserDao newInstance = new UserDao();
	
	public static UserDao getInstance() {
		return newInstance;
	}
	
	public UserDao() {
		
	}

	
	//Fetching data from database.
	public Object getAll(){
		List<User> userList = new ArrayList<User>();
		
		
		try {
			
			Connection conn = Configs.getDbConnection();
			
			String sql = "SELECT * FROM tbl_user";//Query to be execute
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			
			ResultSet resultSet = preparedStatement.executeQuery(); //Query execution.
			
			while(resultSet.next()) {
				User user = new User();
				
				user.setUserID(resultSet.getInt("userID"));
				user.setUserRole(resultSet.getString("userRole"));
				user.setFirstName(resultSet.getString("firstName"));
				user.setLastName(resultSet.getString("lastName"));
				user.setEmail(resultSet.getString("email"));
				user.setPassword(resultSet.getString("password"));
				user.setDob(resultSet.getDate("dob"));
				user.setAddressLine1(resultSet.getString("addressLine1"));
				user.setAddressLine2(resultSet.getString("addressLine2"));
				user.setGender(resultSet.getString("gender"));
				user.setCity(resultSet.getString("city"));
				user.setPhoneNumber(resultSet.getString("phoneNumber"));
				
				userList.add(user);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error : "+e.getMessage());
			
			Map<String, String> errMsg = new HashMap<String, String>();
			errMsg.put("Error",  e.getMessage());
			
			return errMsg;
			
		}
		
		return userList;
		
	}
	
	
	//Fetching a single data from database.
		public User get(int id){
			User user = new User();
			
			
			try {
				
				Connection conn = Configs.getDbConnection();
				
				String sql = "SELECT * FROM tbl_user WHERE userID = ?";//Query to be execute
				PreparedStatement preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setInt(1, id); //binding the parameter value, 1 is for specify first parameter.
				
				ResultSet resultSet = preparedStatement.executeQuery(); //Query execution.
				
				while(resultSet.next()) {
					
					user.setUserID(resultSet.getInt("userID"));
					user.setUserRole(resultSet.getString("userRole"));
					user.setFirstName(resultSet.getString("firstName"));
					user.setLastName(resultSet.getString("lastName"));
					user.setEmail(resultSet.getString("email"));
					user.setPassword(resultSet.getString("password"));
					user.setDob(resultSet.getDate("dob"));
					user.setAddressLine1(resultSet.getString("addressLine1"));
					user.setAddressLine2(resultSet.getString("addressLine2"));
					user.setGender(resultSet.getString("gender"));
					user.setCity(resultSet.getString("city"));
					user.setPhoneNumber(resultSet.getString("phoneNumber"));
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Error : "+e.getMessage());
			}
			
			return user;
			
		}
		
		//Fetching a login data from database.
		public static boolean validate(User user){
			boolean status=false;
					try {
						
						Connection connection = Configs.getDbConnection();
						PreparedStatement ps= connection.prepareStatement("SELECT * FROM tbl_user WHERE email=? AND password=?");
						ps.setString(1,user.getEmail());
						ps.setString(2, user.getPassword());
						
						ResultSet rs=ps.executeQuery();
						status=rs.next();
						
						
						System.out.println("Success");
						System.out.println(status);
						
						
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("Error : "+e.getMessage());
					}
					
					return status;
					
				}
		
		public static boolean add(User user) throws ClassNotFoundException, SQLException, IOException {
			
			if(user != null) {
				
				Connection connection = Configs.getDbConnection();
				String sql = "INSERT INTO `tbl_user` (`userRole`,`firstName`, `lastName`, `email`, `password`, `dob`,`addressLine1`, `addressLine2`, `city`, `gender`, `phoneNumber`) " + 
							"VALUES (?,?,?,?,?,?,?,?,?,?,?)";
//				String sql = "INSERT INTO tbl_enquiry (firstName,lastName, enquiryCategory, enquiryDescription, phoneNumber) " + 
//						"VALUES (?,?,?,?,?)";
								
				PreparedStatement stmt = connection.prepareStatement(sql);
				
				stmt.setString(1,user.getUserRole());
				stmt.setString(2, user.getFirstName());
				stmt.setString(3, user.getLastName());
				stmt.setString(4, user.getEmail());
				stmt.setString(5, user.getPassword());
				stmt.setDate(6, user.getDob());
				stmt.setString(7, user.getAddressLine1());
				stmt.setString(8, user.getAddressLine2());
				stmt.setString(9, user.getCity());
				stmt.setString(10, user.getGender());
				stmt.setString(11, user.getPhoneNumber());
				
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

