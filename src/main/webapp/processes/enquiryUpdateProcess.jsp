<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.nuzrah.projectmotortourdemo.dao.Configs"%>


<%
	String id = request.getParameter("enquiryID");
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String enquiryCategory = request.getParameter("enquiryCategory");
String enquiryDescription = request.getParameter("enquiryDescription");
String phoneNumber = request.getParameter("phoneNumber");
String email = request.getParameter("email");
if (id != null) {
	int enquiryID = Integer.parseInt(id);
// 	int phoneNumber = Integer.parseInt(phone);
	try {
		Connection connection = Configs.getDbConnection();
		String sql = "UPDATE tbl_enquiry SET firstName = ?, lastName = ?, enquiryCategory = ?, enquiryDescription = ?, phoneNumber = ?, email = ? WHERE enquiryID =" + enquiryID;
		PreparedStatement ps = connection.prepareStatement(sql);
		
		
		ps.setString(1, firstName);
		ps.setString(2, lastName);
		ps.setString(3, enquiryCategory);
		ps.setString(4, enquiryDescription);
		ps.setString(5, phoneNumber);
		ps.setString(6, email);
		
		int i = ps.executeUpdate();
		if (i > 0) {
	out.print("Record Updated Successfully");
		} else {
	out.print("There is a problem in updating Record.");
		}
	} catch (SQLException sql) {
		request.setAttribute("error", sql);
		out.println(sql);
	}
}

String redirectURL = "../views/enquiries.jsp";
response.sendRedirect(redirectURL);
%>
