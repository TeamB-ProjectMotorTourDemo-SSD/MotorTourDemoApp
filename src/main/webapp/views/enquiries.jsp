<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<!DOCTYPE html>
<html>
<head>
<title>Enquiry</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="../css/style.main.css" />


</head>
<body id="enquiriesPage">
<!-- 	<form -->
<!-- 		action="http://localhost:8080/projectmotortourdemo/motorapi/enquiry" -->
<!-- 		method="post" id="enquiryForm" name="enquiryForm"> -->

		<div class="container-fluid p-5">

			<div class="text-center mb-5">
				<h1>Enquiry details</h1>
			</div>
			<div class="row">
				<div class="col-4 pt-2" style="background-color: #f5f6f7;">
					<h2>Enquiry Form</h2>
					<hr>
					<% 
						if (request.getParameterMap().containsKey("enquiryID")) {
							final String API_ID_URL = "http://localhost:8080/projectmotortourdemo/motorapi/enquiry/"+request.getParameter("enquiryID");
					        String API_enquiryID = request.getParameter("enquiryID");
					        System.out.println(API_enquiryID);
					        
					        try{
								URL url = new URL(API_ID_URL);
								HttpURLConnection httpURLConnection = (HttpURLConnection)url.openConnection();
								httpURLConnection.setRequestMethod("GET"); // Change this to "POST" for POST requests.
								httpURLConnection.setDoInput(true); //Downloads.
								httpURLConnection.setDoOutput(false);//Uploads. 
								

								System.out.println("REACH code : "+httpURLConnection.getResponseCode());
								
								if(httpURLConnection.getResponseCode() == 200){
									InputStream inputStream = (InputStream)httpURLConnection.getInputStream();
									InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
									BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
									
									System.out.println("REACH here");
									
									//Reading the file line by line.
									
									String line = "";
									StringBuilder sb = new StringBuilder();
									
									while((line = bufferedReader.readLine()) != null){
										sb.append(line);
									}
									
									String jsonString = sb.toString();
									System.out.println("jsonString : "+jsonString);
									
									JsonObject jsonObject = JsonParser.parseString(jsonString).getAsJsonObject();
									
									String selectOption = (String) jsonObject.get("enquiryCategory").getAsString();
					%>
					
					<form
		action="http://localhost:8080/projectmotortourdemo/motorapi/enquiry/update"
		method="post" id="enquiryForm" name="enquiryForm">
					
					<div class=" form-group">
						<label for="firstName"><b>Enquirer First Name</b></label> <input
							type="text" id="firstName" name="firstName" value="<% out.print(jsonObject.get("firstName").getAsString());%>" required>
					</div>

					<div class=" form-group">
						<label for="lastName"><b>Enquirer Last Name</b></label> <input
							type="text" id="lastName" name="lastName" value="<% out.print(jsonObject.get("lastName").getAsString());%>" required>
					</div>

					<div class=" form-group">
						<label for="phoneNumber"><b>Phone number</b></label> <input
							type="text" placeholder="(xxx) xxx xxxx" value="<% out.print(jsonObject.get("phoneNumber").getAsString());%>" name="phoneNumber"
							id="phoneNumber" required>
					</div>

					<div class=" form-group">
						<label for="email"><b>Email</b></label> <input type="email"
							placeholder="example@example.com" value="<% out.print(jsonObject.get("email").getAsString());%>" name="email" id="email"
							required>
					</div>

					<div class=" form-group">
						<label for="enquiryCategory"><b>Enquiry Category</b></label> <select
							id="enquiryCategory" name="enquiryCategory">
							<option value="FUTURE_RIDEOUT_TOURS" selected="selected">Upcoming Tours and Ride-outs</option>
							<option value="BOOKING_TOURS">Booking tours</option>
							<option value="TOUR_LEGAL_REQUIREMENTS">Legal requirements for tour participation</option>
							<option value="OTHER">Other</option>
						</select>
					</div>

					<div class=" form-group">
						<label for="enquiryDescription"><b>Enquiry/Suggestion</b></label>
						<textarea class="form-control" id="enquiryDescription"
							name="enquiryDescription" rows="5"><% out.print(jsonObject.get("enquiryDescription").getAsString());%></textarea>
					</div>
					
					<button class="btn btn-primary button" id="enquiryFormBtn" type="button"
						style="margin: 10px 0px;">Save Record</button>
						</form>
						
						<script>
						var selectedOption = "<%=selectOption%>";
// 						$("select option[value="+selectedOption+"]").prop("selected", true);
						document.getElementById('enquiryCategory').value = selectedOption;
						</script>
						
					<%
								}
								httpURLConnection.disconnect();
			   					
			   				}catch(Exception e){
			   					e.printStackTrace();
			   					
			   					out.print("Error : "+e.getMessage());
			   				}
			   			} else {
					%>	
						<form
		action="http://localhost:8080/projectmotortourdemo/motorapi/enquiry"
		method="post" id="enquiryForm" name="enquiryForm">
					
					<div class=" form-group">
						<label for="firstName"><b>Enquirer First Name</b></label> <input
							type="text" id="firstName" name="firstName" value="" required>
					</div>

					<div class=" form-group">
						<label for="lastName"><b>Enquirer Last Name</b></label> <input
							type="text" id="lastName" name="lastName" required>
					</div>

					<div class=" form-group">
						<label for="phoneNumber"><b>Phone number</b></label> <input
							type="text" placeholder="(xxx) xxx xxxx" name="phoneNumber"
							id="phoneNumber" required>
					</div>

					<div class=" form-group">
						<label for="email"><b>Email</b></label> <input type="email"
							placeholder="example@example.com" name="email" id="email"
							required>
					</div>

					<div class=" form-group">
						<label for="enquiryCategory"><b>Enquiry Category</b></label> <select
							id="enquiryCategory" name="enquiryCategory">
							<option selected="selected">Upcoming Tours and Ride-outs</option>
							<option>Booking tours</option>
							<option>Legal requirements for tour participation</option>
							<option>Other</option>
						</select>
					</div>

					<div class=" form-group">
						<label for="enquiryDescription"><b>Enquiry/Suggestion</b></label>
						<textarea class="form-control" id="enquiryDescription"
							name="enquiryDescription" rows="5"></textarea>
					</div>
					
					<button class="btn btn-primary button" id="enquiryFormBtn" type="button"
						style="margin: 10px 0px;">Submit Record</button>
						</form>
						
						
					
					<%
						} 
					%>	
				</div>


				<div class="col pt-2" style="background-color: #fff;">
					<h2>Enquiry Data</h2>
					<hr>
					
					
				    <input type="text" class="form-control w-25" placeholder="Search..." id="search_field">

					<table class="table table-responsive table-bordered">
						<thead class="thead-light">
							<tr class="thead_row">
								<!--         <th scope="col">Id</th> -->
								<th scope="col">First Name</th>
								<th scope="col">Last Name</th>
								<th scope="col">Phone</th>
								<th scope="col">Email</th>
								<th scope="col">Category</th>
								<th scope="col">Description</th>
								<th scope="col" style="min-width: 200px;"></th>
							</tr>
						</thead>
						<tbody>
							<%
							
								final String API_URL = "http://localhost:8080/projectmotortourdemo/motorapi/enquiry";
						    
							//Fetching data from API.
							try {
								URL url = new URL(API_URL);
								HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
								httpURLConnection.setRequestMethod("GET");
								httpURLConnection.setDoInput(true); //Downloads.
								httpURLConnection.setDoOutput(false);//Uploads.

								InputStream inputStream = (InputStream) httpURLConnection.getInputStream();
								InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
								BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

								if (httpURLConnection.getResponseCode() == 200) {

									//Reading the file line by line.

									String line = "";
									StringBuilder sb = new StringBuilder();

									while ((line = bufferedReader.readLine()) != null) {
								sb.append(line);
									}

									String jsonString = sb.toString();

									JsonArray jsonArray = JsonParser.parseString(jsonString).getAsJsonArray();

									for (int i = 0; i < jsonArray.size(); i++) {
								JsonObject obj = jsonArray.get(i).getAsJsonObject();
							%>
							<tr>
								<!--       <th scope="row">1</th> -->
								<td><%out.print(obj.get("firstName").getAsString()); %></td>
								<td><%out.print(obj.get("lastName").getAsString()); %></td>
								<td><%out.print(obj.get("phoneNumber").getAsString()); %></td>
								<td><%out.print(obj.get("email").getAsString()); %></td>
								<td><%out.print(obj.get("enquiryCategory").getAsString()); %></td>
								<td><span class="overflow-dots"><%out.print(obj.get("enquiryDescription").getAsString()); %></span></td>
								<td>
								<a href="enquiries.jsp?enquiryID=<%out.print(obj.get("enquiryID").getAsString()); %>" id="view" class="btn btn-custom bg-Blue btn-sm" role="button">View / Edit</a> 
<!-- 								<a href="#update" id="update" class="btn btn-custom bg-Blue mx-1 btn-sm" role="button">Update</a>  -->
								<a href="#delete" id="delete" class="btn btn-custom bg-Blue btn-sm" role="button">Delete</a></td>

							</tr>
							<%
								}
								
							%>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>

<!-- 	</form> -->

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
	 //<!-- Clear fields on load -->
    function ClearForm(){
        document.enquiryForm.reset();
    }
    
    
    //<!-- Clear Form on submit -->
		$('#enquiryFormBtn').on(
				'click',
				function() {
					$("#phoneNumber").unmask();
					$('#enquiryForm').submit();
					$('#enquiryForm')[0].reset();
					$('#search_field').val('');
					$('select').find('option[selected="selected"]').attr(
							'selected', 'selected');
				});

		 //<!-- jQuery Form Validation -->
	    $(function() {
	    	$("#phoneNumber").mask("(000) 000 0000");
	    	
	    	  $("form[name='enquiryForm']").validate({
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
// 	     	    submitHandler: function(form) {
// 	     	      form.submit();
// 	     	    }
	    	  });
	    	});
		
// 		$('#search_field').on('keyup', function() {
// 			  var value = $(this).val();
// 			  var patt = new RegExp(value, "i");

// 			  $('#enquiryForm').find('tr').each(function() {
// 			    var $table = $(this);
			    
// 			    if (!($table.find('td').text().search(patt) >= 0)) {
// 			      $table.not('.thead_row').hide();
// 			    }
// 			    if (($table.find('td').text().search(patt) >= 0)) {
// 			      $(this).show();
// 			    }
			    
// 			  });
			 
// 			});
	</script>
	<%
							}

							} catch (Exception e) {
								e.printStackTrace();

								out.print("Error : " + e.getMessage());
							}
							%>
</body>
</html>
