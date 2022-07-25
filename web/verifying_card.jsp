<%-- 
    Document   : verifying_card
    Created on : Sep 15, 2017, 9:38:04 AM
    Author     : sai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script>
       function valid()
{      var textBox = document.getElementById("adhar");
       var textLength = textBox.value.length;
       if(textBox.value==='' || textLength<=11)
         {
          alert('Adhar Number Must be 12 Digit');
          
         }
        
       }
     </script>
    </head>
    <body>
        <div><%@include file="user_header.jsp"%></div>
        <br><br>
         <br><br>
           <br><br>
           
         <center> <h2 style="color: green">VERIFYING USER</h2>
           <hr>
        <form action ="detecting.jsp" method="get">
           <center> <fieldset style="margin-left: 5%">
            <%

                String uname = session.getAttribute("username").toString();
                
            %>
            User Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="username" class="textfeild1" value="<%= uname%>"/>
            <br>
            <br>
            Adhar Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="adhar" name="virtual"/>
            <br><br>
            City :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" onclick="return valid()" name="city">
            <br><br>
             Pin Code :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="pin">
            <br><br>
            <input type="submit" value="Verify">

            </fieldset>
        </form>
            <br><br>
            <br><br>
            <br>
            <hr>
            <div>
                <%@include file="footer.jsp"%>
            </div>
    </body>
</html>
