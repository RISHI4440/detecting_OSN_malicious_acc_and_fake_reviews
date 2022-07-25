<%-- 
    Document   : delete
    Created on : Sep 20, 2017, 12:18:12 PM
    Author     : sai
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
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
        <%

             String card_no = request.getParameter("card_no");

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
             
            PreparedStatement pstmt = con.prepareStatement("DELETE FROM  registration WHERE card_no=?");
            pstmt.setString(1, card_no);
            pstmt.executeUpdate();

            response.sendRedirect("user_list.jsp");


        %>
        <
    </body>
</html>
