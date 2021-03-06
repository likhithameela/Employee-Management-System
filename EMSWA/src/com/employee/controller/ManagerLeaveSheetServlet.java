package com.employee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.bean.ManagerApplyLeave;

/**
 * Servlet implementation class ManagerLeaveSheetServlet
 */
@WebServlet("/ManagerLeaveSheetServlet")
public class ManagerLeaveSheetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerLeaveSheetServlet() {
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
response.setContentType("text/html");
		
		String category = request.getParameter("category");
		String fromDate = request.getParameter("from_date");
		String toDate = request.getParameter("to_date");
		String reason = request.getParameter("Reason");
		String emp_id = request.getParameter("empid");
		String approved = request.getParameter("gender");
		System.out.println(emp_id);
		
		ManagerApplyLeave ls = new ManagerApplyLeave();
		ls.setCategory(category);
		ls.setFromDate(fromDate);
		ls.setToDate(toDate);
		ls.setReason(reason);
		ls.setEmp_id(emp_id);
		ls.setApproved(approved);
		ls.saveData();
		
		RequestDispatcher rd = request.getRequestDispatcher("ManagerPage.jsp");
		rd.forward(request, response);
	}

}
