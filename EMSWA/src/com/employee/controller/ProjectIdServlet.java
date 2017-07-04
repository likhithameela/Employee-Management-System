package com.employee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.employee.bean.LoginBean;
import com.employee.bean.ProjectId;

/**
 * Servlet implementation class ProjectIdServlet
 */
@WebServlet("/ProjectIdServlet")
public class ProjectIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String project_id = request.getParameter("projectid");
		String employee_id = request.getParameter("empid");
		
		String sql = "";
		if((project_id.length() != 0) && (employee_id.length() != 0)) {
			sql = "select  task_name , emp_id , num_of_hours , date , project_id  from time_sheet where project_id = '"+project_id+"' AND emp_id = '"+employee_id+"';";
		} else if((project_id.length() != 0) && (employee_id.length() == 0)) {
			sql = "select  task_name , emp_id , num_of_hours , date , project_id  from time_sheet where project_id = '"+project_id+"';";
		} else if((project_id.length() == 0) && (employee_id.length() != 0)) {
			sql = "select  task_name , emp_id , num_of_hours , date , project_id  from time_sheet where emp_id = '"+employee_id+"';";
		}
		
		session.setAttribute("SQL" , sql );
		
	        try {
        	response.sendRedirect("ProjectDetails.jsp");
        }
        catch(Exception e) {
        	System.out.println("e");
        }
	}

}









