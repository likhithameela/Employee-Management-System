<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@ page import = "com.employee.bean.LoginBean"%>
<%@ page import = "java.sql.*" %>

<%
   if(session.getAttribute("empid") == null) {
      response.sendRedirect(request.getContextPath() +"/EmpPage.jsp");
   }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave Approval</title>
</head>
<body>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
.button {
    background-color: white; 
    color: black;
     border: 2px solid white;
     cursor: pointer;
    }
    
.btn {
    border: none;
    color: white;
    padding: 10px 20px;
    font-size: 14px;
    cursor: pointer;
}

.success {background-color: #4CAF50;} /* Green */
.success:hover {background-color: #46a049;}
    
.danger {background-color: #f44336;} /* Red */ 
.danger:hover {background: #da190b;}

    
</style>

<div class="w3-top">
	<div class="w3-bar w3-black w3-card-2" id="myNavbar">
		<a href="Home.html" class="w3-bar-item w3-button w3-wide"><img
			src="oooo.png" width="60px" height="50px">TreYsta unS</a>
			
		<!-- Right-sided navbar links -->
		<div class="w3-right w3-hide-small" align="left">
		   <div class="w3-right w3-hide-small">
      <a href="ChangePassword.jsp" class="w3-bar-item w3-button">Change Password</a>

    </div>
			<a href = "Login.jsp" class="w3-bar-item w3-button"> <i class="fa fa-power-off fa-fw w3-margin-right w3-xxlarge w3-text-white"></i></a>
		</div>
	</div>
</div>
<br>
<br><br>

<body class="w3-light-grey">



<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;">

 <div class="w3-container w3-card-2 w3-white w3-margin-bottom">
       
  <!-- The Grid -->
  <div class="w3-row-padding">
  
    <!-- Left Column -->
    <div class="w3-third">
    
      <div class="w3-white w3-text-grey w3-card-4">
        <div class="w3-display-container">
          <h3><c:out value="${row.emp_name}" /></h3>
          <div class="w3-display-bottomleft w3-container w3-text-black">
            
          </div>
        </div>
        
        <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/ems" user = "root"  password = "root"/>
         
      <sql:query dataSource = "${dbSource}" var = "result" >
           select emp_name , designation , address , email , contact , leaves , salary from employee where emp_id = "<%= session.getAttribute("empid") %>";
      </sql:query>
      
      <sql:query dataSource = "${dbSource}" var = "sendmail" >
			select b.email as email from employee b JOIN employee e on b.emp_id = e.manager_id and e.emp_id = "<%= session.getAttribute("empid") %>";
      </sql:query>
      
				<table >
					
					<c:forEach var="row" items="${result.rows}">
						<tr>
							<td><h1><c:out value="${row.emp_name}" /></h1></td>
						</tr>
						<tr>	
							<td><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i><c:out value="${row.designation}" /></td>
						</tr>
						<tr>	
							<td><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i><c:out value="${row.address}" /></td>
						</tr>
						<tr>
							<td><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i><c:out value="${row.email}" /></td>
						</tr>
						<tr>
							<td><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i><c:out value="${row.contact}" /></td>
						</tr>
					</c:forEach>
				</table>
	</div>

    <!-- End Left Column -->
    </div>
    
    <!-- 
    <sql:query dataSource = "${dbSource}" var = "approvallist" >
    	select ls.from_date as fromdate , ls.to_date as todate , ls.reason as reason , ls.emp_id as id from leave_sheet ls INNER JOIN employee emp on ls.emp_id = emp.emp_id where emp.emp_id IN (select emp.emp_id from employee emp where manager_id = "<%= session.getAttribute("empid") %>");    
    </sql:query>
   
   -->
 
 <%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "ems";
String userId = "root";
String password = "root";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Pending Leaves</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<td><b>ID</b></td>
<td><b>From Date</b></td>
<td><b>To Date</b></td>
<td><b>Reason</b></td>
<td><b>Approve</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String waiting = "waiting";

String value = (String)session.getAttribute("empid");
System.out.println(value);
//String sql =" select * from leave_sheet ls INNER JOIN employee emp on ls.emp_id = emp.emp_id and ls.approved = '"+waiting+"' where emp.emp_id IN (select emp.emp_id from employee emp where manager_id = 'TU0002')  ;";
System.out.println("Executing Query");
resultSet = statement.executeQuery("select * from leave_sheet ls INNER JOIN employee emp on ls.emp_id = emp.emp_id and ls.approved = '"+waiting+"' where emp.emp_id IN (select emp.emp_id from employee emp where manager_id = '"+value+"' )" );
while(resultSet.next()){
%>
<form action = "LeaveApprovalServlet" method = "post">
<tr>
<td><%=resultSet.getString(5) %></td>
<td><%=resultSet.getString(2) %></td>
<td><%=resultSet.getString(3) %></td>
<td><%=resultSet.getString(4) %></td>
<%String id = resultSet.getString(5);%>
<td><button type = "submit" onclick="" name = "id" value = "<%= id %>">Approve</a></button></td>
<% System.out.println(id);%>
</tr>
</form>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</body>
   
   
    <!-- Right Column -->
    <!--  
    
    -->
    <!-- End Right column -->
<br><br>
</body>
</html>