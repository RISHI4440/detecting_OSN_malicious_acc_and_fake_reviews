<%-- 
    Document   : recharge
    Created on : Sep 22, 2017, 9:49:38 AM
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
        <%@include file="user_header.jsp"%>
        <br><br>
        <br><br>
        <br><br>
        <br>
         

        <h2 style="color: green">RECHARGE YOUR MOBILE</h2>
        <hr>
        <br><br>

        <form action="recharge_insert.jsp" method="post">
            <table style="margin-left: 3%;width: 20%">

                <tr>
                    <td>RECHARGE TYPE:</td>
                    <td style="width: 30%"><select  name="type" class="textfeild1" style="width: 170%" >
                            <option value="#">Airtel</option>
                            <option value="#">Vodafone</option>
                            <option value="#">IDEA</option>
                            <option value="#">Reliance-Jio</option>
                            <option value="#">Uninor</option>
                            <option value="#">Tata-Docomo</option>
                        </select> </td>
                </tr>
                <tr>
                    <td>Amount:</td>
                    <td>
                        <input type="text" name="ammount" style="width: 170%">
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>    
                <tr><td><input type="submit" value="RECHARGE" style="margin-left: 50%"></td></tr>

            </table>

        </form> 
          <hr>
        <%@include file="footer.jsp"%>

    </body>
</html>
