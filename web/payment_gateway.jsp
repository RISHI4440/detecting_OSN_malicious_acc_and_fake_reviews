<%-- 
    Document   : admin_registration
    Created on : Sep 13, 2017, 10:27:17 AM
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
{      var textBox = document.getElementById("cardno");
       var textLength = textBox.value.length;
       if(textBox.value==='' || textLength<=11)
         {
          alert('Card Number Must be 12 Digit');
          
         }
         
       
         
}
       </script>
         
    </head>

    <body>
        <div> <%@include file="user_header.jsp"%></div>
        <br><br>
        <br><br>
        <br>
       <center> <h2 style="color: green">PAYMENT GATEWAY</h2>
        <hr style="color: black">
        <form action="payment_insert.jsp" method="get"  >
            <fieldset style="margin-left: 5%">

                <input type="text" id="cardno" name="cardno" placeholder="CREDIT CARD NUMBER" style="width: 25%" required>
                <br><br>
                <input type="text"  name="bank" onclick="return valid()" placeholder="BANK NAME" style="width: 25%" required><br>
                <br>
                <input type="text" id="account"  name="account" placeholder="ACCOUNT NUMBER" style="width: 25%" required><br>
                <br>
                <select name="card_cetegory"  style="width: 25%">
                    <option  value="VISA">VISA</option>
                    <option  value="MASTER">MASTER</option>
                </select><br><br>
                <input type="date"  name="date" placeholder="EXPIRY DATE" style="width: 25%" required><br>
                <br>
                <input type="text"  name="ammount" placeholder="AMMOUNT" style="width: 25%" required><br>
                <br>
                <input type="submit"  value="Register" style="color: green;width: 20%;margin-left: 3%">

            </fieldset>
        </form>
        <br><br><br> <br>
        <div> <%@include file="footer.jsp"%></div>
    </body>
</html>
