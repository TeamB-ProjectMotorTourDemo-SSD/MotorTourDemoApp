
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Booking Management</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
   <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {}
input[type=text], input[type=password] {
 width: 100%;
 padding: 12px 20px;
 margin: 8px 0;
 display: inline-block;
 border: 1px solid #ccc;
 box-sizing: border-box;
}

button {
 background-color: #4CAF50;
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

div.container {
border: 8px solid #f1f1f1;

 padding: 20px;
 width: 1500px;
}

.input {
 padding: 50px;
}

span.psw {
 float: right;
 padding-top: 16px;
}
select {
  width: 100%;
  padding: 16px 20px;
  border: none;
  border: 1px solid #ccc;
  border-radius: 4px;
  background-color: #fff;
}
* {
  box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
.column {
  float: left;
  width: 50%;
  padding: 10px;
  height: 1000px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>
</head>
<body>
<form action="/Enquiry.jsp">

  <div class="container ">
  <div class=" text-center">
    <h1><u> Booking details</u></h1>
    </div>
<div class="row">
  <div class="column" style="background-color:#f5f6f7;">
    <h2>Booking Form</h2>
    <hr>
    <label for="Booking_ID"><b>Booking ID</b></label>
    <input type="text" placeholder="Booking_ID" name="Booking_ID" required>

    <label for="Status"><b>Status</b></label>
    <input type="text" placeholder="Status" name="Status" required>
    
    <label for="Total_Cost"><b>Total Cost</b></label>
    <input type="text" placeholder="Total_Cost" name="Total_Cost" required>
    
    <label for="Feedback"><b>Feedback</b></label>
    <input type="text" placeholder="Feedback" name="Feedback" required>
    
    <button class="btn btn-primary" onClick="formSubmit(document.getElementById('Pass').value, document.getElementById('Einr').value);return false;" type="submit" style=" margin: 10px 0px;">Submit</button>
  </div>
 
  
    <div class="column" style="background-color:#fff;">
      <h2>Tour Ride-out Field</h2>
      <hr>        
  <table class="table">
    <thead>
      <tr>
        <th>Booking ID</th>
        <th>Status</th>
        <th>Total Cost</th>
        <th>Feedback</th>
        <th><a href="#view" class="btn btn-primary" role="button">View</a></th>
        <th><a href="#update" class="btn btn-primary" role="button">Update</a></th>
        <th><a href="#delete" class="btn btn-primary" role="button">Delete</a></th>  
      </tr>
    </thead>
  </table>
</div>
</div> 
</div>

</form>

</body>
</html>
    

   
  </body>
</html>