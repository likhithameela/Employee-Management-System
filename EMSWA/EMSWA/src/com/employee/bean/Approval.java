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
	private Object empid;
	
	
	public Object getEmpID() {
		return empid;
	}
	
	public void setEmpID(Object row) {
		this.empid = row;
	}
	
	public String getApproved() {
		return approved;
	}
	
	public void setApproved(String approved) {
		this.approved = approved;
	}
	
	public void saveData() {
		Connection connection = null;
		String approve = "";
		String from_date = "";
		String to_date = "";
		
		try {
			connection = DataBaseUtility.getConnection();
			Statement statement = connection.createStatement();
			System.out.println(getApproved());
			System.out.println(getEmpID());
			
			
			ResultSet rs=statement.executeQuery("select approved , from_date , to_date from leave_sheet where emp_id = '"+getEmpID()+"' ");
			if(rs.next()){
			approve=rs.getString(1);
			from_date = rs.getString(2);
			to_date = rs.getString(3);
			}
			
			if(approve.equals(getApproved())) {
				statement.executeUpdate("update employee set leaves = leaves - DATEDIFF(to_date , from_date) where emp_id = '"+getEmpID()+"' ");
				System.out.println("leaves deducted in employee table");
			} 
			
			statement.executeUpdate("update leave_sheet set approved = '"+getApproved()+"' where emp_id = '"+getEmpID()+"' ");
			//JOptionPane.showMessageDialog(null, "Succesfull");
			System.out.println("entring query");
			System.out.println("executing");
		}catch (SQLException e) {
			e.printStackTrace();
		}	
	}

}



