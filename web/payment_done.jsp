<%-- 
    Document   : payment_done
    Created on : Sep 16, 2017, 9:24:01 AM
    Author     : sai
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="user_header.jsp" %>
        <br><br>
        <br><br>
        <br>
        <br><br>
        <br>
        <form action="display.jsp" method="get">
                
            <fieldset>
              <hr>
              <h1 style="margin-left: 4%">Your Transaction is Successful... </h1>


                <br>
                <input type="submit" name="login" class="button1" style="margin-left: 150px" value="Buy More" />

            </fieldset>
        </form>
         <hr>
         <br><br><br> <br><br><br> <br><br><br> <br><br><br> 
        <%@include file="footer.jsp" %>
    </body>
</html>
