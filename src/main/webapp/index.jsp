<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>MotorTourRideOut</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" type="text/css" href="css/style.main.css" />


</head>

<!-- <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60"> -->
<body id="home" onload="ClearForm()">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#home"> <img src="img/logo.jpg"
				class="rounded-circle" alt="logo" width="80" />
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item pr-2"><a class="nav-link" href="#home">Home</a>
					</li>
					<li class="nav-item pr-2"><a class="nav-link" href="#about">About
							Us</a></li>
					<li class="nav-item pr-2"><a class="nav-link" href="#contact">Contact
							Us</a></li>
					<li class="nav-item pr-2"><a class="nav-link" href="#gallery">Gallery</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="Registration.jsp"><i class="fas fa-user pr-2"></i>
							SignUp</a></li>
					<li class="nav-item"><a class="nav-link" href="Login.jsp"><i
							class="fas fa-sign-in-alt pr-2"></i> Login</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div id="carousel-home" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/gallery3.jpg" class="d-block w-100" alt="slide1">
			</div>
			<div class="carousel-item">
				<img src="img/slide2.jpg" class="d-block w-100" alt="slide2">
			</div>
			<div class="carousel-item">
				<img src="img/slide3.jpg" class="d-block w-100" alt="slide3">
			</div>
			<div class="carousel-item">
				<img src="img/gallery1.jpg" class="d-block w-100" alt="slide4">
			</div>
		</div>
		<div class="carousel-caption d-none d-md-block">
		    <a class="btn btn-primary btn-lg bg-Blue px-5 py-2" href="Registration.jsp"><h3 class="text-white m-0 p-2">JOIN NOW</h3></a>
		    <h4 class="text-white p-3">An experience of a life time</h4>
		  </div>
		<a class="carousel-control-prev" href="#carousel-home" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carousel-home" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
	</div>


	<div class="jumbotron text-center">
		<h1>Motorcycle Tour Ride Out</h1>
		<h5>Ride Edge Of the World!</h5>
	</div>


	<!-- Container (About Section) -->
	<section id="about" class="container-fluid text-center bg-grey"
		style="background: url('https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=2&amp;h=750&amp;w=1260') no-repeat center center;">
		<div class="transbox p-3">
			<h2>About Us</h2>
			<br>
			<h4>We believe that the best way to explore SriLanka is by
				motorcycle! With that in mind we created our exclusive bike tours,
				choosing the most interesting and spectacular places in the island.
				Riding with us you will see historical sites, National parks and
				beautiful city views. Our guides will provide you with loads of
				experiences and reveal SriLanka's hidden magic.</h4>
			<br>
		</div>
	</section>

	<!-- Container (Our Team Section) -->

	<section class="mb-3">
		<div class="container">

			<h2 class="text-center text-white col-12 pb-4 mt-5">Our Team</h2>
			<div class="row">
				<!--Profile Card 1-->
				<div class="col-md-4">
					<div class="card profile-card-3">
						<div class="background-block">
							<img
								src="https://images.pexels.com/photos/3418457/pexels-photo-3418457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
								alt="profile-sample1" class="background" />
						</div>
						<div class="profile-thumb-block">
							<img src="https://randomuser.me/api/portraits/men/20.jpg"
								alt="profile-image" class="profile" />
						</div>
						<div class="card-content">
							<h2>
								Justin Mccoy<small>Founder and Director</small>
							</h2>
							<!--                     <div class="icon-block"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"> <i class="fa fa-twitter"></i></a><a href="#"> <i class="fa fa-google-plus"></i></a></div> -->
						</div>
					</div>
				</div>
				<!--Profile Card 3-->
				<div class="col-md-4">
					<div class="card profile-card-3">
						<div class="background-block">
							<img
								src="https://images.pexels.com/photos/1629236/pexels-photo-1629236.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
								alt="profile-sample1" class="background" />
						</div>
						<div class="profile-thumb-block">
							<img src="https://randomuser.me/api/portraits/women/26.jpg"
								alt="profile-image" class="profile" />
						</div>
						<div class="card-content">
							<h2>
								Savannah Fields<small>Chief Executive Officer</small>
							</h2>
							<!--                     <div class="icon-block"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"> <i class="fa fa-twitter"></i></a><a href="#"> <i class="fa fa-google-plus"></i></a></div> -->
						</div>
					</div>
				</div>
				<!--Profile Card 3-->
				<div class="col-md-4">
					<div class="card profile-card-3">
						<div class="background-block">
							<img
								src="https://images.pexels.com/photos/1509534/pexels-photo-1509534.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
								alt="profile-sample1" class="background" />
						</div>
						<div class="profile-thumb-block">
							<img src="https://randomuser.me/api/portraits/men/11.jpg"
								alt="profile-image" class="profile" />
						</div>
						<div class="card-content">
							<h2>
								Landon Hunt<small>Marketing Manager</small>
							</h2>
							<!--                     <div class="icon-block"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"> <i class="fa fa-twitter"></i></a><a href="#"> <i class="fa fa-google-plus"></i></a></div> -->
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>


	<!-- Container (Gallery Section) -->
	<section id="gallery" class="container-fluid mt-3 text-center bg-white">
		<h2 class="mb-1">Gallery</h2>
		<h4 class="mb-2">Memories</h4>
		<!-- Photo Grid -->
		<div class="tz-gallery">

			<div class="row">

				<div class="col-sm-12 col-md-4">
					<a class="lightbox"
						href="img/slide4.jpg">
						<img
						src="img/slide4.jpg"
						alt="Gallery Image 1">
					</a>
				</div>
				<div class="col-sm-6 col-md-4">
					<a class="lightbox"
						href="img/gallery2.jpg">
						<img
						src="img/gallery2.jpg"
						alt="Gallery Image 2">
					</a>
				</div>
				<div class="col-sm-6 col-md-4">
					<a class="lightbox"
						href="img/slide1.jpg">
						<img
						src="img/slide1.jpg"
						alt="Gallery Image 3">
					</a>
				</div>
				<div class="col-sm-12 col-md-4">
					<a class="lightbox h-100"
						href="img/gallery4.jpg">
						<img
						src="img/gallery4.jpg"
						alt="Gallery Image 4">
					</a>
				</div>
				<div class="col-sm-6 col-md-4">
					<a class="lightbox "
						href="img/gallery5.jpg">
						<img
						src="img/gallery5.jpg"
						alt="Gallery Image 5">
					</a>
				</div>
				<div class="col-sm-6 col-md-4">
					<a class="lightbox"
						href="img/gallery6.jpg">
						<img
						src="img/gallery6.jpg"
						alt="Gallery Image 6">
					</a>
				</div>

			</div>

		</div>
	</section>

	<!-- Container (Contact Section) -->
	<section id="contact" class="container-fluid pt-5 bg-grey">
		<h2 class="text-center pb-4 ">CONTACT</h2>
		<div class="row mb-5">
			<div class="col col-lg-4 col-sm-5 text-center">
				<img src="img/logo.jpg" class="rounded-circle m-auto w-50"
					alt="logo" width="80" />
			</div>

			<div class="col col-lg-4 col-sm-5">
				<h4 class="mb-3 txt-blue">Feel free to contact us</h4>
				<p>
					<i class="fas fa-map-marked-alt fa-2x pr-2"></i> No.123,
					Wellawatta, Colombo 6
				</p>
				<p>
					<i class="fas fa-envelope fa-2x pr-2"></i> +0094123456789
				</p>
				<p>
					<i class="fas fa-phone-alt fa-2x pr-2"></i> contact@motortours.com
				</p>
				<h4 class="mb-3 mt-3 txt-blue">Locate us now</h4>
				<img class="img-fluid" src="img/map.jpg" alt="location" />
			</div>

			<div class="col col-lg-4 col-sm-8 mx-sm-auto">
				<h4 class="mb-3 txt-blue">Send us your enquiries</h4>
				<form id="contactForm" name="contactForm"
					action="http://localhost:8080/projectmotortourdemo/motorapi/enquiry"
					method="post">
					<div class="row">
						<div class="col form-group">
							<label for="firstName">First Name</label> <input
								class="form-control" id="firstName" type="text" name="firstName">
						</div>
						<div class="col form-group">
							<label for="lastName">Last Name</label> <input
								class="form-control" id="lastName" type="text" name="lastName">
						</div>
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input class="form-control"
							id="email" type="email" name="email"
							placeholder="example@example.com">
					</div>
					<div class="form-group">
						<label for="phoneNumber">Phone Number</label> <input
							class="form-control" id="phoneNumber" type="text"
							name="phoneNumber" placeholder="(xxx) xxx xxxx"
							data-mask="(000) 000 0000">
					</div>
					<div class="form-group">
						<label for="enquiryCategory">Enquiry Category</label> <select
							class="form-control" id="enquiryCategory" name="enquiryCategory">
							<option selected="selected">Upcoming Tours and Ride-outs</option>
							<option>Booking tours</option>
							<option>Legal requirements for tour participation</option>
							<option>Other</option>
							<%-- 		<option th:each="category : ${T(com.nuzrah.projectmotortourdemo.dao.ENQUIRY_CATEGORY).values()}" th:value="${category}" th:text="${category.tourDisplayName}"></option> --%>
						</select>
					</div>
					<div class="form-group">
						<label for="enquiryDescription">Enquiry/Suggestion</label>
						<textarea class="form-control" id="enquiryDescription"
							name="enquiryDescription"></textarea>
					</div>
					<div>
						<!-- 	    <input class="btn btn-enquiry w-100" id="contactFormSubmit" type="submit" value="Make your enquiry" /> -->
						<input class="btn btn-enquiry w-100" id="contactBtnSubmit"
							type="button" value="Make your enquiry" />
					</div>
				</form>

			</div>
		</div>
	</section>

	<footer class="container-fluid text-center text-white bg-theme">
		<p class="m-0">Motorcycle Tour Ride Out</p>
	</footer>

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
	<!-- Baguette Box JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>
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
    //<!-- Gallery JS -->
    baguetteBox.run('.tz-gallery');
    
    //<!-- Clear fields on load -->
    function ClearForm(){
        document.contactForm.reset();
    }
    
    
    //<!-- Clear Form on submit -->
    $('#contactBtnSubmit').on('click', function () {
    		$("#phoneNumber").unmask();
    		$('#contactForm').submit();
	    	$('#contactForm')[0].reset();
	    	$('select').find('option[selected="selected"]').attr('selected','selected');
    });
    
    //<!-- jQuery Form Validation -->
    $(function() {
    	$("#phoneNumber").mask("(000) 000 0000");
    	
    	  $("form[name='contactForm']").validate({
    	    // Specify validation rules
    	    rules: {
    	      firstName: "required",
    	      lastName: "required",
    	      //enquiryCategory: "required",
    	      enquiryDescription: "required",
    	      email: {
    	        required: true,
    	        email: true
    	      },
    	      phoneNumber: {
    	        required: true,
    	        minlength: 10,
    	        //number:true
    	      }
    	    },
    	    // Specify validation error messages
    	    messages: {
    	      firstname: "Please enter your firstname",
    	      lastname: "Please enter your lastname",
    	      enquiryDescription: "Please type your message",
    	      phoneNumber: {
    	        required: "Please provide a phone number",
    	        minlength: "Please provide a valid phone number",
    	        //number: "Please provide a valid phone number",
    	      },
    	      email: "Please enter a valid email address"
    	    }
    	    // Make sure the form is submitted to the destination defined
    	    // in the "action" attribute of the form when valid
//     	    submitHandler: function(form) {
//     	      form.submit();
//     	    }
    	  });
    	});
    
    
    
</script>


</body>
</html>
