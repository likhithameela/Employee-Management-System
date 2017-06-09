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
           select  task_name , emp_id , num_of_hours , date  from time_sheet where project_id = "<%= session.getAttribute("projectid") %>";
      </sql:query> 
      
 <center>
						<fieldset style="width: 50%">
							<legend>Project Details</legend>
							<div class="main-details">
								<c:forEach var="row" items="${project.rows}">
									<table border="0" class="" width="100%" cellspacing="0" cellpadding="0">
										<thead>
											<tr>
												<th class="orange-gradient"><c:out value="${row.task_name}" /></th>
												<th class="orange-gradient"><c:out value="${row.emp_id}" /></th>
												<th class="orange-gradient"><c:out value="${row.num_of_hours}" /></th>
												<th class="orange-gradient"><c:out value="${row.date}" /></th>
											</tr>
										</thead>
										<tbody>



										</tbody>
										</form>
									</table>
								</c:forEach>
							</div>
						</fieldset>
					</center>

</body>
</html>