<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
    pageEncoding="ISO-8859-15"%>
    
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@ page import = "com.employee.bean.LoginBean"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<title>AdminPage</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="AdminPage.css" rel="stylesheet">

<div class="w3-top">
  <div class="w3-bar w3-black w3-card-2" id="myNavbar">
<a href="Home.html" class="w3-bar-item w3-button w3-wide"><img src="oooo.png" width="60px" height="50px">TreYsta unS</a>    <!-- Right-sided navbar links -->    
   <div class="w3-right w3-hide-small" align ="left">
      <a href="Login.html" class="w3-bar-item w3-button"> <i class="fa fa-power-off fa-fw w3-margin-right w3-xxlarge w3-text-white"></i></a>
  </div>
</div>
</div>

<br>
<br><br>


<body class="w3-light-grey">

<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;">

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
           select emp_name , designation , address , email , contact , leaves from employee where emp_id = "<%= session.getAttribute("empid") %>";
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

    <!-- Right Column -->
    <div class="w3-twothird">
    
      <div class="w3-container w3-card-2 w3-white w3-margin-bottom">
        <h2 class=" w3-padding-16"> <i class="fa fa-address-card-o fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>
        <button onclick="document.getElementById('Add Employee Pop').style.display='block'"  class="button" id="Add Employee">Add Employee</button>
</div>
   
        <div class="w3-container w3-card-2 w3-white w3-margin-bottom">
        <h2 class=" w3-padding-16"><i class="fa fa-calendar-o fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>
        <button onclick="document.getElementById('Leave Management Pop').style.display='block'"  class="button" id="Leave Management">Leave Management</button>
        
</div>
       <div class="w3-container w3-card-2 w3-white w3-margin-bottom">
        <h2 class=" w3-padding-16"><i class="fa fa-money fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>
        <button onclick="document.getElementById('PayRoll Pop').style.display='block'"  class="button" id="PayRoll">PayRoll</button>
</div>
   
<!-- Register Form Pop -->
<div id="Add Employee Pop" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-black w3-display-container">
      <span onclick="document.getElementById('Add Employee Pop').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      <h1>Add Employee</h1>
    </div>
   <br>
   
   <form method = "post" action = "EmployeeRegisterServlet">
   <table  align = "center">
   
     <tr>
	 <td>Employee ID :<hspace> </td>
	 <td><input type="text" name="emp_id"  placeholder = "Eg.TU0001"></td>
	 </tr>
	 <tr>
	 <td>Name : </td>
	 <td><input type="text" name="emp_name"  placeholder = "Enter Name"></td>	 
	 </tr>
	 <tr>
	 <td>Date of Birth :</td>
	 <td><input type="date" name="dob"  placeholder = "dd/mm/yyyy"></td>
	 </tr>
	 <tr>
	 <td>Gender :</td>
	 </tr>
	 <tr>
	 <td><input type="radio" class="text" name="gender" value="MALE">MALE</td>
	 <td><input type="radio" class="text" name="gender" value="FEMALE">FEMALE</td></align>
	 <td><input type="radio" class="text" name="gender" value="OTHERS">OTHERS</td>
	 </tr>
	 <tr>
	 <td>Contact :</td>
	 <td><input type="text" name="contact"  placeholder = "91 **********" required maxlength = "10"></td>
	 </tr>
	 <tr>
	 <td>E-Mail :</td>
	 <td><input type="text" name="email"  placeholder = "abc@xyz.com"></td>
	 </tr>
	 <tr>
	 <td>Address :</td>
	 <td><input type="text" name="address"  placeholder = "Enter address"></td>
	 </tr>
	 
	  <tr>
	 <td>Designation</td>
	<td><input list="1" name="designation">
  <datalist id="1">
    <option value="Manager">
    <option value="Administrator"> 
    <option value="Clerk"> 
  </datalist>
  </td>
	 </tr>


	 
	 <tr>
	 <td>Manager :</td>
	 <td><input list="2" name="manager_id">
  <datalist id="2">
    <option value="TU0002-Preethi">
    <option value="TU0008-Karthik">
    <option value="TU0012-Zeenia"> 
  </datalist>
  </td>
  
	 </tr>


	 
	 <!-- <tr>
	 <td>Designation</td>
	<td><input list="1" name="1">
  <datalist id="1">
    <option value="Manager">
    <option value="Administrator"> 
    <option value="Clerk"> 
  </datalist>
  </td>
	 </tr>
	 <tr>
	 <td>Manager :</td>
	 <td><input list="2" name="manager_id">
  <datalist id="2">
    <option value="TU0002-Preethi">
    <option value="TU0008-Karthik">
    <option value="TU0012-Zeenia"> 
  </datalist>
  </td>-->
  
	 </tr>
	 <tr>
	 <td>Salary :</td>
	 <td><input type="text" name="salary"  placeholder = "Enter Salary"></td>
	 </tr>
	 <tr>
	
   </table>
   <br>
