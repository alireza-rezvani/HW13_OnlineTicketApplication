<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="ir.maktab32.java.homeworks.onlineticket.repositories.TripRepository" %>
<%@ page import="ir.maktab32.java.homeworks.onlineticket.entities.Trip" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Alireza
  Date: 2/1/2020
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body class="col text-center row p-5 justify-content-center align-content-center" style="font-family: 'B Mitra'">

<%
    List<String> allCities = Arrays.asList("تهران","مشهد","تبریز");
%>


<form action="search" class="bg-primary p-5 rounded-pill w-50 align-content-center">
    <div class="row align-content-center justify-content-between">


        <div>
            <label>مبدا</label><br>
            <select name="origin">
                <%
                    for (String i : allCities){
                        out.print("<option value='"+i+"'>"+i+"</option>");
                    }
                %>
            </select>
        </div>

        <div>
            <label>مقصد</label><br>
            <select name="destination">
                <%
                    for (String i : allCities){
                        out.print("<option value='"+i+"'>"+i+"</option>");
                    }
                %>
            </select>
        </div>


        <div>
            <label>سال</label><br>
            <select name="year">
                <%
                    for (int i = 1398; i <= 1410; i++)
                        out.print("<option value='"+i+"'>"+i+"</option>");
                %>
            </select>
        </div>


        <div>
            <label>ماه</label><br>
            <select name="month">
                <%
                    for (int i = 1; i <= 12; i++)
                        out.print("<option value='"+i+"'>"+i+"</option>");
                %>
            </select>
        </div>


        <div>
            <label>روز</label><br>
            <select name="day">
                <%
                    for (int i = 1; i <= (30); i++)
                        out.print("<option value='"+i+"'>"+i+"</option>");
                %>
            </select>
        </div>

        <div>
            <label>کلیک کنید</label><br>
        <input type="submit" value="جستجوس آنلاین">
        </div>

    </div>
</form>



<% String origin = (session.getAttribute("originChoice") == null? "مبدا" : (String) (session.getAttribute("originChoice")));
String destination = (session.getAttribute("destinationChoice") == null? "مقصد" : (String) (session.getAttribute("destinationChoice")));
String date = (session.getAttribute("dateChoice") == null? "تاریخ" :(String) (session.getAttribute("dateChoice")));
List<Trip> matchedTrips = (List<Trip>) session.getAttribute("mTrips");
%>
<table>
    <tr>
        <th colspan="3"><% out.print("از " + origin + " به " + destination + " در تاریخ " + date); %></th>
    </tr>
    <tr>
        <th>انتخاب</th>
        <th>ساعت</th>
        <th>شناسه سفر</th>
    </tr>

    <%

        if (matchedTrips != null && matchedTrips.size() > 0){
            for (Trip i : matchedTrips){

                out.print("<tr>");
                out.print("<td><a href='enterInfo.jsp?tripId="+i.getId()+"'>خرید</a></td>");
                out.print("<td>"+i.getTime()+"</td>");
                out.print("<td>"+i.getId()+"</td>");
                out.print("</tr>");
            }
        }
    %>
</table>

</body>
</html>
