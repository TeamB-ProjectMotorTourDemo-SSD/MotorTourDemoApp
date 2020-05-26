
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="com.nuzrah.projectmotortourdemo.dao.Configs"%>

<%
	String enquiryID = request.getParameter("enquiryID");
try {
	Connection conn = Configs.getDbConnection();
	Statement st = conn.createStatement();

	int i = st.executeUpdate("DELETE FROM tbl_enquiry WHERE enquiryID=" + enquiryID);
	out.println("Data Deleted Successfully!");
} catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}

String redirectURL = "../views/enquiries.jsp";
response.sendRedirect(redirectURL);
%>
