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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body class="row justify-content-center p-5 bg-info " style="font-family: 'B Mitra'">

<%
    Long ticketId = Long.parseLong ( (String) request.getParameter("ticketId"));
    Ticket ticket = TicketRepository.getInstance().findById(ticketId);
%>

<table class="table table-dark table-striped text-right w-50">
    <tr class="text-center">
        <th colspan="2" class="thead-light">بلیط اتوبوس</th>
    </tr>
    <tr>
        <td><%=ticketId%></td>
        <td>شناسه بلیط</td>
    </tr>
    <tr>
        <td><%=ticket.getName() + " " + ticket.getFamily()%></td>
        <td>نام</td>
    </tr>
    <tr>
        <td><%=(ticket.getGender().equals("male")?"آقا":"خانم")%></td>
        <td>جنسیت</td>
    </tr>
    <tr>
        <td><%=ticket.getTrip().getOrigin()%></td>
        <td>مبدا</td>
    </tr>
    <tr>
        <td><%=ticket.getTrip().getDestination()%></td>
        <td>مقصد</td>
    </tr>
    <tr>
        <td><%=ticket.getTrip().getDate()%></td>
        <td>تاریخ حرکت</td>
    </tr>
    <tr>
        <td><%=ticket.getTrip().getTime()%></td>
        <td>ساعت حرکت</td>
    </tr>
    <tr>
        <td><%=ticket.getTrip().getId()%></td>
        <td>شناسه سفر</td>
    </tr>
    <tr class="text-center">
        <td colspan="2">
            <form action="delete.jsp">
            <input type="text" name="ticketId" style="display: none" value="<%=ticketId%>">
            <input type="submit" value="لغو بلیط" class="btn bg-danger">
            </form>

            <form >
                <input type="submit" value="بازگشت به صفحه اصلی" formaction="account.jsp" class="btn btn-light">
                <input type="submit" value="بازگشت به بلیط های من" formaction="myTickets" class="btn btn-light">
            </form>
        </td>

    </tr>
</table>



<%--***************************** edited above - you can remove this comment--%>
<%--<form action="delete.jsp" class="form w-50 text-center bg-primary">--%>

<%--    <% out.println("شناسه بلیط : " + ticket.getId());%><br>--%>
<%--    <% out.println("نام : " + ticket.getName());%><br>--%>
<%--    <% out.println("جنسیت : " + (ticket.getGender().equals("male")?"آقا":"خانم"));%><br>--%>
<%--    <% out.println("مبدا : " + ticket.getTrip().getOrigin());%><br>--%>
<%--    <% out.println("مقصد : " + ticket.getTrip().getDestination());%><br>--%>
<%--    <% out.println("تاریخ حرکت : " + ticket.getTrip().getDate());%><br>--%>
<%--    <% out.println("ساعت حرکت : " + ticket.getTrip().getTime());%><br>--%>
<%--    <% out.println("شناسه سفر : " + ticket.getTrip().getId());%><br>--%>
<%--    <input type="text" name="ticketId" style="display: none" value="<%=ticketId%>">--%>
<%--    <input type="submit" value="لغو بلیط">--%>
<%--</form>--%>


</body>
</html>
