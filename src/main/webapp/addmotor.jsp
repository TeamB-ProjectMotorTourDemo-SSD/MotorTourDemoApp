<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Motor</title>
</head>
<body>
<form action ="http://localhost:8080/MotorTourRide/motorapi/motors" method ="post">

    <label>Enter id</label><br/>
		<input type="text" name="motor_id" ><br/>
        <label>Enter Name</label><br/>
		<input type="text" name="motor_name" ><br/>
		<label>Enter Brand</label><br/>
		<input type="text" name="motor_brand" ><br/>
		<label>Enter Year</label><br/>
		<input type="text" name="motor_year" ><br/>
		<label>Enter color</label><br/>
		<input type="text" name="motor_color" ><br/>
		<label>Enter Type</label><br/>
		<input type="text" name="motor_type" ><br/>
		<input type="submit" value="Submit">

  
</form>
</body>
</html>