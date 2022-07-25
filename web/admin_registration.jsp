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
        <title>Registration</title>
    </head>

    <body>
        <div> <%@include file="admin_header.jsp"%></div>
        <br><br>
        <br><br>
        <br>
        <br>
    <center><h2 style="color: green">REGISTRATION FOR USER</h2></center>>
        <hr style="color: black">
        <form action="admin_insert.jsp" method="get">
           <center> <fieldset style="margin-left: 5%">
                   <legend>Registration Form</legend>
                <input type="text"  name="virtual" placeholder="Virtual Account Number" style="width: 25%" required>
                     <br><br>
                            
                     <input type="text"  name="fname" placeholder="First Name" style="width: 25%" required><br><br>
                     
                     <input type="text"  name="lname" placeholder="Last Name"  style="width: 25%" required><br>
                     <br>
                     <input type="textarea"  name="addr" placeholder="Address" class="textfeild1" style=" height: 100px;width: 25%" required>
                     <br><br>
                     <input type="text"  name="city" placeholder="City" style="width: 25%" required >
                     <br><br>
                     <input type="text"  name="state" placeholder="State" style="width: 25%" required>
                     <br><br>
                     <input type="text"  name="pin" placeholder="Pincode" style="width: 25%" required>
                     <br><br>
                     <input type="text"  name="country" placeholder="Country" style="width: 25%" required>
                     <br><br>
                     <input type="text"  name="phno" placeholder="Mobile Number" style="width: 25%" required>
                     <br><br>
                     <input type="email"  name="mail" placeholder="E mail ID" style="width: 25%" required>
                     <br><br>
                     <input type="text"  name="age" placeholder="Age" style="width: 25%" required><br><br>
                     Gender <input type="radio" name="gender" value="Male">Male 
                     <input type="radio" name="gender" value="Female" >Female<br><br>
                     
<!--                <input type="text"  name="bank" placeholder="BANK NAME" style="width: 16%" required><br>
                     <br>
                      <input type="text"  name="account" placeholder="ACCOUNT NUMBER" style="width: 16%" required><br>
                     <br>
                     <select name="card_cetegory" style="width: 16%">
                     <option  value="VISA">VISA</option>
                      <option  value="MASTER">MASTER</option>
                     </select><br><br>
                     <input type="date"  name="date" placeholder="EXPIRY DATE" style="width: 16%" required><br>
                     <br>
                     <input type="text"  name="ammount" placeholder="AMMOUNT" style="width: 16%" required><br>
                     <br>

                                                            -->
                    <input type="submit" value="Register" style="color: green;width: 10%;margin-left: 3%">
               </fieldset></center>
        </form>

        <div> <%@include file="footer.jsp"%></div>
    </body>
</html>
