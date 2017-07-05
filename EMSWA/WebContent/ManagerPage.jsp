<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
	pageEncoding="ISO-8859-15"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page import="com.employee.bean.LoginBean"%>
<%@ page import="java.sql.*"%>

<%
   if(session.getAttribute("empid")== null) {
      response.sendRedirect(request.getContextPath() +"/ManagerPage.jsp");
   }
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
 
%>


<!DOCTYPE html>
<html>
<title>ManagerPage</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Roboto", sans-serif
}

.button {
	background-color: white;
	color: black;
	border: 2px solid white;
	cursor: pointer;
}
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
			<a href="Login.jsp" class="w3-bar-item w3-button"> <i class="fa fa-power-off fa-fw w3-margin-right w3-xxlarge w3-text-white"></i></a>
				
		</div>
	</div>
</div>

<br>
<br>
<br>

<body class="w3-light-grey">



	<!-- Page Container -->
	<div class="w3-content w3-margin-top" style="max-width: 1400px;">

		<!-- The Grid -->
		<div class="w3-row-padding">

			<!-- Left Column -->
			<div class="w3-third">

				<div class="w3-white w3-text-grey w3-card-4">
					<div class="w3-display-container">
						<h2>
							<c:out value="${row.emp_name}" />
						</h2>
						<div class="w3-display-bottomleft w3-container w3-text-black">

						</div>
					</div>

					<sql:setDataSource var="dbSource" driver="com.mysql.jdbc.Driver"
						url="jdbc:mysql://localhost/ems" user="root" password="root" />
					<sql:query dataSource="${dbSource}" var="result">
           select emp_name , designation , address , email , contact , leaves from employee where emp_id = "<%=session.getAttribute("empid")%>";
      </sql:query>


					<form>
						<table>

							<c:forEach var="row" items="${result.rows}">
								<tr>
									<td><h1>
											<c:out value="${row.emp_name}" />
										</h1></td>
								</tr>
								<tr>
									<td><i
										class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i>
									<c:out value="${row.designation}" /></td>
								</tr>
								<tr>
									<td><i
										class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>
									<c:out value="${row.address}" /></td>
								</tr>
								<tr>
									<td><i
										class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>
									<c:out value="${row.email}" /></td>
								</tr>
								<tr>
									<td><i
										class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>
									<c:out value="${row.contact}" /></td>
								</tr>
							</c:forEach>
						</table>
				</div>
				</form>

				<!-- End Left Column -->
			</div>

			<!-- Right Column -->
			<div class="w3-twothird">

				<div class="w3-container w3-card-2 w3-white w3-margin-bottom">
					<h2 class=" w3-padding-16">
						<i
							class="fa fa-clock-o fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>
						<button
							onclick="document.getElementById('Time Sheet Pop').style.display='block'"
							class="button" id="Time Sheet">Time Sheet</button>
				</div>

				<div class="w3-container w3-card-2 w3-white w3-margin-bottom">
					<h2 class=" w3-padding-16">
						<i
							class="fa fa-calendar-o fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>
						<button
							onclick="document.getElementById('Leave Management Pop').style.display='block'"
							class="button" id="Leave Management">Leave Management</button>
				</div>

				<div class="w3-container w3-card-2 w3-white w3-margin-bottom">
					<h2 class=" w3-padding-16">
						<i
							class="fa fa-money fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>
						<button
							onclick="document.getElementById('PayRoll Pop').style.display='block'"
							class="button" id="PayRoll">PayRoll</button>
				</div>

				<div class="w3-container w3-card-2 w3-white w3-margin-bottom">
					<h2 class=" w3-padding-16">
						<i
							class="fa fa-search fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>
						<button
							onclick="document.getElementById('Project Details Pop').style.display='block'"
							class="button" id="Project Details">Project Details</button>
				</div>



				<!-- Time Sheet Pop -->
				<div id="Time Sheet Pop" class="w3-modal">
					<div class="w3-modal-content w3-animate-zoom">
						<div class="w3-container w3-black w3-display-container">
							<span
								onclick="document.getElementById('Time Sheet Pop').style.display='none'"
								class="w3-button w3-display-topright w3-large">x</span>
							<h1>Time Sheet</h1>
						</div>
						<%LoginBean currentUser = (LoginBean)(session.getAttribute("currentSessionUser")); %>
   <!--  <= currentUser.getEmpID() %> -->
   <% 
   String emp = (String) session.getAttribute("empid");
   %>
						<br>
						<form method = "post" action = "TimeSheetServlet">
						
						<table align=center style="width: 80%">
							<tr align=center>
								<td>Date :</td>
								<td><input type="text" name="date" placeholder="dd/mm/yyyy"></td>
								<td>Project ID :</td>
								<td><input type="text" name="project_id"
									placeholder="TUP00**"></td>
								<td><input type = "hidden" name = "empid" value = "<%=emp%>"></td>
   
							</tr>
						</table>

						<table align=center style="width:80%"> 
  <tr align = center>
   
   <th>Work</th>
   <th>Hours Worked</th>
   <th>Description</th>
  </tr>
  <tr align = center>
  <td><input list="1" name="1">
  <datalist id="1">
    <option value="Designing">
    <option value="Coding"> 
    <option value="Testing">
    <option value="Meeting">
    <option value="Training"> 
  </datalist>
  </td>
  <td>
    <input type="text" name="hours1"  placeholder = "00:00">
  </td>
  <td>
    <input type="text" name="description1">
  </td>
  </tr>
  <tr align = center>
  <td><input list="2" name="2">
  <datalist id="2">
    <option value="Designing">
    <option value="Coding"> 
    <option value="Testing">
    <option value="Meeting">
    <option value="Training"> 
  </datalist>
  </td>
  <td>
    <input type="text" name="hours2"  placeholder = "00:00">
  </td>
  <td>
    <input type="text" name="description2">
  </td>
  </tr>
  <tr align = center>
  <td><input list="3" name="3">
  <datalist id="3">
    <option value="Designing">
    <option value="Coding"> 
    <option value="Testing">
    <option value="Meeting">
    <option value="Training"> 
  </datalist>
  </td>
  <td>
    <input type="text" name="hours3"  placeholder = "00:00">
  </td>
  <td>
    <input type="text" name="description3">
  </td>
  </tr>
  <tr align = center>
  <td><input list="4" name="4">
  <datalist id="4">
    <option value="Designing">
    <option value="Coding"> 
    <option value="Testing">
    <option value="Meeting">
    <option value="Training"> 
  </datalist>
  </td>
  <td>
    <input type="text" name="hours4"  placeholder = "00:00">
  </td>
  <td>
    <input type="text" name="description4">
  </td>
  </tr>
  <tr align = center>
  <td><input list="5" name="5">
  <datalist id="5">
    <option value="Designing">
    <option value="Coding"> 
    <option value="Testing">
    <option value="Meeting">
    <option value="Training"> 
  </datalist>
  </td>
  <td>
    <input type="text" name="hours5"  placeholder = "00:00">
  </td>
  <td>
    <input type="text" name="description5">
  </td>
  </tr>
  <tr align = center>
  <td><input list="6" name="6">
  <datalist id="6">
    <option value="Designing">
    <option value="Coding"> 
    <option value="Testing">
    <option value="Meeting">
    <option value="Training"> 
  </datalist>
  </td>
  <td>
    <input type="text" name="hours6"  placeholder = "00:00">
  </td>
  <td>
    <input type="text" name="description6">
  </td>
  </tr>
  <br>
  
