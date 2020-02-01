<%@ page import="java.util.List" %>
<%@ page import="ir.maktab32.java.homeworks.onlineticket.entities.Ticket" %><%--
  Created by IntelliJ IDEA.
  User: Alireza
  Date: 2/1/2020
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>بلیط های من</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body class="text-center row p-5 justify-content-center align-content-center" style="font-family: 'B Mitra'">

<table>
    <tr>
        <th colspan="3">لیست بلیطهای خریداری شده</th>
    </tr>
    <tr>
        <th>انتخاب</th>
        <th>شناسه بلیط</th>
        <th>تاریخ</th>
    </tr>
    <%
        List<Ticket> userTickets =(List<Ticket>) session.getAttribute("userTickets");



        if (userTickets.size() > 0){
            for (Ticket i : userTickets){

                out.print("<tr>");
                out.print("<td><a href='seeTicket.jsp?ticketId="+i.getId()+"'>مشاهده</a></td>");
                out.print("<td>"+i.getId()+"</td>");
                out.print("<td>"+i.getTrip().getDate()+"</td>");
                out.print("</tr>");
            }
        }
    %>


</table>
</body>
</html>
