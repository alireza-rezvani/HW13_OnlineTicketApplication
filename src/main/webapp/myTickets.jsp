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
<body class="row justify-content-center p-5 bg-info" style="font-family: 'B Mitra'">

<div  class="w-50">
<table class="table table-dark table-striped w-100">
    <tr>
        <th colspan="3" class="text-center">لیست بلیطهای خریداری شده</th>
    </tr>
    <tr class="text-center">
        <th>تاریخ</th>
        <th>شناسه بلیط</th>
        <th>انتخاب</th>
    </tr>
    <%
        List<Ticket> userTickets =(List<Ticket>) session.getAttribute("userTickets");



        if (userTickets.size() > 0){
            for (Ticket i : userTickets){

                out.print("<tr  class='text-center'>");
                out.print("<td>"+i.getTrip().getDate()+"</td>");
                out.print("<td>"+i.getId()+"</td>");
                out.print("<td><a href='seeTicket.jsp?ticketId="+i.getId()+"'>مشاهده بلیط</a></td>");
                out.print("</tr>");
            }
        }
    %>


</table>

    <form class="row justify-content-center">
        <input type="submit" value="بازگشت به صفحه اصلی" formaction="account.jsp" class="btn btn-light">
    </form>
</div>
</body>
</html>
