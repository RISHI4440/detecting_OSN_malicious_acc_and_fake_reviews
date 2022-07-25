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
        <div> <%@include file="result_header.jsp"%></div>
        <br><br>
        <br><br>
        <br><br>
        <br><br>

        <div class="content">
            <div class="content_bottom">

                <div class="feature_list">
                    <h2>LEVEL 4 RESULTS </h2> 
                    <table style="margin-left: 1%;height: 50%; width: 100%">

                        <tr>

                            <th>TRAINED PATH</th>
                            <th>TRAINED DATA</th>
                            <th>TEST PATH



                        </tr>
                        <%
                            //String a=request.getParameter("product").toString();
                            int i = 0;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
                            PreparedStatement p = conn.prepareStatement("select * from file3");
                            //p.setString(1, request.getParameter("name"));
                            ResultSet rs = p.executeQuery();
                            while (rs.next()) {
                        %>
                        
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                        

                        <%

                            }
                        %>


                </div>

            </div>
        </div>
    </body>
</html>
