<%@ page import="ir.maktab32.java.homeworks.onlineticket.entities.Ticket" %>
<%@ page import="ir.maktab32.java.homeworks.onlineticket.repositories.TicketRepository" %><%--
  Created by IntelliJ IDEA.
  User: Alireza
  Date: 2/1/2020
  Time: 8:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>مشاهده بلیط</title>
</head>
<body>

<%
    Long ticketId = Long.parseLong ( (String) request.getParameter("ticketId"));
    Ticket ticket = TicketRepository.getInstance().findById(ticketId);
%>

<form action="delete.jsp">
    <% out.println("شناسه بلیط : " + ticket.getId());%><br>
    <% out.println("نام : " + ticket.getName());%><br>
    <% out.println("جنسیت : " + (ticket.getGender().equals("male")?"آقا":"خانم"));%><br>
    <% out.println("مبدا : " + ticket.getTrip().getOrigin());%><br>
    <% out.println("مقصد : " + ticket.getTrip().getDestination());%><br>
    <% out.println("تاریخ حرکت : " + ticket.getTrip().getDate());%><br>
    <% out.println("ساعت حرکت : " + ticket.getTrip().getTime());%><br>
    <% out.println("شناسه سفر : " + ticket.getTrip().getId());%><br>
    <input type="text" name="ticketId" style="display: none" value="<%=ticketId%>">
    <input type="submit" value="لغو بلیط">
</form>
</body>
</html>
