package com.employee.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

import com.employee.util.DataBaseUtility;

public class Approval {
	
	
	private String approved;
	private String empid;
	
	
	public String getEmpID() {
		return empid;
	}
	
	public void setEmpID(String empid) {
		this.empid = empid;
	}
	
	public String getApproved() {
		return approved;
	}
	
	public void setApproved(String approved) {
		this.approved = approved;
	}
	
	public void saveData() {
		Connection connection = null;
		
		try {
			connection = DataBaseUtility.getConnection();
			Statement statement = connection.createStatement();
			System.out.println(getApproved());
			System.out.println(getEmpID());
			statement.executeUpdate("update leave_sheet set approved = '"+getApproved()+"' ");
			JOptionPane.showMessageDialog(null, "Succesfull");
			System.out.println("executing");
		}catch (SQLException e) {
			e.printStackTrace();
		}	
	}

}



