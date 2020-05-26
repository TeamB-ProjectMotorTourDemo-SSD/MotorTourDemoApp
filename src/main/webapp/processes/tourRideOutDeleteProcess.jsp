
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="com.nuzrah.projectmotortourdemo.dao.Configs"%>
<%
	String tourID = request.getParameter("tourID");
try {
	Connection conn = Configs.getDbConnection();
	Statement st = conn.createStatement();

	int i = st.executeUpdate("DELETE FROM tbl_tour_ride WHERE tourID=" + tourID);
	out.println("Data Deleted Successfully!");
} catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}

String redirectURL = "../views/tourrideoutmanagement.jsp";
response.sendRedirect(redirectURL);
%>
