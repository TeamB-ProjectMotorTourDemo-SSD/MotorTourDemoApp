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
	<title>Motor Application</title>
	<link rel="stylesheet" type="text/css" href="CSS/motorstyle.css" />
	
</head>
<body>
    <h2>Solent Batch 01</h2>
    <h3>These are motor details</h3>
    
   	<table>
   		<thead>
   			<tr>
   				<th>Motor_ID</th>
   				<th>Motor_Name</th>
   				<th>Motor_Brand</th>
   				<th>Motor_Year</th>
   				<th>Motor_Color</th>
   				<th>Motor_Type</th>
   			</tr>
   		</thead>
   		<tbody>
   			<% 
   			  	final String API_URL = "http://localhost:8080/MotorTourRide/motorapi/motors";
   			
   				//Fetching data from API.
   				try{
					URL url = new URL(API_URL);
					HttpURLConnection httpURLConnection = (HttpURLConnection)url.openConnection();
					httpURLConnection.setRequestMethod("GET");
					httpURLConnection.setDoInput(true); //Downloads.
					httpURLConnection.setDoOutput(false);//Uploads.
					
					InputStream inputStream = (InputStream)httpURLConnection.getInputStream();
					InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
					BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
					
					if(httpURLConnection.getResponseCode() == 200){
						
						//Reading the file line by line.
						
						String line = "";
						StringBuilder sb = new StringBuilder();
						
						while((line = bufferedReader.readLine()) != null){
							sb.append(line);
						}
						
						String jsonString = sb.toString();
						
						JsonArray jsonArray = JsonParser.parseString(jsonString).getAsJsonArray();	
						
						for(int i =0; i < jsonArray.size(); i++){
							JsonObject obj = jsonArray.get(i).getAsJsonObject();
							
							%>
								<tr>
									<td><% out.print(obj.get("motor_id").getAsString()); %></td>
									<td><% out.print(obj.get("motor_name").getAsString()); %></td>
									<td><% out.print(obj.get("motor_brand").getAsString()); %></td>
									<td><% out.print(obj.get("motor_year").getAsString()); %></td>
									<td><% out.print(obj.get("motor_color").getAsString()); %></td>
									<td><% out.print(obj.get("motor_type").getAsString()); %></td>
								</tr>
							<% 
						}
						
					}
   					
   				}catch(Exception e){
   					e.printStackTrace();
   					
   					out.print("Error : "+e.getMessage());
   				}
    			
   			%>
   			
   		</tbody>
   	</table>
    
</body>
</html>
