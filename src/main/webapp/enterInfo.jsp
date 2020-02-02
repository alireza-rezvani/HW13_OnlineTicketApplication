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
    <title>اطلاعات مسافر</title><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body class="row justify-content-center align-content-center p-5 bg-info" style="font-family: 'B Mitra'">

<%--validation to enter the page--%>
<%--<%--%>
<%--    if (session.getAttribute("uname") == null)--%>
<%--        response.sendRedirect("login_error.jsp");--%>
<%--    else if (request.getParameter("tripId") == null)--%>
<%--        response.sendRedirect("notEnoughData.jsp");--%>
<%--%>--%>

<%
    String tripId = (String) request.getParameter("tripId");
    session.getAttribute("uname");
    User user = UserRepository.getInstance().findByUsername((String) session.getAttribute("uname"));
%>

<form action="buyTicket" class="p-5 text-right  bg-white w-auto">

    <div class="form-group">
        <label>نام مسافر</label><br>
         <input class="text-center" type="text" name="buyerName" value="<%= user.getName()%>">
    </div>

    <div class="form-group">
        <label >نام خانوادگی مسافر</label><br>
        <input class="text-center" type="text" name="buyerFamily" value="<%= user.getFamily()%>">
    </div>

    <div class="form-group">
        <label>جنسیت</label><br>
        <div class="text-left">
        <input type="radio" name="gender" value="male" checked> آقا<br>
        <input type="radio" name="gender" value="female"> خانم<br>
        </div>
    </div>

    <input type="text" name="tripId" value="<%=tripId%>" style="display: none">

    <input type="submit" value="تایید" class="w-100 btn btn-success">

</form>
</body>
</html>
