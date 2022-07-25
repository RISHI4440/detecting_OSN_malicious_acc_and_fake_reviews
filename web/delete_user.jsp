<%-- 
    Document   : delete_user
    Created on : Sep 16, 2017, 11:17:16 AM
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
            String adhar = session.getAttribute("virtual").toString();            
            System.out.println("get adhar no"+adhar);
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
                PreparedStatement pstmt = con.prepareStatement("DELETE FROM registration WHERE virtual=?");
                pstmt.setString(1 ,adhar);
                
                
                int i = pstmt.executeUpdate();
                if (i > 0) {
        %>
        <script>
            alert("user Deleted..");
            window.location = "user_list.jsp"
        </script>
        <%
                }

            } catch (Exception ex) {
                ex.printStackTrace();
            }
response.sendRedirect("user_list.jsp");
        %>
    </body>
</html>
