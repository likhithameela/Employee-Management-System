package com.employee.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.employee.bean.LoginBean;
import com.employee.dao.LoginDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		session.removeAttribute("emp_id");
		response.sendRedirect("Login.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emp_id = request.getParameter("empID");
		String password = request.getParameter("empPassword");
		//String project_id = request.getParameter("projectid");
		PrintWriter out = response.getWriter();
		 
		LoginBean loginBean = new LoginBean();
		 
		loginBean.setEmpID(emp_id);
		loginBean.setPassword(password);
		//loginBean.setProjectid(project_id);
		 
		LoginDAO loginDAO = new LoginDAO();
		
		HttpSession session = request.getSession();
        session.setAttribute("empid" , emp_id );
        //session.setAttribute("projectid", project_id);
        
		 
		try
		{
		String userValidate = loginDAO.authenticateUser(loginBean);
		 
		if(userValidate.equals("Admin"))
		{
		System.out.println("Admin");
		request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
		
		}
		
		else if(userValidate.equals("Manager"))
		{
		System.out.println("Manager's Page");
		response.sendRedirect("ManagerPage.jsp");
		}
		
		else if(userValidate.equals("Clerk"))
		{
		System.out.println("Clerk's Page");	 	 
		request.getRequestDispatcher("EmpPage.jsp").forward(request, response);
		}
		
		else
		{
			out.println("<script type=\"text/javascript\">"); 
			out.println("alert(\"Username or password incorrect!!!\")"); 
			out.println("</script>"); 
			response.sendRedirect("Login.jsp");
		}
		
		}
		catch (IOException e1)
		{
		e1.printStackTrace();
		}
		catch (Exception e2)
		{
		e2.printStackTrace();
		}
	}

	private Object getSession(String string) {
		// TODO Auto-generated method stub
		return null;
	}
}