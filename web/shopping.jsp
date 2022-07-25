<%-- 
    Document   : non_missing
    Created on : Sep 10, 2017, 3:50:37 PM
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
            table, th, td {  
                border: 2px solid black;  
                border-collapse: collapse;  
            }  
        </style>  
    </head>
    <body>
        <div> <%@include file="user_header.jsp"%></div>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
         <br><br>
        <form action="shopping_intimation.jsp" method="post">       
        <div class="content">
            <div class="content_bottom">

                <div class="feature_list">
                    <h2>SELECTED ITEM DETAILS </h2> 
                    <table style="margin-left: 3%;height: 50%;width: 70%">

                        <tr>

                            <th>PRODUCT ID</th>
                            <th>PRODUCT NAME</th>
                            <th>PRODUCT PRICE</th>



                        </tr>
                        <%
                            String total = null;
                            //String a=session.getAttribute("product").toString();
                            String a = request.getParameter("product").toString();

                            int i = 0;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
                            PreparedStatement p = conn.prepareStatement("select * from malitious where id=?");
                            p.setString(1, a);
                            ResultSet rs = p.executeQuery();
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                        </tr>



                        <%          
                                 session.setAttribute("product_id", rs.getString(1));
                                total = rs.getString(3);

                            }
                        %>
                        <input type="hidden" name="total" value="<%=total%>">


                    </table>
                    <h1>Total  Price</h1>
                    <h3 style="color: green;margin-left: 2%">Your total selection Price is: <%= total%></h3>
                    <br>
                    <br>
                </div>

            </div>
        </div>

        <div class="content">
            <div class="content_bottom">

                <div class="feature_list">
                    <h2>SELECTED ITEM DETAILS </h2> 



                    <%
                        String b = session.getAttribute("username").toString();
                        String c = session.getAttribute("pass").toString();
                        String b1 = null;

                        String b2 = null;
                        String b3 = null;
                        String b4 = null;
                        String b5 = null;
                         String b6 = null;
                       

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
                        PreparedStatement p1 = conn1.prepareStatement("select username,card_no,bank_name,card,account,ammount from registration where username=? and password=?");
                        p1.setString(1, b);
                        p1.setString(2, c);
                        ResultSet rs1 = p1.executeQuery();
                        while (rs1.next()) {
                    %>
                    

                    <%
                            b1 = rs1.getString(1);
                            b2 = rs1.getString(2);
                            b3 = rs1.getString(3);
                            b4 = rs1.getString(4);
                            b5 = rs1.getString(5);
                            b6 = rs1.getString(6);
                           
                        }
                    %>
                    
                     
                    <fieldset style="margin-left: 3%">
                      User Name:
                      &nbsp;&nbsp; &nbsp;<input type="text"  name="username"  style="width: 20%;margin-left:2%" value="<%=b1%>">
                      <br>
                      <br>
                       Card Number:
                      <input type="text"  name="cardnumber"  style="width: 20%;margin-left:2%" value="<%=b2%>">
                      <br>
                      <br>
                       Bank Name:
                     &nbsp;&nbsp;&nbsp;<input type="text"  name="bankname"  style="width: 20%;margin-left:2%" value="<%=b3%>">
                      <br>
                      <br>
                       Card Type:
                      &nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="cardtype"  style="width: 20%;margin-left:2%" value="<%=b4%>">
                      <br>
                      <br>
                      
                      <input type="hidden"  name="ammount"  style="width: 20%;margin-left:2%" value="<%=b6%>">
                      <br>
                      <input type="submit" value="Make Payment"style="margin-left: 7%">
                      
                    </fieldset>
                    
                      
                      

                </div>

            </div>
        </div>        
    </table>





</body>
</html>
