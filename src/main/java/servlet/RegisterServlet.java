package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import dao.UserDAO;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String state = req.getParameter("state");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		System.out.println("REGISTER SERVLET HIT");

		User newUser = new User(name, state, email, password);

		int result = new UserDAO().register(newUser);
		
		if (result == 1) 
		{
		    resp.sendRedirect("login.jsp");
		}
		else if (result == -1) 
		{
		    req.setAttribute("error", "Email already exists. Please login.");
		    req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		else 
		{
		    resp.getWriter().print("Registration failed");
		}
	}
}