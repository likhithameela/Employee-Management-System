package com.employee.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.employee.util.DataBaseUtility;

public class EmployeeRegister {
	private String empID;
	private String name;
	private String dateOfBirth;
	private String gender;
	private String phone;
    private String email;
	private String address;
	private String designation;
	private String mangID;
	private String salary;
	private String leave;
	private String password;
	private String question;
	private String answer;
	
	
	public String getEmpID() {
		return empID;
	}


	public void setEmpID(String empID) {
		this.empID = empID;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDateOfBirth() {
		return dateOfBirth;
	}


	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getDesignation() {
		return designation;
	}


	public void setDesignation(String designation) {
		this.designation = designation;
	}


	public String getMangID() {
		return mangID;
	}


	public void setMangID(String mangID) {
		this.mangID = mangID;
	}


	public String getSalary() {
		return salary;
	}


	public void setSalary(String salary) {
		this.salary = salary;
	}


	public String getLeave() {
		return leave;
	}


	public void setLeave(String leave) {
		this.leave = leave;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
    
    
	public void saveData(LeaveSheet leavesheet) {
		Connection connection = null;
		
		try {
			connection = DataBaseUtility.getConnection();
			Statement statement = connection.createStatement();
			System.out.println(getEmpID());
			System.out.println(getName());
			statement.executeUpdate("insert into employee values('"+getEmpID()+"','"+getName()+"','"+getDateOfBirth()+"','"+getGender()+"','"+getPhone()+"','"+getEmail()+"','"+getAddress()+"','"+getDesignation()+"','"+getMangID()+"','"+getSalary()+"', 30 , MD5('trustus') , '' , '') ");
         
			System.out.println("executing");
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	
	}

}
