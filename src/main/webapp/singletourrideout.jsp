<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<html>
<head>
	<title>Car Application</title>
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	
</head>
<body>
    <h2>Solent Cohort 01</h2>
    <h2>This is a good batch</h2>
    <h2>Solent Cohort 01 @BCAS CITY CAMPUS</h2>
    <h3>These are car details</h3>
    
   
    <!-- I'm just creating <ul> and put values. -->
    
	<div>
		<ul>
   			<% 
   				
   			  	final String API_URL = "http://localhost:8080/projectmotortourdemo/motorapi/tourrideout/"+request.getParameter("tourID");
   				//Fetching data from API.
   				try{
					URL url = new URL(API_URL);
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
						
						System.out.println("NAME : "+jsonObject.get("tourID").getAsString());
						%>
							<li>TOUR -<% out.print(jsonObject.get("tourName").getAsString());%></li>
							
						<% 
						
					}
					httpURLConnection.disconnect();
   					
   				}catch(Exception e){
   					e.printStackTrace();
   					
   					out.print("Error : "+e.getMessage());
   				}
   			%>
   		</ul>	
   	</div>
   	
   	<hr/>
   	
   	
   	
<!--    	 <form action="http://localhost:8080/projectmotortourdemo/motorapi/tourday" method="post"> -->
<!-- <!-- 	<form action="https://motor-tour-demo-teamb.herokuapp.com/motorapi/enquiry" method="post"> --> -->
<%-- 		<input type="text" name="tourID" value="<%=request.getParameter("tourID")%>"> --%>
<!-- 		<input type="text" name="startHotel" placeholder="startHotel"><br/> -->
<!-- 		<input type="text" name="endHotel" placeholder="endHotel"><br/> -->
<!-- 		<input type="text" name="routeNote" placeholder="routeNote"><br/> -->
<!-- 		<input type="text" name="routeMap" placeholder="routeMap"><br/> -->
<!-- 		<input type="submit" value="Submit"> -->
<!-- 	</form> -->

<hr>
	
<!-- 	<form action="http://localhost:8080/projectmotortourdemo/motorapi/tourday" method="post">     -->
	<table id="emptbl">
		<tr>
			<th>tourID</th>
			<th>startHotel</th>
			<th>endHotel</th>
			<th>routeNote</th> 
			<th>routeMap</th> 
		</tr> 
		<form action="http://localhost:8080/projectmotortourdemo/motorapi/tourday" method="post">
		<tr> 
			<td id="col0"><input type="text" name="tourID" value="<%=request.getParameter("tourID")%>"/></td> 
			<td id="col1"><input type="text" name="startHotel" /></td> 
			<td id="col2"><input type="text" name="endHotel"  /></td>
			<td id="col3"><input type="text" name="routeNote" /></td>
			<td id="col4"><input type="text" name="endHotel" /></td> 
			<td id="col5"><input type="submit" value="Submit" /></td> 
<!-- 			<td id="col5"><input type="button" value="SAVE" id="save"/></td>  -->			
		</tr>
		</form>  
	</table> 
	<table> 
		<tr> 
			<td><input type="button" value="Add Row" onclick="addRows()" /></td> 
			<td><input type="button" value="Delete Row" onclick="deleteRows()" /></td> 
<!-- 			<td><input type="submit" value="Submit" /></td>  -->
		</tr>  
	</table> 
<!--  </form>  -->
 
 <pre id="output" style="width:100%;
     background-color:whitesmoke; 
    white-space: pre-wrap;">hfghfgh</pre>
    
    
    
    
</body>

<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script type="text/javascript">
// $('form').change(function(){
	   
// 	   $("form").submit(function(event) {
// 			  var newFormData = [];
// 			  jQuery('#emptbl tr:not(:first)').each(function(i) {
// 			    var tb = jQuery(this);
// 			    var obj = {};
// 			    tb.find('input').each(function() {
// 			      obj[this.name] = this.value;
// 			    });
// 			    obj['row'] = i;
// 			    newFormData.push(obj);
// 			  });
// 			  console.log(newFormData);
// 			  var Stringified = JSON.stringify(newFormData);
// 			  document.getElementById('output').innerHTML = Stringified;
// 			  event.preventDefault();
// 			});
// 	});

// 	   $("form").submit(function(event) {
// 			  var newFormData = [];
// 			  jQuery('#emptbl tr:not(:first)').each(function(i) {
// 			    var tb = jQuery(this);
// 			    var obj = {};
// 			    tb.find('input').each(function() {
// 			      obj[this.name] = this.value;
// 			    });
// 			    obj['row'] = i;
// 			    newFormData.push(obj);
// 			  });
// 			  console.log(newFormData);
// 			  var Stringified = JSON.stringify(newFormData);
// 			  document.getElementById('output').innerHTML = Stringified;
// // 			  document.getElementById('output').innerHTML = JSON.stringify(Stringified);
			  
// // 				  var saveData = $.ajax({
// // 				      type: "POST",
// // 				      url: "http://localhost:8080/projectmotortourdemo/motorapi/tourday",
// // 				      data: Stringified,
// // 				      dataType: "html",
// // 				      success: function(resultData){
// // 				          console.log("Save Complete");
// // 				      }
// // 				});
// // 				saveData.error(function() { console.log("Something went wrong"); });
			
// 			  event.preventDefault();
			  
			  
// 			});

	   
	
function addRows(){ 
	var table = document.getElementById('emptbl');
	var rowCount = table.rows.length;
	var cellCount = table.rows[0].cells.length; 
	var row = table.insertRow(rowCount);
	for(var i =0; i <= cellCount; i++){
		var cell = 'cell'+i;
		cell = row.insertCell(i);
		var copycel = document.getElementById('col'+i).innerHTML;
		cell.innerHTML=copycel;
		
	}
}
function deleteRows(){
	var table = document.getElementById('emptbl');
	var rowCount = table.rows.length;
	if(rowCount > '2'){
		var row = table.deleteRow(rowCount-1);
		rowCount--;
	}
	else{
		alert('There should be atleast one row');
	}
}
</script>


</html>
