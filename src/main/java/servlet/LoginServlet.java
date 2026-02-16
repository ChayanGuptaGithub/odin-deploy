package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.UserDAO;
import entity.User;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = new User();
        user.setEmail(email);
        user.setPassword(password);

        User loggedUser = new UserDAO().login(user);

        if (loggedUser != null) {
            HttpSession session = req.getSession();
            String fullName = loggedUser.getName();
            String firstName = fullName.split(" ")[0];
            session.setAttribute("username", firstName);
            resp.sendRedirect("Homepage.jsp");
        } else {
            resp.sendRedirect("login.jsp?error=1");
        }
    }
}
