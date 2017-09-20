package com.employee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.bean.Forgotregister;

/**
 * Servlet implementation class ForgotRegisterServlet
 */
@WebServlet("/ForgotRegisterServlet")
public class ForgotRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotRegisterServlet() {
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
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String empID = request.getParameter("emp_id");
		String newpassword = request.getParameter("newpassword");
		
		Forgotregister fr = new Forgotregister();
		fr.setSecurityQuestion(question);
		fr.setSecurityAnswer(answer);
		fr.setEmpID(empID);
		fr.setNewPassword(newpassword);
		fr.saveData();
		RequestDispatcher rd = request.getRequestDispatcher("ForgotPassword.jsp");
		rd.forward(request, response);
	}
}







