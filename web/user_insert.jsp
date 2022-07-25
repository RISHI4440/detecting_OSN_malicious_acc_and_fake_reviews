<%-- 
    Document   : admin_insert
    Created on : Sep 13, 2017, 11:29:26 AM
    Author     : sai
--%>

<%@page import="java.sql.Statement"%>
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
            String virtual = request.getParameter("virtual");
            session.setAttribute("virtual", virtual);
            
            String firstname = request.getParameter("fname");
            session.setAttribute("firstname", firstname);
            
            String lastname = request.getParameter("lname");
            session.setAttribute("lastname", lastname);
            
            String address = request.getParameter("addr");
             session.setAttribute("address", address);
            
            String city = request.getParameter("city");
            session.setAttribute("city", city);
            
            String state = request.getParameter("state");
             session.setAttribute("state", state);
            
            String pin = request.getParameter("pin");
             session.setAttribute("pin", pin);
                        
            String country = request.getParameter("country");
             session.setAttribute("country", country);
           
            String phno = request.getParameter("phno");
             session.setAttribute("phno", phno);
           
            String mail = request.getParameter("mail");
             session.setAttribute("mail",mail);
           
            String age = request.getParameter("age");
             session.setAttribute("age",age);
           
            String gender = request.getParameter("gender");
             session.setAttribute("gender",gender);
            
            String bank = request.getParameter("bank");
            String account = request.getParameter("account");
            String card_cetegory = request.getParameter("card_cetegory");
            String date = request.getParameter("date");
            String ammount = request.getParameter("ammount");
            String cardno = request.getParameter("cardno");
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            session.setAttribute("paswword",password);
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");

            PreparedStatement pstmt1 = con.prepareStatement("delete from  registration where virtual=?");
            pstmt1.setString(1, virtual);
            pstmt1.executeUpdate();
            
            
            
            PreparedStatement pstmt = con.prepareStatement("insert into registration value (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);

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
            
            /*}
            catch(Exception e)
            {
                System.out.println("Exception "+e);
            }*/
            %>
            <script>
                
                alert("Register Successfull");
                window.location="login_1.jsp";
                             
            </script>>
    </body>
</html>
