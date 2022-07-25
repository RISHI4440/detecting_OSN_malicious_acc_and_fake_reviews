<%@page import="java.sql.ResultSet"%>
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
            String uname = request.getParameter("username");
            String virtual = request.getParameter("virtual");
            String city = request.getParameter("city");
            String pin = request.getParameter("pin");

            Connection con = db.Connect.getConnection();
            PreparedStatement pstmt1 = con.prepareStatement("SELECT virtual,city,pin FROM registration WHERE  virtual=? AND city=? AND pin=?");

           // pstmt1.setString(1, uname);
            pstmt1.setString(1, virtual);
            pstmt1.setString(2, city);
             pstmt1.setString(3, pin);
            ResultSet rs1 = pstmt1.executeQuery();
            if (rs1.next()) {
        %>
        <script>
            alert("VERIFIED USER");
            window.location = "display.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Not detected");
            window.location = "verifying_card.jsp";
        </script>
        <%
            }


        %>
    </body>
</html>
