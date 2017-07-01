<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
    pageEncoding="ISO-8859-15"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-15">
<title>Insert title here</title>
</head>
<body>


<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String currentPassword=request.getParameter("oldpassword");
String emp_id=request.getParameter("emp_id");
String Newpass=request.getParameter("newpassword");
String conpass=request.getParameter("confirmpassword");
String connectionURL = "jdbc:mysql://localhost:3306/ems";
Connection con=null;
String pass="";
String id = "";
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connectionURL, "root", "root");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select emp_id , password from employee where emp_id = '"+emp_id+"' and password='"+currentPassword+"'");
if(rs.next()){
id=rs.getString(1);
pass=rs.getString(2);
}
System.out.println(id+ " "+pass);
if(pass.equals(currentPassword)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update employee set password='"+Newpass+"' where emp_id='"+id+"'");
out.println("Password changed successfully");
st1.close();
con.close();
}
else if (!("Newpass").equals("conpass") ) {
	out.println("New Password and Confirm Password should be same!! Please Re-enter passwords.");
}
else{
out.println("Invalid Current Password");
}
}
catch(Exception e){
out.println(e);
}
%>


</body>
</html>