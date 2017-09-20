package com.employee.bean;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.employee.util.DataBaseUtility;

public class TimeSheet {
	private String task_name1;
	private String task_name2;
	private String task_name3;
	private String task_name4;
	private String task_name5;
	private String task_name6;
	
	
	private String project_id;
	private String emp_id;
	private String num_of_hours1;
	private String num_of_hours2;
	private String num_of_hours3;
	private String num_of_hours4;
	private String num_of_hours5;
	private String num_of_hours6;
	private String date;
	private String description1;
	private String description2;
	private String description3;
	private String description4;
	private String description5;
	private String description6;
	
	public String getTask_name3() {
		return task_name3;
	}
	public void setTask_name3(String task_name3) {
		this.task_name3 = task_name3;
	}
	public String getTask_name4() {
		return task_name4;
	}
	public void setTask_name4(String task_name4) {
		this.task_name4 = task_name4;
	}
	public String getTask_name5() {
		return task_name5;
	}
	public void setTask_name5(String task_name5) {
		this.task_name5 = task_name5;
	}
	public String getTask_name6() {
		return task_name6;
	}
	public void setTask_name6(String task_name6) {
		this.task_name6 = task_name6;
	}
	public String getNum_of_hours3() {
		return num_of_hours3;
	}
	public void setNum_of_hours3(String num_of_hours3) {
		this.num_of_hours3 = num_of_hours3;
	}
	public String getNum_of_hours4() {
		return num_of_hours4;
	}
	public void setNum_of_hours4(String num_of_hours4) {
		this.num_of_hours4 = num_of_hours4;
	}
	public String getNum_of_hours5() {
		return num_of_hours5;
	}
	public void setNum_of_hours5(String num_of_hours5) {
		this.num_of_hours5 = num_of_hours5;
	}
	public String getNum_of_hours6() {
		return num_of_hours6;
	}
	public void setNum_of_hours6(String num_of_hours6) {
		this.num_of_hours6 = num_of_hours6;
	}
	public String getDescription3() {
		return description3;
	}
	public void setDescription3(String description3) {
		this.description3 = description3;
	}
	public String getDescription4() {
		return description4;
	}
	public void setDescription4(String description4) {
		this.description4 = description4;
	}
	public String getDescription5() {
		return description5;
	}
	public void setDescription5(String description5) {
		this.description5 = description5;
	}
	public String getDescription6() {
		return description6;
	}
	public void setDescription6(String description6) {
		this.description6 = description6;
	}
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
			statement.executeUpdate("insert into time_sheet values('"+getTask_name3()+"','"+getProject_id()+"' , '"+getEmp_id()+"' , '"+getNum_of_hours3()+"' ,'"+getDate()+"' ,'"+getDescription3()+"')");
			statement.executeUpdate("insert into time_sheet values('"+getTask_name4()+"','"+getProject_id()+"' , '"+getEmp_id()+"' , '"+getNum_of_hours4()+"' ,'"+getDate()+"' ,'"+getDescription4()+"')");
			statement.executeUpdate("insert into time_sheet values('"+getTask_name5()+"','"+getProject_id()+"' , '"+getEmp_id()+"' , '"+getNum_of_hours5()+"' ,'"+getDate()+"' ,'"+getDescription5()+"')");
			statement.executeUpdate("insert into time_sheet values('"+getTask_name6()+"','"+getProject_id()+"' , '"+getEmp_id()+"' , '"+getNum_of_hours6()+"' ,'"+getDate()+"' ,'"+getDescription6()+"')");
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}