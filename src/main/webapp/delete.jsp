<%@ page import="ir.maktab32.java.homeworks.onlineticket.repositories.TicketRepository" %>
<%@ page import="ir.maktab32.java.homeworks.onlineticket.entities.Ticket" %>
<%@ page import="ir.maktab32.java.homeworks.onlineticket.repositories.UserRepository" %>
<%@ page import="ir.maktab32.java.homeworks.onlineticket.entities.User" %><%--
  Created by IntelliJ IDEA.
  User: Alireza
  Date: 2/1/2020
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>لغو بلیط</title>
</head>
<body>

<%
    Long ticketId = Long.parseLong ( (String) request.getParameter("ticketId"));
    Ticket ticket = TicketRepository.getInstance().findById(ticketId);
    User owner = ticket.getOwner();
    owner.getTickets().remove(ticket);
    UserRepository.getInstance().update(owner);
    String msg = "بلیط شما به شناسه " + ticketId + " با موفقیت لغو شد";
    out.print(msg);
%>
</body>
</html>
