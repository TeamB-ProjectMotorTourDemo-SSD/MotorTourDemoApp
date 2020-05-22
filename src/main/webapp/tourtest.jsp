<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TourTest</title>
</head>
<body>

	
	
	<form action="http://localhost:8080/projectmotortourdemo/motorapi/tourday" method="post">
<!-- 	<form action="https://motor-tour-demo-teamb.herokuapp.com/motorapi/enquiry" method="post"> -->
		<input type="text" name="startHotel" placeholder="startHotel"><br/>
		<input type="text" name="endHotel" placeholder="endHotel"><br/>
		<input type="text" name="routeNote" placeholder="routeNote"><br/>
		<input type="text" name="routeMap" placeholder="routeMap"><br/>
		<input type="submit" value="Submit">
	</form>

</body>
</html>