</table>
						<br>
						<center>
							<button type="submit" align=center class="w3-button w3-black ">Submit</button>
						</center>
						</form>
						<br>
					</div>
				</div>
			</div>

			<!-- Apply Leave Pop -->
			<div id="Leave Management Pop" class="w3-modal">
				<div class="w3-modal-content w3-animate-zoom">
					<div class="w3-container w3-black w3-display-container">
						<span
							onclick="document.getElementById('Leave Management Pop').style.display='none'"
							class="w3-button w3-display-topright w3-large">x</span>
						<h1>Leave Management</h1>
					</div>
					<br>
					<center>
						<button
							onclick="document.getElementById('Leave History Pop').style.display='block'"
							class="button" id="Leave History">Leave Approval</button>
						<button
							onclick="document.getElementById('Leaves Remaining Pop').style.display='block'"
							class="button" id="Leaves Remaining">Leaves Remaining</button>
						<button
							onclick="document.getElementById('Apply Leave Pop').style.display='block'"
							class="button" id="Apply Leave">Apply Leave</button>
						<br> <br>
					</center>




<div id="Apply Leave Pop" class="w3-modal">+.
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-black w3-display-container">
      <span onclick="document.getElementById('Apply Leave Pop').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      <h1>Apply Leave</h1>
    </div>
   <br>
   <form method = "post" action = "LeaveSheetServlet">
