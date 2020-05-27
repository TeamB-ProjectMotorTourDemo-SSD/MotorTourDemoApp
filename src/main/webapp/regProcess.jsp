
<%@page import="javax.sql.*"%> 
<%@page import="java.sql.*,java.util.*"%> 
<%@page import="java.sql.Connection"%>
<%@page import="com.nuzrah.projectmotortourdemo.dao.UserDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<jsp:useBean id="obj" class="com.nuzrah.projectmotortourdemo.model.User"/> 
  
<jsp:setProperty property="*" name="obj"/>  

<%  
	 
		String userRole=request.getParameter("userRole");
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String dob=request.getParameter("dob");
		String addressLine1=request.getParameter("addressLine1");
		String addressLine2=request.getParameter("addressLine2");
		String city=request.getParameter("city");
		String gender=request.getParameter("gender");
		String phoneNumber=request.getParameter("phoneNumber");
		
		boolean count=UserDao.add(obj);  
		
		if(count){  
			out.println("You r successfully inserted");  
		
			}  
			else  
			{  
			out.print("Sorry, email or password error");  }
  
%>  