package com.employee.bean;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.employee.util.DataBaseUtility;

public class ProjectId {
	private String projectid;

	public String getProjectid() {
		return projectid;
	}

	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}
	public void saveData() {
		Connection connection = null;
		try {
			connection = DataBaseUtility.getConnection();
			Statement statement = connection.createStatement();
			System.out.println(getProjectid());
			statement.executeQuery(" select task_name , emp_id , num_of_hours , date from time_sheet where project_id = '"+projectid+"' ");
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}