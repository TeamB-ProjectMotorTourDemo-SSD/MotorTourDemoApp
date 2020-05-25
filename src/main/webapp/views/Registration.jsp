<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Registration</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>

</head>
<body>
<form action="/Registration.jsp">
  <div class="container" style="background-image: url('https://images.pexels.com/photos/1762973/pexels-photo-1762973.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260');">
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>

    <label for="Firstname"><b>First name</b></label>
    <input type="text" placeholder="Firstname" name="Firstname" required>

    <label for="Lastname"><b>Last name</b></label>
    <input type="text" placeholder="Lastname" name="Lastname" required>

    <label for="E-mail"><b>E-mail</b></label>
    <input type="text" placeholder="E-mail" name="E-mail" required>
    
    <label for="Password"><b>Password</b></label>
    <input type="text" placeholder="Password" name="Password" required>

    <label for="DateOfBirth"><b>DateOfBirth</b></label>
    <input class="fa fa-calendar" id="date" name="date" placeholder="MM/DD/YYY" type="text"/>
     
     
    <label for="Gender"><b>Gender</b></label>
     <select id="gender" name="gender">
     <option value="male">Male</option>
     <option value="female">Female</option>
  </select>
    
    <label for="Address 1"><b>Address 1</b></label>
    <input type="text" placeholder="Address 1" name="Address 1" required>
    
    <label for="Address 2"><b>Address 2</b></label>
    <input type="text" placeholder="Address 2" name="Address 2" required>
    
    <label for="city"><b>City</b></label>
    <input type="text" placeholder="city" name="city" required>
    
    <label for="Phone number"><b>Phone number</b></label>
    <input type="number" placeholder="Phone number" name="Phone number" required>
    
    
    <hr>
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

    <button class="btn btn-primary" onClick="formSubmit(document.getElementById('Pass').value, document.getElementById('Einr').value);return false;" type="submit" style=" margin: 10px 0px;">Register</button>
  </div>
  
  <div class="container signin">
    <p>Already have an account? <a href="#">Sign in</a>.</p>
  </div>
</form>

<script>
$(document).ready(function(){
    var date_input=$('input[name="date"]'); //our date input has the name "date"
    var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
    var options={
      format: 'mm/dd/yyyy',
      container: container,
      todayHighlight: true,
      autoclose: true,
    };
    date_input.datepicker(options);
  })
</script>
</body>
</html>
