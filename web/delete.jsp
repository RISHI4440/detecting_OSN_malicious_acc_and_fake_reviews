<%-- 
    Document   : delete
    Created on : Sep 20, 2017, 12:18:12 PM
    Author     : sai
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
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

            String id = session.getAttribute("product_id").toString();
                      
            System.out.println("get ID"+id);
            String name = session.getAttribute("product_name").toString();
            String price = session.getAttribute("price").toString();
            String mal = request.getParameter("malitious");
            String content = id + "," + name + "," + price;
            System.out.println("CONTENT " + content);
            String filename = "E:filename.txt";
            String FILENAME = "E:filename.txt";
        
            BufferedWriter bw = null;
            FileWriter fw = null;
            BufferedReader br = null;
            FileReader fr = null;
            
            //Code for write file
            fw = new FileWriter(filename);
            bw = new BufferedWriter(fw);
            bw.write(content);
            bw.close();
            fw.close();
            System.out.println("Done");

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
             try {

                    //br = new BufferedReader(new FileReader(FILENAME));
                    fr = new FileReader(FILENAME);
                    br = new BufferedReader(fr);

                    String sCurrentLine;

                    while ((sCurrentLine = br.readLine()) != null) {
                       // System.out.println(sCurrentLine);
                    
                    String a= sCurrentLine;
                    System.out.println("AAAA"+a);
                     PreparedStatement pst = con.prepareStatement("Select files_data from file3");
                     ResultSet rs = pst.executeQuery();

                     while (rs.next()) {
                     String b= rs.getString(1);
                     System.out.println("BB"+b);
                      if(a.equalsIgnoreCase(b)){
                      
                        System.out.println("FOUND");
                      PreparedStatement pstmt1 = con.prepareStatement("UPDATE file3 SET  same_data=? WHERE files_data=?");
                      pstmt1.setString(1, "MALITIOUS");
                      pstmt1.setString(2,a);
                      pstmt1.executeUpdate();
                      
                     }
                                       
                     }
                    
                    }
                } catch (IOException e) {

                    e.printStackTrace();

                }
            PreparedStatement pstmt = con.prepareStatement("DELETE FROM image1 WHERE id=?");
            pstmt.setString(1, mal);
            pstmt.executeUpdate();

            PreparedStatement pstmt1 = con.prepareStatement("DELETE FROM complain WHERE id=?");
            pstmt1.setString(1, mal);
            pstmt1.executeUpdate();
            response.sendRedirect("complain_viewer.jsp");


        %>
        <
    </body>
</html>
