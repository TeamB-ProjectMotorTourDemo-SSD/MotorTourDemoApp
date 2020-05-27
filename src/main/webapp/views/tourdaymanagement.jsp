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
<title>Tour Day</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/style.main.css" />



</head>
<body id="tourdaymanagementPage">
	<!-- 	<form -->
	<!-- 		action=" https://motor-tour-demo-teamb.herokuapp.com/motorapi/tourday" -->
	<!-- 		method="post" id="tourDayForm" name="tourDayForm"> -->

	<div class="container-fluid p-5">

		<div class="text-center mb-5">
			<h1>Tour Day details</h1>
		</div>
		<div class="row">
			<div class="col-4 pt-2" style="background-color: #f5f6f7;">
				<h2>Tour Day Form</h2>
				<hr>
				<form method="post"
					action="../processes/tourDayUpdateProcess.jsp"
					id="tourDayFormUpdate" name="tourDayFormUpdate">

					<%
						if (request.getParameterMap().containsKey("tourDayID")) {
						final String API_ID_URL = " https://motor-tour-demo-teamb.herokuapp.com/motorapi/tourday/"+request.getParameter("tourDayID");
						String API_tourID = request.getParameter("tourDayID");
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
						int tourDayID = (Integer) jsonObject.get("tourDayID").getAsInt();
					%>

					<div class=" form-group" hidden="hidden">
						<label for="tourDayID"><b>Tour Day ID</b></label> <input type="text"
							id="tourDayID" name="tourDayID"
							value="<%out.print(jsonObject.get("tourDayID").getAsString());%>"
							required>
					</div>

					<div class=" form-group">
						<label for="startHotel"><b>Start Hotel</b></label> <input type="text"
							id="startHotel" name="startHotel"
							value="<%out.print(jsonObject.get("startHotel").getAsString());%>"
							required>
					</div>

					<div class=" form-group">
						<label for="endHotel"><b>End Hotel</b></label> <input
							type="text" placeholder=""
							value="<%out.print(jsonObject.get("endHotel").getAsString());%>"
							name="endHotel" id="endHotel" required>
					</div>

					<div class=" form-group">
						<label for="routeNote"><b>Route Note</b></label>
						<textarea class="form-control" id="routeNote"
							name="routeNote" rows="5"><%out.print(jsonObject.get("routeNote").getAsString());%></textarea>
					</div>



					<%
						}
					httpURLConnection.disconnect();
					%>
					<button class="btn btn-primary button"
						id="tourDayUpdateFormBtn" type="submit"
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
					action=" https://motor-tour-demo-teamb.herokuapp.com/motorapi/tourday"
					method="post" id="tourDayForm" name="tourDayForm">

					<div class=" form-group" hidden="hidden">
						<label for="tourDayID"><b>Tour Day ID</b></label> <input type="text"
							id="tourDayID" name="tourDayID" value="<%=request.getParameter("tourID")%>"
							required>
					</div>

					<div class=" form-group">
						<label for="startHotel"><b>Start Hotel</b></label> <input type="text"
							id="startHotel" name="startHotel" required>
					</div>

					<div class=" form-group">
						<label for="endHotel"><b>End Hotel</b></label> <input
							type="text" placeholder=""
							name="endHotel" id="endHotel" required>
					</div>

					<div class=" form-group">
						<label for="routeNote"><b>Route Note</b></label>
						<textarea class="form-control" id="routeNote"
							name="routeNote" rows="5"></textarea>
					</div>

					<button class="btn btn-primary button" id="tourDayFormBtn"
						type="submit" style="margin: 10px 0px;">Submit Record</button>
				</form>



				<%
					}
				%>
			</div>


			<div class="col pt-2" style="background-color: #fff;">
				<h2>Tour Day Data</h2>
				<hr>


				<input type="text" class="form-control w-25" placeholder="Search..."
					id="search_field">

				<table class="table table-responsive table-bordered"
					id="tourDayTable">
					<thead class="thead-light">
						<tr class="thead_row">
							<!--         <th scope="col">Id</th> -->
							<th scope="col">Start Hotel</th>
							<th scope="col">End Hotel</th>
							<th scope="col">Route Note</th>
							<th scope="col" style="min-width: 250px;"></th>
						</tr>
					</thead>
					<tbody>
						<%
							final String API_URL = " https://motor-tour-demo-teamb.herokuapp.com/motorapi/tourday"+request.getParameter("tourDayID");

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
									out.print(obj.get("startHotel").getAsString());
								%>
							</td>
							<td>
								<%
									out.print(obj.get("endHotel").getAsString());
								%>
							</td>
							<td><span class="overflow-dots">
									<%
										out.print(obj.get("routeNote").getAsString());
									%>
							</span></td>
							
							<td><a
								href="tourdaymanagement.jsp?tourDayID=<%out.print(obj.get("tourDayID").getAsString());%>"
								id="view" class="btn btn-custom bg-Blue btn-sm" role="button">View
									/ Edit</a> <a
								href="../processes/tourDayDeleteProcess.jsp?tourDayID=<%out.print(obj.get("tourDayID").getAsString());%>"
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
			document.tourDayForm.reset();
			document.getElementById("search_field").value = "";
		}

		//<!-- Clear Form on submit -->
		// 		$('#tourDayFormBtn').on(
		// 				'click',
		// 				function() {
		// 					$('#tourDayForm').submit();
		// 					//$('#tourDayForm')[0].reset();
		// 					$('select').find('option[selected="selected"]').attr(
		// 							'selected', 'selected');
		// 				});

		$('#tourDayUpdateFormBtn').on('click', function() {
			$('#tourDayUpdateForm').submit();
		});

		//<!-- jQuery Form Validation -->
		// 	    $(function() {

		// 	    	  $("form[name='tourDayForm']").validate({
		// 	    	    // Specify validation rules
		// 	    	    rules: {
		// 	    	      firstName: "required",
		// 	    	      lastName: "required",
		// 	    	      //tourDayCategory: "required",
		// 	    	      tourDayDescription: "required",
		// 	    	      email: {
		// 	    	        required: true,
		// 	    	        number: true
		// 	    	      }

		// 	    	    },
		// 	    	    // Specify validation error messages
		// 	    	    messages: {
		// 	    	      firstname: "Please enter your firstname",
		// 	    	      lastname: "Please enter your lastname",
		// 	    	      tourDayDescription: "Please type your message",
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

			$('#tourDayTable').find('tr').each(function() {
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
