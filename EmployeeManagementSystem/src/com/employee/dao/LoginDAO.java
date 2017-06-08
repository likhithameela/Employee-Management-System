package com.employee.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.employee.bean.LoginBean;
import com.employee.util.DataBaseUtility;


public class LoginDAO {

	public String authenticateUser(LoginBean loginBean)
	{
	 
	String emp_id = loginBean.getEmpID();
	String password = loginBean.getPassword();
	 
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	 
	String empID = "";
	String empPassword = "";
	String designation = "";
	String salary = "";
	 
	try
	{
	con = DataBaseUtility.getConnection();
	statement = con.createStatement();
	resultSet = statement.executeQuery("select designation , salary from employee where emp_id = '"+emp_id+"' AND password = '"+password+"' ");
	 
	while(resultSet.next())
	{
	/**userNameDB = resultSet.getString("username");
	passwordDB = resultSet.getString("password");*/
	designation = resultSet.getString("designation");
	salary = resultSet.getString("salary");
	
	 
	if(emp_id.equals(emp_id) && password.equals(password) && designation.equals("Admin"))
	return "Admin";
	else if(emp_id.equals(emp_id) && password.equals(password) && designation.equals("Manager"))
	return "Manager";
	else if(emp_id.equals(emp_id) && password.equals(password) && designation.equals("Clerk"))
	return "Clerk";
	}
	}
	catch(SQLException e)
	{
	e.printStackTrace();
	}
	return "Invalid user credentials";
	}
}
