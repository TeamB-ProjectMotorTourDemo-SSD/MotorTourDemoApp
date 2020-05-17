<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Testing add enquiry</title>
</head>
<body>
<!-- 	<form action="http://localhost:8080/projectmotortourdemo/motorapi/enquiry" method="post"> -->
	<form action="https://motor-tour-demo-teamb.herokuapp.com/motorapi/enquiry" method="post">
		<label>Enter FirstName</label><br/>
		<input type="text" name="firstName" ><br/>
		<label>Enter lastName</label><br/>
		<input type="text" name="lastName" ><br/>
		<label>Enter enquiryCategory</label><br/>
		<input type="text" name="enquiryCategory" ><br/>
		<label>Enter enquiryDescription</label><br/>
		<input type="text" name="enquiryDescription" ><br/>
		<label>Enter phoneNumber</label><br/>
		<input type="text" name="phoneNumber" ><br/>
		<input type="submit" value="Submit">
	</form>
</body>
</html>