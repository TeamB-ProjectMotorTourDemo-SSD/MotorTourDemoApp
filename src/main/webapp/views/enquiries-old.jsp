<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Enquiry</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
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
  height: 650px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table.center {
  margin-left:auto; 
  margin-right:auto;
}

th, td{
  padding: 15px;
}
</style>
</head>
<body>
<form action="/Enquiry.jsp">

  <div class="container ">
  
  <div class=" text-center">
    <h1>Enquiry details</h1>
    </div>
<div class="row">
  <div class="column" style="background-color:#f5f6f7;">
    <h2>Enquiry Form</h2>
    <hr>
    <label for="Enquiry_firstname"><b>Enquiry_firstname</b></label>
    <input type="text" placeholder="Enquiry_firstname" name="Enquiry_firstname" required>

    <label for="Enquiry_lastname"><b>Enquiry_lastname</b></label>
    <input type="text" placeholder="Enquiry_lastname" name="Enquiry_lastname" required>
    
    <label for="Phonenumber"><b>Phone number</b></label>
    <input type="text" placeholder="Phonenumber" name="Phonenumber" required>
    
    <label for="Category"><b>Category</b></label>
    <input type="text" placeholder="Category" name="Category" required>
    
    <label for="Description"><b>Description</b></label>
    <input type="text" placeholder="Description" name="Description" required>
    
    <button class="btn btn-primary" onClick="formSubmit(document.getElementById('Pass').value, document.getElementById('Einr').value);return false;" type="submit" style=" margin: 10px 0px;">Submit</button>
  </div>
 
  
    <div class="column" style="background-color:#fff;">
      <h2>Enquiry field</h2>
      <hr>  
   
  <table class="table table-border">
    <thead>
      <tr>
        <th>Id</th>
        <th>Description </th>
        <th>First name </th>
        <th>Last name </th>
        <th>Phone Number </th>
        <th>Category </th>  
        <th><a href="#view" class="btn btn-primary" role="button">View</a></th>
        <th><a href="#update" class="btn btn-primary" role="button">Update</a></th>
        <th><a href="#delete" class="btn btn-primary" role="button">Delete</a></th>   
      </tr>
    </thead>
     <tbody>
    <tr>
      <th scope="row">1</th>
      <td></td>
      <td>Mark</td>
      <td>john</td>
      <td>0786453233</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      
    </tr>
    </tbody>
  </table> 
</div>
</div> 
</div>

</form>

</body>
</html>
