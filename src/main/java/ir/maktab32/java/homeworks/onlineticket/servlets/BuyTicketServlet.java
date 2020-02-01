package ir.maktab32.java.homeworks.onlineticket.servlets;

import ir.maktab32.java.homeworks.onlineticket.entities.Ticket;
import ir.maktab32.java.homeworks.onlineticket.entities.Trip;
import ir.maktab32.java.homeworks.onlineticket.entities.User;
import ir.maktab32.java.homeworks.onlineticket.repositories.TicketRepository;
import ir.maktab32.java.homeworks.onlineticket.repositories.TripRepository;
import ir.maktab32.java.homeworks.onlineticket.repositories.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
 @WebServlet("/buyTicket")
public class BuyTicketServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        String username = (String) session.getAttribute("uname");
        if (username == null){
            resp.sendRedirect("login_error.jsp");
        }
        else {
            Long tripId = Long.parseLong((String) req.getParameter("tripId"));
            Trip choiceTrip = TripRepository.getInstance().findById(tripId);
            String passengerName = req.getParameter("buyerName");
            String passengerFamily = req.getParameter("buyerFamily");
            String passengerGender = req.getParameter("gender");
            User owner = UserRepository.getInstance().findByUsername(username);
            Ticket ticket = new Ticket(null, passengerName, passengerFamily, passengerGender, owner, choiceTrip);
            owner.getTickets().add(ticket);

            UserRepository.getInstance().update(owner);
            session.setAttribute("boughtTicket", ticket);
            resp.sendRedirect("purchaseInfo.jsp");

            //todo check sending boughtTicket by cookie
        }
    }
}
