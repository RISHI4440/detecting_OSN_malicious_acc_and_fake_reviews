<%-- 
    Document   : final_intimation
    Created on : Sep 15, 2017, 3:48:50 PM
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
        <%@include file="user_header.jsp"%>
        <form action ="payment_done.jsp" method="post">
           
            <br><br>
            <br><br><br>
            
            <%
                String total = request.getParameter("total");
                System.out.println("RECHARGE"+total);
                int current=Integer.parseInt(total);
                
                if(total.equals("150"))
                {
                  response.sendRedirect("fake_final_intimation.jsp?total=" + total);
                
                }    
                if(total.equals("200"))
                {
                  response.sendRedirect("fake_final_intimation.jsp?total=" + total);
                
                }
                 if(total.equals("300"))
                {
                  response.sendRedirect("fake_final_intimation.jsp?total=" + total);
                
                }
                
                String username = request.getParameter("username");
                 System.out.println("USERNAME"+username);
                 session.setAttribute("username1", username);
                
                 String cardnumber = request.getParameter("cardnumber");
                System.out.println("Card Number"+cardnumber);
                session.setAttribute("cardnumber1", cardnumber);
                
                String ammount = request.getParameter("ammount");
                 System.out.println("ammount"+ammount);
                  int bal=Integer.parseInt(ammount); 
                  session.setAttribute("ammount1", ammount);

                  int bal_curr = bal-current;;
                  System.out.println("bal_caurr"+bal_curr);



            %>
            
            
            
            
            <h1>Total  Price</h1>
            <hr>
            <h3 style="color: green;margin-left: 2%">Your total selection Price is: <%=total%></h3>
            <br>
            <br>
            <fieldset style="margin-left: 3%">
                User Name:
                &nbsp;  &nbsp;&nbsp; &nbsp;   &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<input type="text"  name="username"  style="width: 20%;margin-left:2%" value="<%=username%>">

                &nbsp;  Card Number:
                <input type="text"  name="cardnumber"  style="width: 20%;margin-left:2%" value="<%=cardnumber%>">
                <br>
                <br>
                Amount of Selection:
                &nbsp; <input type="text"  name="total"  style="width: 20%;margin-left:2%" value="<%=total%>">

                &nbsp;&nbsp;  Balance:
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="balance"  style="width: 20%;margin-left:2%" value="<%=ammount%>">
                <br>
                <br>
<%               
//                    String card = request.getParameter("cardnumber");
//                    System.out.println("card"+card);
//                    int c = Integer.parseInt(request.getParameter("ammount"));
//                    System.out.println("C" +c);
//                    int d = Integer.parseInt(request.getParameter("total"));
//                    System.out.println("D" +d);
//                    int o = c - d;
                   // System.out.println("DIFFERENCE"+o);
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
                    PreparedStatement pstmt = con.prepareStatement("UPDATE registration SET ammount=? WHERE  card_no=?");
                   pstmt.setInt(1, bal_curr);
                   pstmt.setString(2, cardnumber);
                    pstmt.executeUpdate();


                %>
                                  
<!--                  String product_id = session.getAttribute("product_id").toString();
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
                    PreparedStatement pstmt1 = con1.prepareStatement("insert into transaction value(?,?,?,?,?)");
                    pstmt1.setString(1,product_id);
                    pstmt1.setString(2,username);
                    pstmt1.setString(3, cardnumber);
                    pstmt1.setString(4, total);
                    pstmt1.setString(5, ammount);
                    pstmt1.executeUpdate();-->

                   <%
                         
                   
                   
                   
                   
                   
                   
                   
                   %>               








                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <input type="submit" value="Done" style="margin-left: 15%;color: green;width: 15%">

            </fieldset>           

        </form>


        <div><%@include file="footer.jsp"  %></div>             

    </body>
</html>