<table align=center style="width:65%">
  <tr align = center>
    <td>Category :</td>
    <td><input list="category" name="category">
      <datalist id="category">
       <option value="cl">
       <option value = "sl">
      </datalist>
   </td> 
</tr>

<tr>
 <td>From Date:</td>
 <td><input type="text" name="from_date"  placeholder = "yyyy/mm/dd">  </td>
 <td>To Date:</td> 
  <td><input type="text" name="to_date"  placeholder = "yyyy//mm/dd">  </td>
</tr>  
<tr>
   <td>Reason	 :</td>
   <td><input type="text" name="Reason"  placeholder = "">  </td>
</tr>

<tr>
<td><input type = "hidden" name = "empid" value = "<%=emp%>"></td>
</tr>

</table>
<br>
<center><button type="submit" align = center class="w3-button w3-black ">Apply</button> </center>
</form>

</div>

</div>
</div>
</div>




			<div id="Leaves Remaining Pop" class="w3-modal">
				<div class="w3-modal-content w3-animate-zoom">
					<div class="w3-container w3-black w3-display-container">
						<span
							onclick="document.getElementById('Leaves Remaining Pop').style.display='none'"
							class="w3-button w3-display-topright w3-large">x</span>
						<h2>Leaves Remaining</h2>
					</div>
					<br>
					<center>
						<fieldset style="width: 50%">
							<legend>Balance</legend>
							<div class="main-details">
								<c:forEach var="row" items="${result.rows}">
									<table border="0" class="" width="100%" cellspacing="0"
										cellpadding="0">
										<thead>
											<tr>
												<th class="orange-gradient">Type</th>
												<th class="orange-gradient">Balance</th>
											</tr>
										</thead>
										<tbody>


											<tr>

												<td align="center">Casual Leave</td>
												<td align="center"><c:out value="${row.leaves}" /></td>

											</tr>




										</tbody>
									</table>
								</c:forEach>
							</div>
						</fieldset>
					</center>
					<br>
				</div>
			</div>
		</div>
	</div>
	</div>




	<div id="Leave History Pop" class="w3-modal">
		<div class="w3-modal-content w3-animate-zoom">
			<div class="w3-container w3-black w3-display-container">
				<span
					onclick="document.getElementById('Leave History Pop').style.display='none'"
					class="w3-button w3-display-topright w3-large">x</span>
				<h2>Leave Approval</h2>
			</div>
			<br><br>
			<sql:query dataSource = "${dbSource}" var = "leave" >
