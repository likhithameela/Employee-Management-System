package com.employee.bean;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

import com.employee.util.DataBaseUtility;

public class LeaveApproval {
	
	private String id;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	

	public void saveData() {
		// TODO Auto-generated method stub
		
Connection connection = null;
		
		try {
			connection = DataBaseUtility.getConnection();
			Statement statement = connection.createStatement();
			String str = "approved";
			statement.executeUpdate(" update leave_sheet set approved =  '"+str+"' where emp_id = '"+getId()+"' ");
			System.out.println("updated");
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
