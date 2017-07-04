package com.employee.bean;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

import com.employee.util.DataBaseUtility;
import com.mysql.jdbc.ResultSet;

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
			String question = "";
			String answer = "";
			java.sql.ResultSet rs=statement.executeQuery("select security_question , security_answer from employee where emp_id = '"+getEmpID()+"' ");
			if(rs.next()){
			question=rs.getString(1);
			answer=rs.getString(2);
			}
			System.out.println(getSecurityQuestion());
			System.out.println(getSecurityAnswer());
			System.out.println(getNewPassword());
			if(question.equals(getSecurityQuestion()) && answer.equals(getSecurityAnswer())) {
			statement.executeUpdate(" update employee set security_question =  '"+getSecurityQuestion()+"' , security_answer =  '"+getSecurityAnswer()+"' , password = MD5('" + getNewPassword() + "') where emp_id = '"+empID+"' ");
			JOptionPane.showMessageDialog(null, "Succesfully Changed");
			System.out.println("executing");
			} else {
				JOptionPane.showMessageDialog(null, "Check Your Security Question And Answer");
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}












