<%-- 
    Document   : complan
    Created on : Sep 16, 2017, 3:34:40 PM
    Author     : sai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div><%@include file="user_header.jsp" %></div>
        <hr>
        <br><br>
        <br>
    <center>
        <h2 style="color: green">COMPLAIN FORM</h2>
        <hr>
        <form action="complain_insert.jsp" method="post">
        <fieldset style="margin-left: 3%">
                PRODUCT ID:
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="product" style="width: 20%;margin-left:2%">
                 <br><br>
                 PRODUCT Name:
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="product_name" style="width: 20%;margin-left:2%">
                 <br><br>
                USER NAME:
              &nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="user"  style="width: 20%;margin-left:2%" >
                <br>
                <br>
                COMPLAINT:
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"  name="complain"  class="textfeild1" style=" height: 100px;width: 20%" required>
                <br>
                <br>
                 CARD NUMBER:
                &nbsp;&nbsp;<input type="text"  name="number"  style="width: 20%;margin-left:2%" >
                <br>
                <br>
                DATE:
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <input type="date"  name="date"  style="width: 20%;margin-left:2%">
                <br><br>
               
                <br>
               
                <input type="submit" value="Submit" style="margin-left: 11%;width: 20%;height: 20%">
        </fieldset>
        
        </form>
        </center>
        <%@include file="footer.jsp" %>
    </body>
</html>
