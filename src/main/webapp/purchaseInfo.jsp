<%@ page import="ir.maktab32.java.homeworks.onlineticket.entities.Ticket" %><%--
  Created by IntelliJ IDEA.
  User: Alireza
  Date: 2/1/2020
  Time: 7:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>اطلاعات خزید</title>
</head>
<body>
<%
    Ticket boughtTicket = (Ticket) session.getAttribute("boughtTicket");
    String msg = (boughtTicket.getGender().equals("male")?"آقای " : "خانم ") + boughtTicket.getName() +
    " " + boughtTicket.getFamily() + " خرید بلیط شما با موفقیت انجام شد" + "\n\n" + "شناسه بلیط: " + boughtTicket.getId();

    out.print(msg);
%>


</body>
</html>
