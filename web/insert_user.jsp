
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Registration</title>
    </head>
    <body>
        <%
            String virtual = request.getParameter("virtual");
            String firstname = request.getParameter("fname");
            String lastname = request.getParameter("lname");
            String address = request.getParameter("addr");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String pin = request.getParameter("pin");
            String country = request.getParameter("country");
            String phno = request.getParameter("phno");
            String mail = request.getParameter("mail");
            String age = request.getParameter("age");
            String gender = request.getParameter("gender");
            String bank = request.getParameter("");
            String account = request.getParameter("");
            String card_cetegory = request.getParameter("");
            String date = request.getParameter("");
            String ammount = request.getParameter("");
            String username = request.getParameter("");
            String password = request.getParameter("");
             String cardno = request.getParameter("");
            

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");

            PreparedStatement pstmt = con.prepareStatement("insert into registration value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

            pstmt.setString(1, virtual);
            pstmt.setString(2, firstname);
            pstmt.setString(3, lastname);
            pstmt.setString(4, address);
            pstmt.setString(5, city);
            pstmt.setString(6, state);
            pstmt.setString(7, pin);
            pstmt.setString(8, country);
            pstmt.setString(9, phno);
            pstmt.setString(10, mail);
            pstmt.setString(11, age);
            pstmt.setString(12, gender);
            pstmt.setString(13, bank);
            pstmt.setString(14, account);
            pstmt.setString(15, card_cetegory);
            pstmt.setString(16, date);
            pstmt.setString(17, ammount);
            pstmt.setString(18, username);
            pstmt.setString(19, password);
            pstmt.setString(20, cardno);

            pstmt.executeUpdate();
            %>
            <script>
                
                alert("Register Successfull");
                window.location="login_1.jsp";
                
                
                
            </script>>
    </body>
</html>
