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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body class="row justify-content-center align-content-center p-5 bg-info " style="font-family: 'B Mitra'">

<%--validation to enter the page--%>
<%--<%--%>
<%--    if (session.getAttribute("uname") == null)--%>
<%--        response.sendRedirect("login_error.jsp");--%>
<%--    else if (request.getParameter("ticketId") == null)--%>
<%--        response.sendRedirect("notEnoughData.jsp");--%>
<%--%>--%>

<%
    Long ticketId = Long.parseLong ( (String) request.getParameter("ticketId"));
    Ticket ticket = TicketRepository.getInstance().findById(ticketId);
    User owner = ticket.getOwner();
    owner.getTickets().remove(ticket);
    UserRepository.getInstance().update(owner);
    TicketRepository.getInstance().remove(ticket);
    String msg = "بلیط شما به شناسه " + ticketId + " با موفقیت لغو شد";

%>

<form action="myTickets" class="bg-transparent w-50 text-center p-5">
    <label ><%=msg%></label><br>
    <input type="submit" value="بازگشت به بلیط های من" class="btn btn-dark">
</form>
</body>
</html>
