<%-- 
    Document   : payment_insert
    Created on : Sep 18, 2017, 10:32:20 AM
    Author     : sai
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
            String username1 = null;
            String username = session.getAttribute("username").toString();
            String cardno = request.getParameter("cardno");
            String bank = request.getParameter("bank");
            String account = request.getParameter("account");
            String card_cetegory = request.getParameter("card_cetegory");
            String date = request.getParameter("date");
            String amount = request.getParameter("ammount");

//            String virtual = session.getAttribute("virtual").toString();
//            
//             System.out.println("VIRTUAL"+virtual);
//            String firstname = session.getAttribute("firstname").toString();
//            String lastname = session.getAttribute("lastname").toString();
//            String address = session.getAttribute("address").toString();
//            String city = session.getAttribute("city").toString();
//            String state = session.getAttribute("state").toString();
//            String pin = session.getAttribute("pin").toString();
//            String country = session.getAttribute("country").toString();
//            String phno = session.getAttribute("phno").toString();
//            String mail = session.getAttribute("mail").toString();
//            String age = session.getAttribute("age").toString();
//            String gender = session.getAttribute("gender").toString();
//            String password = session.getAttribute("password").toString();

            PreparedStatement pstmt1 = con.prepareStatement("select username from registration where username=?");
            pstmt1.setString(1, username);
            ResultSet rs = pstmt1.executeQuery();
            while (rs.next()) {
                username1 = rs.getString(1);
            }

            System.out.println("UUUUUUUUUUUUUSSSSSSSSSSS" + username1);
            if (username.equalsIgnoreCase(username1)) {

//                PreparedStatement pstmt2 = con.prepareStatement("delete from  registration where username=?");
//                pstmt2.setString(1, username);
//                pstmt2.executeUpdate();

//               PreparedStatement pstmt = con.prepareStatement("insert into registration value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
////                pstmt.setString(1, virtual);
////                pstmt.setString(2, firstname);
////                pstmt.setString(3, lastname);
////                pstmt.setString(4, address);
////                pstmt.setString(5, city);
////                pstmt.setString(6, state);
////                pstmt.setString(7, pin);
////                
////                pstmt.setString(8,country);
////                pstmt.setString(9, phno);
////                pstmt.setString(10, mail);
////                pstmt.setString(11, age);
////                pstmt.setString(12, gender);
////                pstmt.setString(13, bank);
////                pstmt.setString(14, account);
////                pstmt.setString(15, card_cetegory);
////                pstmt.setString(16, date);
////                pstmt.setString(17, amount);
////                pstmt.setString(18, username);
////                pstmt.setString(19, password);
//                 pstmt.setString(1, cardno);
//               
//                
//                
//                
//                
//                
//                
//                
//                pstmt.executeUpdate();
            
        
            
              PreparedStatement pstmt2 = con.prepareStatement("UPDATE registration SET bank_name = ?,account=?,card=?,expiry_date=? ,ammount =? ,card_no=? WHERE username=? ");
                pstmt2.setString(1, bank);
                pstmt2.setString(2,account);
                pstmt2.setString(3, card_cetegory);
                pstmt2.setString(4, date);
                pstmt2.setString(5, amount);
                pstmt2.setString(6, cardno);
                pstmt2.setString(7, username);
                pstmt2.executeUpdate();
            
            
            
            }
        %>
        <script>

            alert("PAYMENT GATEWAY COMPLETED");
            window.location = "display.jsp";

        </script>
    </body>
</html>
