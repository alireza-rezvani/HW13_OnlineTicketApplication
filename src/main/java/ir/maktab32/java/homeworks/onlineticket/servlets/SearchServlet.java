package ir.maktab32.java.homeworks.onlineticket.servlets;

import ir.maktab32.java.homeworks.onlineticket.entities.Trip;
import ir.maktab32.java.homeworks.onlineticket.repositories.TripRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        String username = (String) session.getAttribute("uname");
        if (username == null){
            resp.sendRedirect("login_error.jsp");
        }
        else {
            String origin = (String) req.getParameter("origin");
            String destination = (String) req.getParameter("destination");
            String year = (String) req.getParameter("year");
            String month = (String) req.getParameter("month");
            String day = (String) req.getParameter("day");

            if (origin == null || destination == null || year == null || month == null || day == null){
                resp.sendRedirect("search.jsp");
            }
            else {
                if (month.length() == 1)
                    month = "0" + month;
                if (day.length() == 1)
                    day = "0" + day;


                String date = year + "/" + month + "/" + day;


                List<Trip> allTrips = TripRepository.getInstance().findAll();
                List<Trip> matchedTrips = new ArrayList<>();
                if (allTrips.size() > 0){
                    for (Trip i : allTrips){
                        if (i.getOrigin().equals(origin) && i.getDestination().equals(destination) && i.getDate().equals(date))
                            matchedTrips.add(i);
                    }
                }

                session.setAttribute("mTrips", matchedTrips);
                session.setAttribute("originChoice", origin);
                session.setAttribute("destinationChoice", destination);
                session.setAttribute("dateChoice",date);

                resp.sendRedirect("search.jsp");
            }

        }
    }
}
