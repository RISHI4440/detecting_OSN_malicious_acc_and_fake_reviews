        <%-- 
    Document   : display
    Created on : Sep 20, 2017, 9:57:25 AM
    Author     : sai
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>  
            table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 2px solid #dddddd;
    text-align: center;
    padding: 100px;
    height: 150px;
}
 
tr:nth-child(odd) {
    background-color: #dddddd;
}
        </style>  
    </head>
    <body>
        <%@include file="ecommerce_header.jsp" %>

        <br><br>
        <br><br>
        <br><br>

        <br>

       <center> <h2 style="color: green">SHOPPING CART</h2>
        
       <table style="width: 90%;margin-left: 3%">
            <tr>
                <th style="height:50px">PRODUCT ID</th>
                <th>PRODUCT NAME</th>
                <th>PRICE</th>
                <th>PRODUCT IMAGE</th>
                <th>OPERATION</th>
                <th>RECHARGE</th><
                </tr>

            <%

                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
                PreparedStatement p = conn.prepareStatement("select * from image1");
    //            p.setString(1,"1");
                ResultSet rs = p.executeQuery();
                while (rs.next()) {

            %>

            <tr><td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><img src="images/<%=rs.getString(4)%>" width="150" height="150" alt="alt"/></td>
                <td><a class="hvr-outline-out button2" href="buying.jsp?product=<%=rs.getString(1)%>">BUY NOW </a></td>
                <td><a class="hvr-outline-out button2" href="recharge.jsp"> MOBILE RECHARGE </a></td>
                <%
                    }
                %> 

        </table>
        <%@include file="footer.jsp" %>    
    </body>
</html>
