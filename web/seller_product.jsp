<%-- 
    Document   : index
    Created on : Sep 20, 2017, 9:34:22 AM
    Author     : sai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="seller_header.jsp"%>
        <br><br>
         <br><br>
          <br><br>
           
    <center> <h1>SELLER PRODUCT INSERTION</h1></center>
              <hr>
            
           
        <form name="f1" method="post" action="main.jsp">
            <center><table style="width: 70%;height: 70%;margin-left:3%">
                <tr><td>Product Id:</td><td><input type="text" name="id" required=""><br><br></td></tr>
                <tr> <td>Product Name:</td><td><input type="text" name="name" style="height: 20%" required=""><br><br></td></tr>
                <tr><td>Price:</td><td><input type="text" name="price" required=""><br><br></td></tr>
                <td>Select file:</td><td><input type="file" name="file1" required=""><br><br></td>
                <tr><td> </td> <td> <input type="submit" value="Insert"> </td> </tr>             
            </table> 
        </form>
        <%@include file="footer.jsp"%>    
    </body>
</html>
