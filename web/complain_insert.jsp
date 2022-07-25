<%-- 
    Document   : complain_insert
    Created on : Sep 16, 2017, 4:04:59 PM
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
        <%
            String pro_id = request.getParameter("product");
            String product_name = request.getParameter("product_name");
           session.setAttribute("id", pro_id);
            String user = request.getParameter("user");
            String complain = request.getParameter("complain");
            String number = request.getParameter("number");
            String date = request.getParameter("date");
            
           Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");

            PreparedStatement pstmt = con.prepareStatement("insert into complain value(?,?,?,?,?,?)");

            pstmt.setString(1, pro_id);
             pstmt.setString(2,product_name);
            pstmt.setString(3, user);
            pstmt.setString(4, complain);
            pstmt.setString(5, number);
            pstmt.setString(6, date);
            pstmt.executeUpdate();
            response.sendRedirect("complan.jsp");
            


        %>
    </body>
</html>
