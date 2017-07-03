package com.employee.bean;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.employee.util.DataBaseUtility;

public class Forgotregister {
	private String question;
	private String answer;
	private String empID;
	private String newpassword;
	
	public String getEmpID() {
		return empID;
	}


	public void setEmpID(String empID) {
		this.empID = empID;
	}

	
	public String getSecurityQuestion() {
		return question;
	}

	public void setSecurityQuestion(String question) {
		this.question = question;
	}
	
	public String getSecurityAnswer() {
		return answer;
	}

	public void setSecurityAnswer(String answer) {
		this.answer = answer;
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
			System.out.println(getSecurityQuestion());
			System.out.println(getSecurityAnswer());
			System.out.println(getNewPassword());
			statement.executeUpdate(" update employee set security_question =  '"+getSecurityQuestion()+"' , security_answer =  '"+getSecurityAnswer()+"' , password = MD5('" + getNewPassword() + "') where emp_id = '"+empID+"' ");
         
			System.out.println("executing");
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}