select ls.from_date as fromdate , ls.to_date as todate , ls.reason as reason , ls.emp_id as empid from leave_sheet ls
INNER JOIN employee emp on ls.emp_id = emp.emp_id where emp.emp_id IN (select emp.emp_id from employee emp where manager_id = "<%= session.getAttribute("empid") %>");
      </sql:query>
      
      <center><fieldset style="width:70%">
				<div class="main-details">
				<form action = "ApprovalServlet" method = "post">
					<table border="0" class="" width="100%" cellspacing="0" cellpadding="0"> 
					<thead>
							<tr>
							    <th class="orange-gradient">Employee ID</th>
								<th class="orange-gradient">From Date</th>
								<th class="orange-gradient">To Date</th>
								<th class="orange-gradient">Reason</th>
								
							</tr>
						</thead>
					<c:forEach var="row" items="${leave.rows}">
						
						
						<tbody>
						
						<tr >	
						<td align="center"><c:out value="${row.empid}" /></td>
						<td align="center"><c:out value="${row.fromdate}" /></td>
						<td align="center"><c:out value="${row.todate}" /></td>
			            <td align="center"><c:out value="${row.reason}" /></td>
			            
			            <td align = "center"><input type = "radio"  name = "gender" value = "approved">Approved</input></td>
			            <td align = "center"><input type = "radio"  name = "gender" value = "disapproved" >Disapproved</input></td>
			            
						</tr>
											 
						</tbody>
						
						</c:forEach>
					</table> </div> 
					</fieldset>
					<center><button type="submit" align = center class="w3-button w3-black ">Submit</button> </center>
					</form>
					 </center>
					<br><br>
			
		</div>
	</div>

