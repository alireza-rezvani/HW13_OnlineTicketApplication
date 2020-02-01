<%@ page import="ir.maktab32.java.homeworks.onlineticket.entities.Trip" %>
<%@ page import="ir.maktab32.java.homeworks.onlineticket.entities.User" %>
<%@ page import="ir.maktab32.java.homeworks.onlineticket.repositories.UserRepository" %><%--
  Created by IntelliJ IDEA.
  User: Alireza
  Date: 2/1/2020
  Time: 7:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>اطلاعات مسافر</title>
</head>
<body>

<%
    String tripId = (String) request.getParameter("tripId");
    session.getAttribute("uname");
    User user = UserRepository.getInstance().findByUsername((String) session.getAttribute("uname"));
%>

<form action="buyTicket">

    نام مسافر
    <input type="text" name="buyerName" value="<%= user.getName()%>">
    <br>
    نام خانوادگی مسافر
    <input type="text" name="buyerFamily" value="<%= user.getFamily()%>">
    <br>
    جنسیت
    <input type="radio" name="gender" value="male"> مرد<br>
    <input type="radio" name="gender" value="female"> زن<br>
    <br>

    <input type="text" name="tripId" value="<%=tripId%>" style="display: none">

    <input type="submit" value="تایید">

</form>
</body>
</html>
