<%@page import="javax.sql.*"%> 
<%@page import="java.sql.*,java.util.*"%> 
<%@page import="java.sql.Connection"%>
<%@page import="com.nuzrah.projectmotortourdemo.dao.UserDao"%>
<%@page import="com.nuzrah.projectmotortourdemo.model.User"%>
<%@page import="com.nuzrah.projectmotortourdemo.factory.UserFactory"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<jsp:useBean id="obj" class="com.nuzrah.projectmotortourdemo.model.User"/> 
  

<jsp:setProperty property="*" name="obj"/>
<%
		boolean status = UserDao.validate(obj);
		if(status){
			out.println("You r successfully logged in");
			User user= new User();
			user.getUserRole();
			
		}
		else
		{
		out.print("Sorry, email or password error");
		%>
		<jsp:include page="sample.jsp"></jsp:include>
		<%
		}
%>
