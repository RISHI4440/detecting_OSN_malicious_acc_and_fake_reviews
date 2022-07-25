<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>JSP Page</title>
         
    </head>
    <body>
        <div> <%@include file="admin_header.jsp"%></div>
        <br><br>
        <br><br>
        <br><br>
        <br><br>


        <div class="content">
            <div class="content_bottom">

                <div class="feature_list">
                    <center> <h2 style="color: green">USER LIST </h2> </center>
                    <hr>
                    <!--                    <table style="margin-left: 1%;height: 50%">-->
                    <center><table border="2px" style="width: 90%;height: 250%;margin-left: 5%">
                        <tr>

                        <tr>
                            <th style="height:50px;text-align: center">Sr no.</th>
                            <th style="height:50px;text-align: center">Adhar Number</th>
                            <th style="height:50px;text-align: center">First Name</th>
                            <th style="height:50px;text-align: center">Last Name</th>
                            <th style="height:50px;text-align: center"> Email </th>
                            <th style="height:50px;text-align: center"> Card No </th>
                            <th style="height:50px;text-align: center"> Account No </th>
                           <th style="height:50px;text-align: center"> Operation </th>



                        </tr>



                         <%
                            int k = 1;
                            int i = 0;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
                            PreparedStatement p = conn.prepareStatement("select * from registration");
                            //p.setString(1, request.getParameter("name"));
                            ResultSet rs = p.executeQuery();

                            while (rs.next()) {
                               session.setAttribute("virtual",rs.getString(1));
                                 
                        %>
                        <tr>
                            <td style="height:50px;text-align: center"><%=k%></td>
                            <td style="height:50px;text-align: center"><%=rs.getString(1)%></td>
                            <td style="height:50px;text-align: center"><%=rs.getString(2)%></td>
                            <td style="height:50px;text-align: center"><%=rs.getString(3)%></td>
                            <td style="height:50px;text-align: center"><%=rs.getString(10)%></td>
                            <td style="height:50px;text-align: center"><%=rs.getString(20)%></td>
                            <td style="height:50px;text-align: center"><%=rs.getString(14)%></td>
                            <td style="height:50px;text-align: center"><a href="delete_user.jsp?registration=<%= rs.getString(1)%>">delete</a></td>-->
                        </tr>

                        <%
                                k++;
                            }
                        %>

                        </table></center>
                </div>

            </div>
        </div>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <div><%@include file="footer.jsp" %></div>
    </body>
</html>
