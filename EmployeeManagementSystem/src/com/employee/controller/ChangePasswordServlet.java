package com.employee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.employee.bean.ChangePassword;
import com.employee.bean.LoginBean;
import com.employee.dao.LoginDAO;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
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
		String emp_id = request.getParameter("empID");
		String empID = request.getParameter("emp_id");
		String newpassword = request.getParameter("newpassword");
		
		LoginBean loginBean = new LoginBean();
		 
		loginBean.setEmpID(emp_id);
		
        LoginDAO loginDAO = new LoginDAO();
		
		HttpSession session = request.getSession();
        session.setAttribute("empid" , emp_id );
		
		ChangePassword cp = new ChangePassword();
		cp.setEmpID(empID);
		cp.setNewPassword(newpassword);
        cp.saveData();
        RequestDispatcher rd = request.getRequestDispatcher("ChangePassword.jsp");
		rd.forward(request, response);
	}

}








