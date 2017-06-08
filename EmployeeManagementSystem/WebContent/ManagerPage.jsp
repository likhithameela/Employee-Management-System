<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
	pageEncoding="ISO-8859-15"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page import="com.employee.bean.LoginBean"%>
<%@ page import="java.sql.*"%>

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
			<a href="Login.html" class="w3-bar-item w3-button"> <i
				class="fa fa-power-off fa-fw w3-margin-right w3-xxlarge w3-text-white"></i></a>
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
						<br>
						<table align=center style="width: 80%">
							<tr align=center>
								<td>Date :</td>
								<td><input type="text" name="date" placeholder="dd/mm/yyyy"></td>
								<td>Project ID :</td>
								<td><input type="text" name="project_id"
									placeholder="TUP00**"></td>

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
						<h1>Leave Managemenet</h1>
					</div>
					<br>
					<center>
						<button
							onclick="document.getElementById('Leave History Pop').style.display='block'"
							class="button" id="Leave History">Leave History</button>
						<button
							onclick="document.getElementById('Leaves Remaining Pop').style.display='block'"
							class="button" id="Leaves Remaining">Leaves Remaining</button>
						<button
							onclick="document.getElementById('Apply Leave Pop').style.display='block'"
							class="button" id="Apply Leave">Apply Leave</button>
						<br> <br>
					</center>


					<div id="Apply Leave Pop" class="w3-modal">
						<div class="w3-modal-content w3-animate-zoom">
							<div class="w3-container w3-black w3-display-container">
								<span
									onclick="document.getElementById('Apply Leave Pop').style.display='none'"
									class="w3-button w3-display-topright w3-large">x</span>
								<h1>Apply Leave</h1>
							</div>
							<br>
							<table align=center style="width: 65%">
								<tr align=center>
									<td>Category :</td>
									<td><input list="category" name="category"> <datalist
											id="category">
											<option value="CL">
										</datalist></td>
								</tr>

								<tr>
									<td>From Date:</td>
									<td><input type="date" name="from_date"
										placeholder="dd/mm/yyyy"></td>
									<td>To Date:</td>
									<td><input type="date" name="to_date"
										placeholder="dd/mm/yyyy"></td>
								</tr>
								<tr>
									<td>Reason :</td>
									<td><input type="text" name="Reason" placeholder="">
									</td>
								</tr>

							</table>
							<br>
							<center>
								<button type="submit" align=center class="w3-button w3-black ">Apply</button>
							</center>
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
				<h2>Leave History</h2>
			</div>
			<br>
			<center>
				<fieldset style="width: 50%">
					<legend>History / Summary</legend>
					<div class="main-details">

						<div class="salesDashBoardDropDown">
							<form action="" method="post" name="yearform">
								<!--<div  style="float: left;padding-top:5px;">Quarter : </div>-->
								<div>
									<select name="year" id="year" class="dropdown"
										style="width: 150px;" onchange="this.form.submit();">
										<option value="2016">2016</option>
										<option value="2017" selected="selected">2017</option>
										<option value="2018">2018</option>
									</select>
								</div>
							</form>
						</div>
						<legend>Leave History</legend>
						<table border="0" width="100%" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<th class="orange-gradient">Category</th>
									<th class="orange-gradient">From Date</th>
									<th class="orange-gradient">To Date</th>

								</tr>
							</thead>
						</table>
				</fieldset>
				<br>
			</center>
		</div>
	</div>
	</div>
	</div>


	<!---PayRoll Pop-->
	<div id="PayRoll Pop" class="w3-modal">
		<div class="w3-modal-content w3-animate-zoom">
			<div class="w3-container w3-black w3-display-container">
				<span
					onclick="document.getElementById('PayRoll Pop').style.display='none'"
					class="w3-button w3-display-topright w3-large">x</span>
				<h1>PayRoll</h1>
			</div>
			<br>
			<center>CONGRATULATIONS.!</center>
			<br>
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
			<br>
			<br>
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