<br><br><br>

	<!---PayRoll Pop-->
	<div id="PayRoll Pop" class="w3-modal">
		<div class="w3-modal-content w3-animate-zoom">
			<div class="w3-container w3-black w3-display-container">
				<span
					onclick="document.getElementById('PayRoll Pop').style.display='none'"
					class="w3-button w3-display-topright w3-large">x</span>
				<h1>PayRoll</h1>
			</div>
			
			
			<sql:query dataSource = "${dbSource}" var = "salary" >
           select  salary , ((salary*30)/100) as basic , ((((salary*30)/100)*40)/100) as hra , ((salary * 10)/100) as da , (((salary*30)/100) + ((((salary*30)/100)*40)/100) + ((salary * 10)/100)) as gross , (salary - (((salary*30)/100) + ((((salary*30)/100)*40)/100) + ((salary * 10)/100))) as oa , (((salary - ((((salary*30)/100)*40)/100) )*10)/100) as incometax , (salary - (((salary - ((((salary*30)/100)*40)/100) )*10)/100)) as netpay from employee where emp_id = "<%= session.getAttribute("empid") %>";
      </sql:query> 
      
 <center>
						
							<fieldset style="width: 70%">
							<legend>Pay Slip</legend>
							<div class="main-details">
							<table width = "50%" border = "1">
							 <thead>
							<tr>
							    <th class="orange-gradient">Type</th>
							    <th class="orange-gradient">Amount</th>
								
							</tr>
						</thead>
								<c:forEach var="row" items="${salary.rows}">
						
						<tbody>
						
						<tr >
						<th class="orange-gradient">Salary</th>
						<td align="center"><c:out value="${row.salary}" /></td>
						</tr>
						
						<tr >
						<th class="orange-gradient">Basic Salary</th>
						<td align="center"><c:out value="${row.basic}" /></td>
						</tr>
						
						<tr >
						<th class="orange-gradient">HRA</th>
						<td align="center"><c:out value="${row.hra}" /></td>
						</tr>
						
						<tr >
						<th class="orange-gradient">DA</th>
						<td align="center"><c:out value="${row.da}" /></td>
						</tr>
						
						<tr >
						<th class="orange-gradient">Gross Salary</th>
						<td align="center"><c:out value="${row.gross}" /></td>
						</tr>
						
						<tr >
						<th class="orange-gradient">Other Allowances</th>
						<td align="center"><c:out value="${row.oa}" /></td>
						</tr>
						
						<tr >
						<th class="orange-gradient">Income Tax</th>
						<td align="center"><c:out value="${row.incometax}" /></td>
						</tr>
						
						<tr >
						<th class="orange-gradient">Net Pay</th>
						<td align="center"><c:out value="${row.netpay}" /></td>
						</tr>
						
						
											 
						</tbody>
						</c:forEach>	
						</fieldset>								
								<br><br>
								</table>
							</div>
					</center>
			
			
		</div>
	</div>
	
	
	<!-- Project Details -->
	<div id="Project Details Pop" class="w3-modal">
		<div class="w3-modal-content w3-animate-zoom">
			<div class="w3-container w3-black w3-display-container">
				<span
					onclick="document.getElementById('Project Details Pop').style.display='none'"
					class="w3-button w3-display-topright w3-large">x</span>
				<h1>Project Details</h1>
			</div>
		<br><br>
				
		<table align=center style="width: 65%">
		<form method = "post" action = "ProjectIdServlet">
		  <tr align = "center">
		    <td>Project ID :</td>
			<td><input list="projectid" name="projectid"> 
			<datalist id="projectid">
	     	  <option value="TUP0001">
			  <option value="TUP0002">
			  <option value="TUP0003">
			  <option value="TUP0004">
			</datalist></td>
		  </tr>
		  
		  <tr align = "center">
		    <td>Employee ID :</td>
			<td><input type="text" name="empid"  placeholder = "">  </td>
		  </tr>
		  
		  <tr>
		  <td><button type="submit" align=center class="w3-button w3-black" value = "submit">Submit</button></td>
		  </tr>
		  
		<!--   <
		  String projectid = request.getParameter("projectid");
		  Connection connection = null;
		  Statement statement = null;
		  Class.forName("com.mysql.jdbc.Driver");
		  connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","root");
		  statement.executeQuery(" select task_name , emp_id , num_of_hours , date from time_sheet where project_id = '"+projectid+"' ");
		  out.println("working");
		  %>
		   	  -->
		  </form>
		</table>

		
		<br><br>

      
      
     <!--  <center><fieldset style="width:50%">
				<legend>Project Details</legend>
				<div class="main-details">
					<table border="0" class="" width="100%" cellspacing="0" cellpadding="0"> 
					<c:forEach var="row" items="${project.rows}">
						<thead>
							<tr>
							    <th class="orange-gradient">Emp ID</th>
								<th class="orange-gradient">Task</th>
								<th class="orange-gradient">Hours Worked</th>
								<th class="orange-gradient">Date</th>
							</tr>
						</thead>
						
						<tbody>
						
						<tr >
						<td align="center"><c:out value="${row.emp_id}" /></td>
						<td align="center"><c:out value="${row.task_name}" /></td>	
						<td align="center"><c:out value="${row.num-of_hours}" /></td>
						<td align="center"><c:out value="${row.date}" /></td>
						</tr>
											 
						</tbody>
						
						</c:forEach>
					</table> </div> 
					</fieldset> </center>  -->
     
		
		</div>
	</div>

	</div>
	</div>
	<!------>
	</div>
	</div>

	<!------>
	<!-- End Right Column -->
	</div>

	<!-- End Grid -->
	</div>

	<!-- End Page Container -->
	</div>

	<footer class="w3-container w3-black w3-center w3-margin-top">
		<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
			class="fa fa-instagram w3-hover-opacity"></i> <i
			class="fa fa-snapchat w3-hover-opacity"></i> <i
			class="fa fa-pinterest-p w3-hover-opacity"></i> <i
			class="fa fa-twitter w3-hover-opacity"></i> <i
			class="fa fa-linkedin w3-hover-opacity"></i>
		<p>
			Powered by Talent Sprint</a>
		</p>
	</footer>

</body>
</html>
