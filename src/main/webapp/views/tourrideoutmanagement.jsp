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
<title>Tour Ride Out</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/style.main.css" />



</head>
<body id="tourrideoutmanagementPage">

	<div class="container-fluid p-5">

		<div class="text-center mb-5">
			<h1>Tour Ride Out details</h1>
		</div>
		<div class="row">
			<div class="col-4 pt-2" style="background-color: #f5f6f7;">
				<h2>Tour Ride Out Form</h2>
				<hr>
				<form method="post"
					action="../processes/tourRideOutUpdateProcess.jsp"
					id="tourRideOutFormUpdate" name="tourRideOutFormUpdate">

					<%
						if (request.getParameterMap().containsKey("tourID")) {
						final String API_ID_URL = "https://motor-tour-demo-teamb.herokuapp.com/motorapi/tourrideout/"+ request.getParameter("tourID");
						String API_tourID = request.getParameter("tourID");
						System.out.println(API_tourID);

						try {
							URL url = new URL(API_ID_URL);
							HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
							httpURLConnection.setRequestMethod("GET"); // Change this to "POST" for POST requests.
							httpURLConnection.setDoInput(true); //Downloads.
							httpURLConnection.setDoOutput(false);//Uploads. 

							System.out.println("REACH code : " + httpURLConnection.getResponseCode());

							if (httpURLConnection.getResponseCode() == 200) {
						InputStream inputStream = (InputStream) httpURLConnection.getInputStream();
						InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
						BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

						System.out.println("REACH here");

						//Reading the file line by line.

						String line = "";
						StringBuilder sb = new StringBuilder();

						while ((line = bufferedReader.readLine()) != null) {
							sb.append(line);
						}

						String jsonString = sb.toString();
						System.out.println("jsonString : " + jsonString);

						JsonObject jsonObject = JsonParser.parseString(jsonString).getAsJsonObject();

						String selectOption = (String) jsonObject.get("availability").getAsString();
						int tourID = (Integer) jsonObject.get("tourID").getAsInt();
					%>

					<div class=" form-group" hidden="hidden">
						<label for="tourID"><b>Tour Name</b></label> <input type="text"
							id="tourID" name="tourID"
							value="<%out.print(jsonObject.get("tourID").getAsString());%>"
							required>
					</div>

					<div class=" form-group">
						<label for="tourName"><b>Tour Name</b></label> <input type="text"
							id="tourName" name="tourName"
							value="<%out.print(jsonObject.get("tourName").getAsString());%>"
							required>
					</div>

					<div class=" form-group">
						<label for="tourDescription"><b>Tour Description</b></label>
						<textarea class="form-control" id="tourDescription"
							name="tourDescription" rows="5"><%out.print(jsonObject.get("tourDescription").getAsString());%></textarea>
					</div>

					<div class=" form-group">
						<label for="tourDuration"><b>Tour Duration (in Days)</b></label> <input
							type="text" placeholder=""
							value="<%out.print(jsonObject.get("tourDuration").getAsString());%>"
							name="tourDuration" id="tourDuration" required>
					</div>

					<div class=" form-group">
						<label for="legalRequirements"><b>Tour Description</b></label>
						<textarea class="form-control" id="legalRequirements"
							name="legalRequirements" rows="5"><%out.print(jsonObject.get("legalRequirements").getAsString());%></textarea>
					</div>

					<div class=" form-group">
						<label for="tourLeaderFirstName"><b>Tour Leader First
								Name</b></label> <input type="text" id="tourLeaderFirstName"
							name="tourLeaderFirstName"
							value="<%out.print(jsonObject.get("tourLeaderFirstName").getAsString());%>"
							required>
					</div>

					<div class=" form-group">
						<label for="tourLeaderLastName"><b>Tour Leader Last
								Name</b></label> <input type="text" id="tourLeaderLastName"
							name="tourLeaderLastName"
							value="<%out.print(jsonObject.get("tourLeaderLastName").getAsString());%>"
							required>
					</div>

					<div class=" form-group">
						<label for="availability"><b>Availability</b></label> <select
							id="availability" name="availability">
							<option value="UPCOMING" selected="selected">Upcoming
								Tour</option>
							<option value="ONGOING">On-going Tour</option>
							<option value="COMPLETED">Completed Tour</option>
						</select>
					</div>

					<div class=" form-group">
						<label for="startLocation"><b>Start Location</b></label> <input
							type="text" placeholder=""
							value="<%out.print(jsonObject.get("startLocation").getAsString());%>"
							name="startLocation" id="startLocation" required>
					</div>

					<div class=" form-group">
						<label for="endLocation"><b>End Location</b></label> <input
							type="text" placeholder=""
							value="<%out.print(jsonObject.get("endLocation").getAsString());%>"
							name="endLocation" id="endLocation" required>
					</div>

					<script>
						//Select option
						var selectedOption = "<%=selectOption%>";
						document.getElementById('availability').value = selectedOption;
					</script>


					<%
						}
					httpURLConnection.disconnect();
					%>
					<button class="btn btn-primary button"
						id="tourRideOutUpdateFormBtn" type="submit"
						style="margin: 10px 0px;">Save Record</button>

				</form>
				<%
					} catch (Exception e) {
					e.printStackTrace();

					out.print("Error : " + e.getMessage());
				}
				} else {
				%>
				<form
					action="https://motor-tour-demo-teamb.herokuapp.com/motorapi/tourrideout"
					method="post" id="tourRideOutForm" name="tourRideOutForm">

					<div class=" form-group">
						<label for="tourName"><b>Tour Name</b></label> <input type="text"
							id="tourName" name="tourName"
							value=""
							required>
					</div>

					<div class=" form-group">
						<label for="tourDescription"><b>Tour Description</b></label>
						<textarea class="form-control" id="tourDescription"
							name="tourDescription" rows="5"></textarea>
					</div>

					<div class=" form-group">
						<label for="tourDuration"><b>Tour Duration (in Days)</b></label> <input
							type="text" placeholder=""
							name="tourDuration" id="tourDuration" required>
					</div>

					<div class=" form-group">
						<label for="legalRequirements"><b>Tour Description</b></label>
						<textarea class="form-control" id="legalRequirements"
							name="legalRequirements" rows="5"></textarea>
					</div>

					<div class=" form-group">
						<label for="tourLeaderFirstName"><b>Tour Leader First
								Name</b></label> <input type="text" id="tourLeaderFirstName"
							name="tourLeaderFirstName"
							required>
					</div>

					<div class=" form-group">
						<label for="tourLeaderLastName"><b>Tour Leader Last
								Name</b></label> <input type="text" id="tourLeaderLastName"
							name="tourLeaderLastName"
							required>
					</div>

					<div class=" form-group">
						<label for="availability"><b>Availability</b></label> <select
							id="availability" name="availability">
							<option value="UPCOMING" selected="selected">Upcoming
								Tour</option>
							<option value="ONGOING">On-going Tour</option>
							<option value="COMPLETED">Completed Tour</option>
						</select>
					</div>

					<div class=" form-group">
						<label for="startLocation"><b>Start Location</b></label> <input
							type="text" placeholder=""
							name="startLocation" id="startLocation" required>
					</div>

					<div class=" form-group">
						<label for="endLocation"><b>End Location</b></label> <input
							type="text" placeholder=""
							name="endLocation" id="endLocation" required>
					</div>

					<button class="btn btn-primary button" id="tourRideOutFormBtn"
						type="submit" style="margin: 10px 0px;">Submit Record</button>
				</form>



				<%
					}
				%>
			</div>


			<div class="col pt-2" style="background-color: #fff;">
				<h2>Tour Ride Out Data</h2>
				<hr>


				<input type="text" class="form-control w-25" placeholder="Search..."
					id="search_field">

				<table class="table table-responsive table-bordered"
					id="tourRideOutTable">
					<thead class="thead-light">
						<tr class="thead_row">
							<!--         <th scope="col">Id</th> -->
							<th scope="col">Tour Name</th>
							<th scope="col">Description</th>
							<th scope="col">Duration</th>
							<th scope="col">Requirements</th>
							<th scope="col">First Name</th>
							<th scope="col">Last Name</th>
							<th scope="col">Availability</th>
							<th scope="col">Start Location</th>
							<th scope="col">End Location</th>
							<th scope="col" style="min-width: 200px;"></th>
						</tr>
					</thead>
					<tbody>
						<%
							final String API_URL = "https://motor-tour-demo-teamb.herokuapp.com/motorapi/tourrideout";

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
							<td>
								<%
									out.print(obj.get("tourName").getAsString());
								%>
							</td>
							<td><span class="overflow-dots">
									<%
										out.print(obj.get("tourDescription").getAsString());
									%>
							</span></td>
							<td>
								<%
									out.print(obj.get("tourDuration").getAsString());
								%>
							</td>
							<td><span class="overflow-dots">
									<%
										out.print(obj.get("legalRequirements").getAsString());
									%>
							</span></td>
							<td>
								<%
									out.print(obj.get("tourLeaderFirstName").getAsString());
								%>
							</td>
							<td>
								<%
									out.print(obj.get("tourLeaderLastName").getAsString());
								%>
							</td>
							<td>
								<%
									out.print(obj.get("availability").getAsString());
								%>
							</td>
							<td>
								<%
									out.print(obj.get("startLocation").getAsString());
								%>
							</td>
							<td>
								<%
									out.print(obj.get("endLocation").getAsString());
								%>
							</td>
							<td><a
								href="tourrideoutmanagement.jsp?tourID=<%out.print(obj.get("tourID").getAsString());%>"
								id="view" class="btn btn-custom bg-Blue btn-sm" role="button">View
									/ Edit</a> <a
								href="tourdaymanagement.jsp?tourID=<%out.print(obj.get("tourID").getAsString());%>"
								id="addTourDay" class="btn btn-custom bg-Blue mx-1 btn-sm"
								role="button">Add Tour Day</a> <a
								href="../processes/tourRideOutDeleteProcess.jsp?tourID=<%out.print(obj.get("tourID").getAsString());%>"
								id="delete" class="btn btn-custom bg-Blue btn-sm" role="button">Delete</a></td>


						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- #####  Staring of all JavaScript Scripts  ##### -->
	<!--  jQuery (Necessary for All JavaScript Scripts) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<!--  jQuery Mask JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>

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


	<script>
		function ClearForm() {
			document.tourRideOutForm.reset();
			document.getElementById("search_field").value = "";
		}

		//<!-- Clear Form on submit -->
		// 		$('#tourRideOutFormBtn').on(
		// 				'click',
		// 				function() {
		// 					$('#tourRideOutForm').submit();
		// 					//$('#tourRideOutForm')[0].reset();
		// 					$('select').find('option[selected="selected"]').attr(
		// 							'selected', 'selected');
		// 				});

		$('#tourRideOutUpdateFormBtn').on('click', function() {
			$('#tourRideOutUpdateForm').submit();
		});

		//<!-- jQuery Form Validation -->
		// 	    $(function() {

		// 	    	  $("form[name='tourRideOutForm']").validate({
		// 	    	    // Specify validation rules
		// 	    	    rules: {
		// 	    	      firstName: "required",
		// 	    	      lastName: "required",
		// 	    	      //tourRideOutCategory: "required",
		// 	    	      tourRideOutDescription: "required",
		// 	    	      email: {
		// 	    	        required: true,
		// 	    	        number: true
		// 	    	      }

		// 	    	    },
		// 	    	    // Specify validation error messages
		// 	    	    messages: {
		// 	    	      firstname: "Please enter your firstname",
		// 	    	      lastname: "Please enter your lastname",
		// 	    	      tourRideOutDescription: "Please type your message",
		// 	    	      phoneNumber: {
		// 	    	        required: "Please provide a phone number",
		// 	    	        minlength: "Please provide a valid phone number",
		// 	    	        //number: "Please provide a valid phone number",
		// 	    	      },
		// 	    	      email: "Please enter a valid email address"
		// 	    	    }
		// 	    	  });
		// 	    	});

		$('#search_field').on('keyup', function() {
			var value = $(this).val();
			var patt = new RegExp(value, "i");

			$('#tourRideOutTable').find('tr').each(function() {
				var $table = $(this);

				if (!($table.find('td').text().search(patt) >= 0)) {
					$table.not('.thead_row').hide();
				}
				if (($table.find('td').text().search(patt) >= 0)) {
					$(this).show();
				}

			});

		});
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
