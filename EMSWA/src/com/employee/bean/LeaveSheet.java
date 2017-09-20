package com.employee.bean;

import java.sql.*;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

import com.employee.util.DataBaseUtility;

public class LeaveSheet {
	private String category;
	private String fromDate;
	private String toDate;
	private String reason;
	private String emp_id;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	
	public void saveData() {
		Connection connection = null;
		try {
			connection = DataBaseUtility.getConnection();
			Statement statement = connection.createStatement();
			int leaves = 0;
			int days = 0;
			String empid = getEmp_id();
			ResultSet rs=statement.executeQuery("select leaves from employee where emp_id = '"+emp_id+"' ");
			if(rs.next()){
			leaves=rs.getInt(1);
			}
			System.out.println(getReason());
			String emp_id = getEmp_id();
			
			String email = "";
			ResultSet resultset=statement.executeQuery("SELECT b.email as managerEmail FROM employee b JOIN employee e ON b.emp_id = e.manager_id and e.emp_id = '"+emp_id+"' ");
			if(resultset.next()){
			email = resultset.getString(1);
			}
			
			System.out.println(email);
			
			String fromdate = getFromDate();
			String todate = getToDate();
			
			System.out.println(emp_id);
			System.out.println("fromdate" + fromdate);
			System.out.println("todate" + todate);
			
			/**if(leaves < days) {
				JOptionPane.showMessageDialog(null, "No Sufficient Leaves ");
				System.out.println("No Sufficient Leaves");
			}*/
			
			if(leaves != 0) {
				statement.executeUpdate("insert into leave_sheet values('"+getCategory()+"','"+getFromDate()+"','"+getToDate()+"','"+getReason()+"','"+getEmp_id()+"' , 'waiting' )");
				//statement.executeUpdate("update employee set leaves = leaves - DATEDIFF('"+getToDate()+"' , '"+getFromDate()+"') where emp_id = '"+emp_id+"' ");
				JOptionPane.showMessageDialog(null, "Succesfully Applied ");
				System.out.println("Succesfully Applied Leave");
			}
			
			if (leaves == 0) {
				JOptionPane.showMessageDialog(null, "No Leaves Left ");
				System.out.println("No Leaves Left");
			}
			
			System.out.println("executing");
			
			System.out.println("executing");
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

}