<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Registration</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="css/style.main.css" />

  

</head>
<body id="registrationPage" >
<div class="container my-5">
<form action="/Registration.jsp" class="row bg-White" method="post" id="registrationForm" name="registrationForm">
  <div class="col-12" >
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
    
    
	<div class=" form-group">
    <label for="Firstname"><b>First name</b></label>
    <input type="text" placeholder="Firstname" name="Firstname" required>
	</div>
	
	<div class=" form-group">
    <label for="Lastname"><b>Last name</b></label>
    <input type="text" placeholder="Lastname" name="Lastname" required>
	</div>
	
	<div class=" form-group">
    <label for="E-mail"><b>E-mail</b></label>
    <input type="text" placeholder="E-mail" name="E-mail" required>
    </div>
    
    <div class=" form-group">
    <label for="Password"><b>Password</b></label>
    <input type="text" placeholder="Password" name="Password" required>
	</div>
	
	<div class=" form-group">
    <label for="DateOfBirth"><b>DateOfBirth</b></label>
    <input class="fa fa-calendar" id="date" name="date" placeholder="MM/DD/YYY" type="text"/>
     </div>
     
     <div class="form-group">
    <label for="Gender"><b>Gender</b></label>
     <select id="gender" name="gender">
     <option value="male">Male</option>
     <option value="female">Female</option>
  </select>
  </div>
    
    <div class=" form-group">
    <label for="Address 1"><b>Address 1</b></label>
    <input type="text" placeholder="Address 1" name="Address 1" required>
    </div>
    
    <div class=" form-group">
    <label for="Address 2"><b>Address 2</b></label>
    <input type="text" placeholder="Address 2" name="Address 2" required>
    </div>
    
    <div class=" form-group">
    <label for="city"><b>City</b></label>
    <input type="text" placeholder="city" name="city" required>
    </div>
    
    <div class=" form-group">
    <label for="Phone number"><b>Phone number</b></label>
    <input type="number" placeholder="Phone number" name="Phone number" required>
    </div>
    
    
    <hr>
    <p class="col-12 text-center">By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

    <button class="btn btn-primary"  type="submit" style=" margin: 10px 0px;">Register</button>
  </div>
  
  <div class="col-12 text-center signin bg-White">
    <p>Already have an account? <a href="#">Sign in</a>.</p>
  </div>
</form>
</div>

	<!-- #####  Staring of all JavaScript Scripts  ##### -->
	<!--  jQuery (Necessary for All JavaScript Scripts) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<!-- Popper JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
	<!-- Font Awesome JS -->
	<script src="https://kit.fontawesome.com/fcf22ae961.js"
		crossorigin="anonymous"></script>
	<!--  jQuery Validator JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"
		integrity="sha256-sPB0F50YUDK0otDnsfNHawYmA5M0pjjUf4TvRJkGFrI="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.min.js"
		integrity="sha256-vb+6VObiUIaoRuSusdLRWtXs/ewuz62LgVXg2f1ZXGo="
		crossorigin="anonymous"></script>
	<!--  jQuery Mask JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
		
<script>
	
</script>
</body>
</html>
