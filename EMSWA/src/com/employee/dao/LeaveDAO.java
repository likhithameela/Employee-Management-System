package com.employee.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.employee.bean.LoginBean;
import com.employee.util.DataBaseUtility;

public class LeaveDAO {
	public String checkLeavesRemaining(LoginBean loginbean){
		String emp_id = loginbean.getEmpID();
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		 
		String empID = "";
		String leaves = "";
		
		try {
			con = DataBaseUtility.getConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("select leaves from employee where emp_id = '"+emp_id+"'");
			while (resultSet.next()) {
				leaves = resultSet.getString("leaves");
				if(emp_id.equals(emp_id) && leaves.isEmpty()) 
					return "No leaves left";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
		
	}

}















