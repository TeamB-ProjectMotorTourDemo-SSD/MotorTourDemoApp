<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
body {font-family: Arial, Helvetica, sans-serif;}

input[type=text], input[type=password] {
 width: 100%;
 padding: 12px 20px;
 margin: 8px 0;
 display: inline-block;
 border: 1px solid #ccc;
 box-sizing: border-box;
}
.img {
  opacity: 0.5;
}

.img:hover {
  opacity: 1.0;
}
button {
 background-color: #4682b4;
 color: white;
 padding: 14px 20px;
 margin: 8px 0;
 border: none;
 cursor: pointer;
 width: 100%;
}

button:hover {
 opacity: 0.8;
}

.imgcontainer {
 text-align: center;
 width: auto;
 margin: 24px 0 12px 0;
}

img.avatar {
 width: 40%;
 border-radius: 50%;
}

div.container {
border: 8px solid #f1f1f1;

 padding: 20px;
 width: 600px;
}

.input {
 padding: 50px;
}

span.psw {
 float: right;
 padding-top: 16px;
}
}
</style>
</head>
<body>
<form id = "loginform" action ="http://localhost:8080/MotorTourRide/motorapi/login" method ="post">


  <div class="container" style="background-image: url('img/login.jpg');"> 

 <div class="imgcontainer">
 
   <img src="img/user.jpg" alt="User" class="avatar">
 </div>
<label for="username"><b>Email ID</b></label>
 <input type="text" placeholder="emailid" name="emailid" id="user" required>
   <label for="psw"><b>Password</b></label>
   <input type="password" placeholder="Password" name="Pass" id="Pass" required>
   <button class="btn btn-primary" onClick="formSubmit(document.getElementById('Pass').value, document.getElementById('Einr').value);return false;" type="submit" style=" margin: 10px 0px;">Login</button>
 </div>
 </div>
  </form>



</body>
</html>
