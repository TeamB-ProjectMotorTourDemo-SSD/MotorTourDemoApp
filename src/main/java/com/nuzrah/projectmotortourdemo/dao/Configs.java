package com.nuzrah.projectmotortourdemo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Configs {
	
	public static Connection getDbConnection() throws ClassNotFoundException, SQLException {
		
//		String connURL = "jdbc:mysql://localhost:3306/motortoursdb?serverTimezone=UTC";
//		
//		Class.forName("com.mysql.cj.jdbc.Driver");
//		Connection conn = DriverManager.getConnection(connURL, "root", "");
//		return conn;
		
		String connURL = "jdbc:postgresql://" + "ec2-54-157-78-113.compute-1.amazonaws.com:5432" + "/d6vbmuui85j2u0";
		
		Class.forName("org.postgresql.Driver");
		Connection conn = DriverManager.getConnection(connURL, "ggozlywqjjlyyr", "21fa49aa62848d09847a0141704a2b8b0790ec997489f50a2c57da82e700b716");
		return conn;
	}

}
