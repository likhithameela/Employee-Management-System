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
String oldPassword=request.getParameter("oldpassword");
String emp_id=request.getParameter("emp_id");
String newpassword=request.getParameter("newpassword");
String confirmpassword=request.getParameter("confirmpassword");
String connectionURL = "jdbc:mysql://localhost:3306/ems";
Connection con=null;
String pass="";
String id = "";
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connectionURL, "root", "root");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select emp_id , password from employee where emp_id = '"+emp_id+"' and password='"+oldPassword+"'");
if(rs.next()){
id=rs.getString(1);
pass=rs.getString(2);
}
System.out.println(id+ " "+pass);
if(pass.equals(oldPassword)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update employee set password= '" + newpassword + "' where emp_id='"+emp_id+"'");
System.out.println("Password changed successfully");
st1.close();
con.close();
}
}
catch(Exception e){
System.out.println(e);
}
%>


</body>
</html>