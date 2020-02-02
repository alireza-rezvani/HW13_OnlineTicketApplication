<%--
  Created by IntelliJ IDEA.
  User: Alireza
  Date: 2/1/2020
  Time: 12:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>حساب کاربری</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body class="text-center row p-5 justify-content-center align-content-center bg-info" style="font-family: 'B Mitra'">

<%
    if (session.getAttribute("uname") == null)
        response.sendRedirect("login_error.jsp");
%>
<div class="bg-white rounded p-1 w-50 text-center">
    <div class="bg-info p-5 rounded w-100 h-100 text-center">
<form >
    <input class="rounded text-center m-2 btn btn-dark w-50" type="submit" formaction="myTickets" value="مشاهده بلیط های خریداری شده"><br>
    <input class="rounded text-center m-2 btn btn-dark w-50" type="submit" formaction="search.jsp" value="صفحه خرید بلیط"><br>
    <input class="rounded text-center m-2 btn btn-dark w-50" type="submit" formaction="logout" value="خروج از سایت">
</form>
    </div>
</div>
</body>
</html>
