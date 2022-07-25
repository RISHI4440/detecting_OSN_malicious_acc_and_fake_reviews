     <%-- 
    Document   : insert
    Created on : Aug 27, 2016, 3:53:27 PM
    Author     : Mangesh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
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
            Connection con = db.Connect.getConnection();
           
            PreparedStatement pstmt = con.prepareStatement("insert into user(fname,lname,addr,mail,phno,uname,pass) values(?,?,?,?,?,?,?)");
            pstmt.setString(1, request.getParameter("fname"));
            pstmt.setString(2, request.getParameter("lname"));
            pstmt.setString(3, request.getParameter("addr"));
            pstmt.setString(4, request.getParameter("mail"));
            pstmt.setString(5, request.getParameter("phno"));
            pstmt.setString(6, request.getParameter("uname"));
            pstmt.setString(7, request.getParameter("pass"));
           
            int i = pstmt.executeUpdate();
            if (i > 0) {
        %>
        <script>
            alert("Inserted Successfully");
            window.location = "login_1.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "login_1.jsp";
        </script>
        <%
            }

        %>
    </body>
</html>
