package com.employee.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

import com.employee.util.DataBaseUtility;

public class ManagerApplyLeave {
	private String category;
	private String fromDate;
	private String toDate;
	private String reason;
	private String emp_id;
	private String approved;
	private String disapproved;
	
	
	public String getApproved() {
		return approved;
	}
	
	public void setApproved(String approved) {
		this.approved = approved;
	}
	
	public String getDispproved() {
		return disapproved;
	}
	
	public void setDispproved(String disapproved) {
		this.disapproved = disapproved;
	}
	
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
			System.out.println(getReason());
			String emp_id = getEmp_id();
			String fromdate = getFromDate();
			String todate = getToDate();
			System.out.println(emp_id);
			System.out.println("fromdate" + fromdate);
			System.out.println("todate" + todate);
			
			int leaves = 0;
			String approve = "";
			String from_date = "";
			String to_date = "";
			ResultSet rs=statement.executeQuery("select leaves from employee  where emp_id = '"+emp_id+"' ");
			if(rs.next()){
			leaves=rs.getInt(1);
			}
			
			ResultSet resultset=statement.executeQuery("select approved , from_date , to_date from leave_sheet where emp_id = '"+emp_id+"' ");
			if(resultset.next()){
			approve=resultset.getString(1);
			from_date = resultset.getString(2);
			to_date = resultset.getString(3);
			}
			
			if(approve.equals(getApproved())) {
				statement.executeUpdate("update employee set leaves = leaves - DATEDIFF(to_date , from_date) where emp_id = '"+emp_id+"' ");
				System.out.println("leaves deducted in employee table");
			}
			
			/**
			String approved = "";
			ResultSet resultset=statement.executeQuery("select approved from leave_sheet where emp_id = '"+emp_id+"' ");
			if(resultset.next()){
			approved=resultset.getString(1);
			}

			if(approved.equalsIgnoreCase(approved)) {
				statement.executeUpdate("update employee set leaves = leaves - DATEDIFF('"+getToDate()+"' , '"+getFromDate()+"') where emp_id = '"+emp_id+"' ");
			}
			*/
			
			if(leaves != 0) {
				statement.executeUpdate("insert into leave_sheet values('"+getCategory()+"','"+getFromDate()+"','"+getToDate()+"','"+getReason()+"','"+getEmp_id()+"' , '"+getApproved()+"')");
				//JOptionPane.showMessageDialog(null, "Succesfully Applied ");
			}
			if (leaves == 0) {
				//JOptionPane.showMessageDialog(null, "No Leaves Left ");
			}
			System.out.println("executing");
		}catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}

