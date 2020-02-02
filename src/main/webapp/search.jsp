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
    <title>جستجو</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>

<body  class="p-5 bg-info" style="font-family: 'B Mitra'">

<%
    List<String> allCities = Arrays.asList("تهران","مشهد","تبریز");
%>


<form action="search" class="form-inline justify-content-center bg-transparent">


    <div class="m-3">
        <label>کلیک کنید</label><br>
        <input class="btn btn-secondary" type="submit" value="جستجوس آنلاین">
    </div>


        <div class="m-3">
            <label>سال</label><br>
            <select class="custom-select" name="year">
                <%
                    for (int i = 1398; i <= 1410; i++)
                        out.print("<option value='"+i+"'>"+i+"</option>");
                %>
            </select>
        </div>


        <div class="m-3">
            <label>ماه</label><br>
            <select class="custom-select" name="month">
                <%
                    for (int i = 1; i <= 12; i++)
                        out.print("<option value='"+i+"'>"+i+"</option>");
                %>
            </select>
        </div>


        <div class=" m-3">
            <label>روز</label><br>
            <select class="custom-select" name="day">
                <%
                    for (int i = 1; i <= (30); i++)
                        out.print("<option value='"+i+"'>"+i+"</option>");
                %>
            </select>
        </div>



    <div class="m-3">
        <label>مقصد</label><br>
        <select class="custom-select" name="destination">
            <%
                for (String i : allCities){
                    out.print("<option value='"+i+"'>"+i+"</option>");
                }
            %>
        </select>
    </div>

    <div class="m-3">
        <label>مبدا</label><br>
        <select class="custom-select" name="origin">
            <%
                for (String i : allCities){
                    out.print("<option value='"+i+"'>"+i+"</option>");
                }
            %>
        </select>
    </div>



</form>


<% String origin = (session.getAttribute("originChoice") == null? "مبدا" : (String) (session.getAttribute("originChoice")));
String destination = (session.getAttribute("destinationChoice") == null? "مقصد" : (String) (session.getAttribute("destinationChoice")));
String date = (session.getAttribute("dateChoice") == null? "0000/00/00" :(String) (session.getAttribute("dateChoice")));
List<Trip> matchedTrips = (List<Trip>) session.getAttribute("mTrips");
%>
<div class="row justify-content-center">
<table class=" table table-dark table-striped w-50">
    <tr>

        <th class="text-left"><% out.print("تاریخ: " + date); %></th>
        <th colspan="2" class="text-right"><% out.print("مسیر: " + origin + " - " + destination ); %></th>
    </tr>
    <tr class="text-center">
        <th >شناسه سفر</th>
        <th>ساعت</th>
        <th>انتخاب</th>
    </tr >

    <%

        if (matchedTrips != null && matchedTrips.size() > 0){
            for (Trip i : matchedTrips){

                out.print("<tr class='text-center '>");

                out.print("<td>"+i.getId()+"</td>");

                out.print("<td>"+i.getTime()+"</td>");

                out.print("<td>");
                out.print("<form action='enterInfo.jsp'>");
                out.print("<input type='text' style='display: none' name='tripId' value='"+i.getId()+"'>");
                out.print("<input type='submit' value='خرید' class='btn btn-success'/>");
                out.print("</form>");
                out.print("</td>");


                out.print("</tr>");
            }
        }
    %>
</table>

</div>

<form class="row justify-content-center">
    <input type="submit" value="بازگشت به صفحه اصلی" formaction="account.jsp" class="btn btn-light">
</form>

</body>
</html>
