<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
    pageEncoding="ISO-8859-15"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-15">
<title>Insert title here</title>
</head>
<body>

<sql:setDataSource var="dbSource" driver="com.mysql.jdbc.Driver"
						url="jdbc:mysql://localhost/ems" user="root" password="root" />

<sql:query dataSource = "${dbSource}" var = "project" >
           select  task_name , emp_id , num_of_hours , date , project_id  from time_sheet where project_id = "<%= session.getAttribute("projectid") %>";
      </sql:query> 
      
 <center>
						<fieldset style="width: 70%">
							<legend>Project Details</legend>
							<div class="main-details">
							<table width = "50%" border = "1">
							 <thead>
							<tr>
							    <th class="orange-gradient">Project ID</th>
								<th class="orange-gradient">Employee ID</th>
								<th class="orange-gradient">Task Name</th>
								<th class="orange-gradient">Hours Worked</th>
								<th class="orange-gradient">Date</th>
							</tr>
						</thead>
								<c:forEach var="row" items="${project.rows}">
						
						<tbody>
						
						<tr >
						<td align="center"><c:out value="${row.project_id}" /></td>
						<td align="center"><c:out value="${row.emp_id}" /></td>	
						<td align="center"><c:out value="${row.task_name}" /></td>
						<td align="center"><c:out value="${row.num_of_hours}" /></td>
						<td align="center"><c:out value="${row.date}" /></td>
						</tr>
											 
						</tbody>
						</c:forEach>									
								
								</table>
							</div>
						</fieldset>
					</center>
					
					
					
<sql:query dataSource = "${dbSource}" var = "project" >
           select  task_name , project_id , num_of_hours , date , emp_id from time_sheet where emp_id = "<%= session.getAttribute("employeeid") %>";
      </sql:query> 
      
 <center>
						<fieldset style="width: 70%">
							<legend>Employee Details</legend>
							<div class="main-details">
							<table width = "50%" border = "1">
							 <thead>
							<tr>
							    <th class="orange-gradient">Employee ID</th>
								<th class="orange-gradient">Project ID</th>
								<th class="orange-gradient">Task</th>
								<th class="orange-gradient">Hours Worked</th>
								<th class="orange-gradient">Date</th>
							</tr>
						</thead>
								<c:forEach var="row" items="${project.rows}">
						
						<tbody>
						
						<tr >
						<td align="center"><c:out value="${row.emp_id}" /></td>
						<td align="center"><c:out value="${row.project_id}" /></td>	
						<td align="center"><c:out value="${row.task_name}" /></td>
						<td align="center"><c:out value="${row.num_of_hours}" /></td>
						<td align="center"><c:out value="${row.date}" /></td>
						</tr>
											 
						</tbody>
						</c:forEach>									
								
								</table>
							</div>
						</fieldset>
					</center>
</body>
</html>