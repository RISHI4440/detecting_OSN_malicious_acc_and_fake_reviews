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
         
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 100px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
        
    </head>
    <body>
        <div> <%@include file="admin_header.jsp"%></div>
        <br><br>
        <br><br>
        <br><br>
            <div class="content">
            <div class="content_bottom">
                <div class="feature_list">
                    <center> <h2 style="color: green">CUSTOMER COMPLAINT LIST </h2>                                      
                     <table border="2px" style="width: 90%; height: 250%; margin-left: 5%">
                           <tr>
                            <th style="height:50px;text-align: center"> PRODUCT ID </th>
                            <th style="height:50px;text-align: center"> PRODUCT NAME </th>
                            <th style="height:50px;text-align: center"> USER NAME  </th>
                            <th style="height:50px;text-align: center"> COMPLAINT  </th>
                            <th style="height:50px;text-align: center"> CARD NUMBER</th>
                            <th style="height:50px;text-align: center"> DATE       </th>
                            <th style="height:50px;text-align: center"> OPERATION  </th>
                        </tr>
                     
                        <%
                            int k = 1;
                            int i = 0;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
                            PreparedStatement p = conn.prepareStatement("select * from complain");
                            //p.setString(1, request.getParameter("name"));
                            ResultSet rs = p.executeQuery();

                            while (rs.next()) {
                                session.setAttribute("product_id",rs.getString(1));
                        %>
                        <tr>
                            <td style="height:50px;text-align: center"><%=rs.getString(1)%></td>
                            <td style="height:50px;text-align: center"><%=rs.getString(2)%></td>
                            <td style="height:50px;text-align: center"><%=rs.getString(3)%></td>
                            <td style="height:50px;text-align: center"><%=rs.getString(4)%></td>
                            <td style="height:50px;text-align: center"><%=rs.getString(5)%></td>
                            <td style="height:50px;text-align: center"><%=rs.getString(6)%></td>
                            <td style="height:50px;text-align: center"><a class="hvr-outline-out button2" href="delete.jsp?malitious=<%=rs.getString(1)%>">REMOVE PRODUCT</a></td>
                        </tr>

                        <%
                                k++;
                            }
                        %>

                    </table>
                </div>

            </div>
        </div>
          <br><br><br>    
          <br><br><br> <br><br><br> <br><br>
          <%@include file="footer.jsp" %>
    </body>
    
</html>
