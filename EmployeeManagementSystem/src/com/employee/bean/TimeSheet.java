package com.employee.bean;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.employee.util.DataBaseUtility;

public class TimeSheet {
	private String task_name1;
	private String task_name2;
	private String project_id;
	private String emp_id;
	private String num_of_hours1;
	private String num_of_hours2;
	private String date;
	private String description1;
	private String description2;
	
	public String getTask_name1() {
		return task_name1;
	}
	public void setTask_name1(String task_name1) {
		this.task_name1 = task_name1;
	}
	public String getTask_name2() {
		return task_name2;
	}
	public void setTask_name2(String task_name2) {
		this.task_name2 = task_name2;
	}
	public String getNum_of_hours1() {
		return num_of_hours1;
	}
	public void setNum_of_hours1(String num_of_hours1) {
		this.num_of_hours1 = num_of_hours1;
	}
	public String getNum_of_hours2() {
		return num_of_hours2;
	}
	public void setNum_of_hours2(String num_of_hours2) {
		this.num_of_hours2 = num_of_hours2;
	}
	public String getDescription1() {
		return description1;
	}
	public void setDescription1(String description1) {
		this.description1 = description1;
	}
	public String getDescription2() {
		return description2;
	}
	public void setDescription2(String description2) {
		this.description2 = description2;
	}
	
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public void saveData() {
		Connection connection = null;
		try {
			connection = DataBaseUtility.getConnection();
			Statement statement = connection.createStatement();
			System.out.println(getTask_name1());
			statement.executeUpdate("insert into time_sheet values('"+getTask_name1()+"','"+getProject_id()+"' , '"+getEmp_id()+"' , '"+getNum_of_hours1()+"' ,'"+getDate()+"' ,'"+getDescription1()+"')");
			statement.executeUpdate("insert into time_sheet values('"+getTask_name2()+"','"+getProject_id()+"' , '"+getEmp_id()+"' , '"+getNum_of_hours2()+"' ,'"+getDate()+"' ,'"+getDescription2()+"')");
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}