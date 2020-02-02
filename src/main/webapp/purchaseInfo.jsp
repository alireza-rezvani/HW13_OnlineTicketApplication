<%@ page import="ir.maktab32.java.homeworks.onlineticket.entities.Ticket" %>
<%@ page import="ir.maktab32.java.homeworks.onlineticket.repositories.TicketRepository" %><%--
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body class="row justify-content-center align-content-center p-5 bg-info" style="font-family: 'B Mitra'" >
<%
    Ticket boughtTicket = (Ticket) session.getAttribute("boughtTicket");

    String msg = (boughtTicket.getGender().equals("male")?"آقای " : "خانم ") + boughtTicket.getName() +
    " " + boughtTicket.getFamily() + " خرید بلیط شما با موفقیت انجام شد" ;
    String msg2 =  "شناسه بلیط: " + boughtTicket.getId();
%>

<form action="account.jsp" class="p-5 bg-transparent text-center" >
    <%=msg%><br>
    <%=msg2%><br><br>
    <input type="submit" value="بازگشت به صفحه اصلی" class="btn btn-dark">
</form>

</body>
</html>
