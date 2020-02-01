package ir.maktab32.java.homeworks.onlineticket.servlets;

import ir.maktab32.java.homeworks.onlineticket.entities.Ticket;
import ir.maktab32.java.homeworks.onlineticket.entities.User;
import ir.maktab32.java.homeworks.onlineticket.repositories.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class MyTicketsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session.getAttribute("uname") == null){
            resp.sendRedirect("login_error.jsp");
        }
        else {
            User currentUser = UserRepository.getInstance().findByUsername((String) session.getAttribute("uname"));
            List<Ticket> myTickets = currentUser.getTickets();
            session.setAttribute("userTickets",myTickets);
            resp.sendRedirect("myTickets.jsp");
        }
    }
}
