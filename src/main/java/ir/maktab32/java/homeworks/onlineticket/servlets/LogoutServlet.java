package ir.maktab32.java.homeworks.onlineticket.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session.getAttribute("uname") == null){
            resp.sendRedirect("login_error.jsp");
        }
        else {
//            session.setAttribute("uname", null);
            session.invalidate();

            resp.sendRedirect("index.jsp");
        }
    }
}
