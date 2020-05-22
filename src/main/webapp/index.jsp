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
    
    <h2>Jersey RESTful Web Application!</h2>
    <p><a href="addenquiry.jsp">Jersey resource</a>
    <p>Visit <a href="http://localhost:8080/projectmotortourdemo/motorapi/enquiry">Project Jersey website</a>
    for more information on Jersey!!!!!
    
   	<table>
   		<thead>
   			<tr>
   				<th>API Page</th>
   				<th>Page</th>
   			</tr>
   		</thead>
   		<tbody>
   			<% 
   			  	final String API_URL = "http://localhost:8080/projectmotortourdemo/motorapi/tourrideout";
   			
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
									<td><a href="http://localhost:8080/projectmotortourdemo/motorapi/tourrideout/?tourID=<%out.print(obj.get("tourID").getAsString()); %>"><% out.print(obj.get("tourID").getAsString());%></a></td>
									<td><a href="singletourrideout.jsp?tourID=<%out.print(obj.get("tourID").getAsString()); %>">LINK</a></td>
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
   	
   	<hr/>
   	
 
    
</body>
</html>
