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
function validateForm() {
    var x = document.forms["myForm"]["mail"].value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Not a valid e-mail address");
        return false;
    }
}
</script>
    </head>

    <body>
        <div> <%@include file="seller_header.jsp"%></div>
        <br><br>
        <br><br>
        <br>
        <h2 style="color: green">SELLER REGISTRATION</h2>
        <hr style="color: black">
        <form  name="myForm" action="reg_insert.jsp" method="post"  >
           <center> <table style="margin-left: 10%;width: 50%">

                <tr>
                    <td>First Name</td>
                    <td><input type="text"  name="fname"  style="width: 80%" required=""/> <br><br> </td>
                </tr>

                <tr>
                    <td>Last Name</td>
                    <td><input type="text"  name="lname"  style="width: 80%" required="" /><br><br>  </td>
                </tr>

                <tr>
                    <td>Address</td>
                    <td><input type="text"  name="addr"  style="width: 80%" required=""/><br><br>  </td>
                </tr>

                <tr>
                    <td>Email</td>
                    <td><input type="text"  name="mail"  style="width: 80%" required="" /><br><br>  </td>
                </tr>

                <tr>
                    <td>Phone NO</td>
                    <td><input type="number" onclick="return validateForm();" name="phno"  style="width: 80%" required="" /><br><br>  </td>
                </tr>

                <tr>
                    <td>Username</td>
                    <td><input type="text"  name="uname" style="width: 80%" required=""/> <br><br> </td>
                </tr>


                <tr>
                    <td>Password</td>
                    <td><input type="password"  name="pass" style="width: 80%" required=""/><br /><br><br>  </td>
                </tr>
                <tr>

                    <td colspan="2"><center><input type="submit" value="Register" style="width: 30%;margin-left:29%;height: 40px"></td>
                    <td></td>
                </tr>
               </table></center>
        </form>
              <script>
            function ValidateEmail(mail) 
{
 if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(myForm.emailAddr.value))
  {
    return (true)
  }
    alert("You have entered an invalid email address!")
    return (false)
}
            </script>
        <div> <%@include file="footer.jsp"%></div>
    </body>
</html>
