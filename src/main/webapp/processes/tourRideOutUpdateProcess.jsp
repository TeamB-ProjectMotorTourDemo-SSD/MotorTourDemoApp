<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.nuzrah.projectmotortourdemo.dao.Configs"%>

<%
	String id = request.getParameter("tourID");
String tourName = request.getParameter("tourName");
String tourDescription = request.getParameter("tourDescription");
String dur = request.getParameter("tourDuration");
String legalRequirements = request.getParameter("legalRequirements");
String tourLeaderFirstName = request.getParameter("tourLeaderFirstName");
String tourLeaderLastName = request.getParameter("tourLeaderLastName");
String availability = request.getParameter("availability");
String startLocation = request.getParameter("startLocation");
String endLocation = request.getParameter("endLocation");

if (id != null) {
	int tourID = Integer.parseInt(id);
	int tourDuration = Integer.parseInt(dur);

	try {
		Connection connection = Configs.getDbConnection();
		String sql = "UPDATE tbl_tour_ride SET tourName = ? ,tourDescription = ?,tourDuration = ?, legalRequirements = ?, tourLeaderFirstName = ?, tourLeaderLastName = ?, availability = ?, startLocation = ?, endLocation = ? WHERE tourID =" + tourID;
		PreparedStatement ps = connection.prepareStatement(sql);

		ps.setString(1, tourName);
		ps.setString(2, tourDescription);
		ps.setInt(3, tourDuration);
		ps.setString(4, legalRequirements);
		ps.setString(5, tourLeaderFirstName);
		ps.setString(6, tourLeaderLastName);
		ps.setString(7, availability);
		ps.setString(8, startLocation);
		ps.setString(9, endLocation);

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

String redirectURL = "../views/tourrideoutmanagement.jsp";
response.sendRedirect(redirectURL);
%>
