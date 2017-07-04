package com.employee.bean;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.employee.controller.ChangePasswordServlet;
import com.employee.util.DataBaseUtility;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class ChangePassword {
	
	private String empID;
	private String newpassword;
	
	public String getEmpID() {
		return empID;
	}


	public void setEmpID(String empID) {
		this.empID = empID;
	}
	
	public String getNewPassword() {
		return newpassword;
	}

	public void setNewPassword(String newpassword) {
		this.newpassword = newpassword;
	}
	
	public void saveData() {
		Connection connection = null;
						
				try {
					connection = DataBaseUtility.getConnection();
					Statement statement = connection.createStatement();
					System.out.println(getEmpID());
					System.out.println(getNewPassword());
					statement.executeUpdate(" update employee set password = MD5('" + getNewPassword() + "') where emp_id = '"+empID+"' ");
		         
					System.out.println("executing");
				}catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

}
