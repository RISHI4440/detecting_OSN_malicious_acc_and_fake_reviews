<%-- 
    Document   : newjspdemo
    Created on : Sep 8, 2017, 10:45:57 AM
    Author     : sai
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="project_j48.J48"%>
<%@page import="project_evaluate.Cls_main"%>
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
            String confidence_factor1=request.getParameter("0.25");
            String min_object1=request.getParameter("1");
            String confidence_factor="0.25";
            String min_object="1";
            String path="D:\\Project\\OSN\\myUtility\\TrainDataset.arff";
            //String[] arg = {"-C", confidence_factor, "-M", min_object, "-t","D:\\Current Project\\KDDTest\\TEST 1.arff"};
           // String[] arg = {"-C", "0.25", "-M", "1", "-t", "D:\\Current Project\\KDDTrain\\New Text Document.arff"};
            String[] arg = {"-C", confidence_factor, "-M", min_object, "-t",path};
               System.out.println(Cls_main.m_evalM(new J48(), arg));
                 
//            PreparedStatement pstmt = con.prepareStatement("INSERT INTO decission_tree (records)  VALUES (?)");
//            pstmt.setString(1, s);
//            pstmt.executeUpdate();
//         
          response.sendRedirect("generate_tree.jsp");
        %>
    </body>
</html>
