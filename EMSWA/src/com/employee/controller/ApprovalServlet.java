package com.employee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.employee.bean.Approval;

/**
 * Servlet implementation class ApprovalServlet
 */
@WebServlet("/ApprovalServlet")
public class ApprovalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApprovalServlet() {
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
		
		/**String approved = request.getParameter("approval");
		String disapproved = request.getParameter("approval");
		System.out.println(approved);
		System.out.println(disapproved);
		
		Approval approve = new Approval();
		approve.setApproved("approved");
		approve.setDisapproved("disapproved");
		approve.saveData();
		System.out.println("in servlet");
		
		RequestDispatcher rd = request.getRequestDispatcher("ManagerPage.jsp");
		rd.forward(request, response);*/
		
		HttpSession session = request.getSession();
		String row = (String) session.getAttribute("value");
		
		String approval = request.getParameter("gender");
		System.out.println(approval);
		
		Approval approve = new Approval();
		approve.setApproved(approval);
		approve.setEmpID(row);
		approve.saveData();
		
		RequestDispatcher rd = request.getRequestDispatcher("ManagerPage.jsp");
		rd.forward(request, response);

		
	}

}







