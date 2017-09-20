package com.employee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.bean.EmployeeRegister;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmployeeRegisterServlet
 */
@WebServlet("/EmployeeRegisterServlet")
public class EmployeeRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		String empID = request.getParameter("emp_id");
		String name = request.getParameter("emp_name");
		String dateOfBirth = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("contact");
        String email = request.getParameter("email");
		String address = request.getParameter("address");
		String designation = request.getParameter("designation");
		String mangID = request.getParameter("manager_id");
		String salary = request.getParameter("salary");
		//String leave = request.getParameter("leaves");
		//String password = request.getParameter("password");

		EmployeeRegister er = new EmployeeRegister();
		er.setEmpID(empID);
		er.setName(name);
		er.setDateOfBirth(dateOfBirth);
		er.setGender(gender);
		er.setPhone(phone);		
		er.setEmail(email);
		er.setAddress(address);
		er.setDesignation(designation);
		er.setMangID(mangID);
        er.setSalary(salary);
		//er.setLeave(30);
		er.setPassword("trustus");
		er.saveData(null);
		RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
			rd.forward(request, response);
	}

}
