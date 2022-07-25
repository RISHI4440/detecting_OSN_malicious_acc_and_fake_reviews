<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String file = request.getParameter("file1");
            String filepath = "D:\\Manoj 17-18\\OSN\\New_Malicious_Attack\\web\\images\\" + file;

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
            PreparedStatement ps = conn.prepareStatement("insert into image1 values (?,?,?,?,?)");
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, price);
            ps.setString(4, file);
            ps.setString(5, filepath);
            ps.executeUpdate();
            
            if(id.equals("2")||id.equals("6")||id.equals("8")||id.equals("10")||id.equals("15")||id.equals("25")||id.equals("28")||id.equals("31")||id.equals("20")){
            PreparedStatement ps1 = conn.prepareStatement("insert into malitious values (?,?,?,?,?)");
            ps1.setString(1, id);
            ps1.setString(2, name);
            ps1.setString(3, price);
            ps1.setString(4, file);
            ps1.setString(5, filepath);
            ps1.executeUpdate();
            }
        %>
        <script>
            alert("PRODUCT INSERTED SUCCESSFULLY");
            window.location = "seller_product.jsp";
        </script>
    </body>
</html>
