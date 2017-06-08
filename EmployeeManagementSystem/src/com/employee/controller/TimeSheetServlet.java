package com.employee.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.bean.TimeSheet;

/**
 * Servlet implementation class TimeSheetServlet
 */
@WebServlet("/TimeSheetServlet")
public class TimeSheetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeSheetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request , response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String emp_id = request.getParameter("empid");
		String task_name1 = request.getParameter("1");
		String project_id = request.getParameter("project_id");
		String numOfHours1 = request.getParameter("hours1");
		String date = request.getParameter("date");
		String description1 = request.getParameter("description1");
		
		TimeSheet ts = new TimeSheet();
		ts.setTask_name1(task_name1);
		ts.setProject_id(project_id);
		ts.setEmp_id(emp_id);
		ts.setNum_of_hours1(numOfHours1);
		ts.setDate(date);
		ts.setDescription1(description1);
		
		String task_name2 = request.getParameter("2");
		String numOfHours2 = request.getParameter("hours2");
		String description2 = request.getParameter("description2");
		
		ts.setTask_name2(task_name2);
		ts.setNum_of_hours2(numOfHours2);
		ts.setDescription2(description2);
		ts.saveData();
		
	    RequestDispatcher rd = request.getRequestDispatcher("EmpPage.jsp");
		rd.forward(request, response);
	}

}