<center><button type="submit" align = center class="w3-button w3-black ">Submit</button> </center>
</form>

<br>
 
  </div>
</div>
</div>

<!-- Apply Leave Pop -->
<div id="Leave Management Pop" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-black w3-display-container">
      <span onclick="document.getElementById('Leave Management Pop').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      <h1>Leave Managemenet</h1>
    </div>
   <br>
  <center>  <button onclick="document.getElementById('Leave History Pop').style.display='block'"  class="button" id="Leave History">Leave History</button>
        <button onclick="document.getElementById('Leaves Remaining Pop').style.display='block'"  class="button" id="Leaves Remaining">Leaves Remaining</button>
        <button onclick="document.getElementById('Apply Leave Pop').style.display='block'"  class="button" id="Apply Leave">Apply Leave</button><br> <br></center>

   
<div id="Apply Leave Pop" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-black w3-display-container">
      <span onclick="document.getElementById('Apply Leave Pop').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      <h1>Apply Leave</h1>
    </div>
   <br>
   <% 
   String emp = (String) session.getAttribute("empid");
   %>
   
   <form method = "post" action = "AdminLeaveSheetServlet">
<table align=center style="width:65%">

   

  <tr align = center>
    <td>Category :</td>
    <td><input list="category" name="category">
      <datalist id="category">
       <option value="CL">
       
      </datalist>
   </td> 
</tr>

<tr>
 <td>From Date:</td>
 <td><input type="date" name="from_date"  placeholder = "dd/mm/yyyy">  </td>
 <td>To Date:</td> 
  <td><input type="date" name="to_date"  placeholder = "dd/mm/yyyy">  </td>
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
      <span onclick="document.getElementById('Leaves Remaining Pop').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      <h2>Leaves Remaining</h2>
    </div>
   <br>
   <center><fieldset style="width:50%">
				<legend>Balance</legend>
				<div class="main-details">
				<c:forEach var="row" items="${result.rows}">
					<table border="0" class="" width="100%" cellspacing="0" cellpadding="0"> 
						<thead>
							<tr>
								<th class="orange-gradient">Type</th>
								<th class="orange-gradient">Balance</th>
							</tr>
						</thead>
						<tbody>
					
					
												<tr >
						
							<td align="center">Casual Leave </td>	
							<td align="center"><c:out value="${row.leaves}" /></td>
						
						</tr>
					
						
					
												 
						</tbody>
					</table> 
					</c:forEach></div> 
					</fieldset> </center><br></div>
                    </div>
                    </div>
                    </div>
                    </div>
                    
                    
                    
                    
                                               
                        
               
   
 
   
    <div id="Leave History Pop" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-black w3-display-container">
      <span onclick="document.getElementById('Leave History Pop').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      <h2>Leave History</h2>
    </div>
   <br><br>
   <sql:query dataSource = "${dbSource}" var = "leave" >
           select  category , from_date , to_date from leave_sheet where emp_id = "<%= session.getAttribute("empid") %>";
      </sql:query>
      
      <center><fieldset style="width:50%">
				<legend>Leave History</legend>
				<div class="main-details">
					<table border="0" class="" width="100%" cellspacing="0" cellpadding="0"> 
					<c:forEach var="row" items="${leave.rows}">
						<thead>
							<tr>
								<th class="orange-gradient">Category</th>
								<th class="orange-gradient">From Date</th>
								<th class="orange-gradient">To Date</th>
							</tr>
						</thead>
						
						<tbody>
						
						<tr >
						<td align="center"><c:out value="${row.category}" /></td>	
						<td align="center"><c:out value="${row.from_date}" /></td>
						<td align="center"><c:out value="${row.to_date}" /></td>
						</tr>
											 
						</tbody>
						
						</c:forEach>
					</table> </div> 
					</fieldset> </center>
			
     </div>
   </div>
                

      
      
<!---PayRoll Pop-->
<div id="PayRoll Pop" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-black w3-display-container">
      <span onclick="document.getElementById('PayRoll Pop').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      <h1>PayRoll</h1>
    </div>
   <br>
<center>CONGRATULATIONS.!</center>
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
<br><br><br><br><br>
<footer class="w3-container w3-black w3-center  w3-margin-top">
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-snapchat w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
  <p>Powered by Talent Sprint</a></p>
</footer>

</body>
</html>
