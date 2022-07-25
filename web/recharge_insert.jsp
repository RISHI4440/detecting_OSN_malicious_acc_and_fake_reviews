<%-- 
    Document   : recharge_insert
    Created on : Sep 22, 2017, 9:59:51 AM
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
    </head>
    <body>
        <%@include file="user_header.jsp"%>
        <br><br>
        <br><br>
        <form action="recharge_final_intimation.jsp" method="post">
       <%
              String recharge=request.getParameter("ammount");
              
              %>
              <input type="hidden" name="total" value=<%=recharge%> 
              
               <div class="content">
            <div class="content_bottom">

                <div class="feature_list">
                    <h2 style="color: green;margin-left: 1%">SELECTED ITEM DETAILS </h2> 
                    <hr>


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
                      <input type="submit" value="Make Payment" style="margin-left: 7%;color: green">
                      
                    </fieldset>
                    
                      
                      

                </div>

            </div>
               </div>
                        
        </form>
                      <%@include file="footer.jsp"%>
    </body>
</html>
