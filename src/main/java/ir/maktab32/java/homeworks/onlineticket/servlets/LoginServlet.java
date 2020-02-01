package ir.maktab32.java.homeworks.onlineticket.servlets;

import ir.maktab32.java.homeworks.onlineticket.repositories.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");


        UserRepository userRepository = UserRepository.getInstance();
        if (userRepository.isUsernameExisting(username)
                && userRepository.findByUsername(username).getPassword().equals(password)){

            HttpSession session = req.getSession(false);
            session.setAttribute("uname", username);

            resp.sendRedirect("account.jsp");


        }
        else {
            resp.sendRedirect("login_error.jsp");
        }
    }

}
