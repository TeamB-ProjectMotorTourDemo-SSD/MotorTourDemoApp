<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
</head>
<body>
	
	<form action="regProcess.jsp">  
	<input type="text" name="userRole" value="userRole..." onclick="this.value=''"/><br/>  
	<input type="text" name="firstName"  value="firstName..." onclick="this.value=''"/><br/>  
	<input type="text" name="lastName"  value="lastName..." onclick="this.value=''"/><br/>
	<input type="text" name="email"  value="email." onclick="this.value=''"/><br/>
	<input type="password" name="password"  value="password" onclick="this.value=''"/><br/>
	<input type="text" name="dob"  value="dob" onclick="this.value=''"/><br/>
	<input type="text" name="addressLine1"  value="addressLine1" onclick="this.value=''"/><br/>
	<input type="text" name="addressLine2"  value="addressLine2" onclick="this.value=''"/><br/>
	<input type="text" name=city  value="city" onclick="this.value=''"/><br/>
	<input type="text" name="gender"  value="gender" onclick="this.value=''"/><br/>
	<input type="text" name="phoneNumber"  value="phoneNumber" onclick="this.value=''"/><br/>
	<input type="submit" value="register"/>  
	</form> 
	
</body>
</html>

