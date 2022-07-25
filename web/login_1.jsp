<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <div> <%@include file="header.jsp"%></div>
         <div style="border: solid; border-color: #00bcd4; width: 50%;height: 50%;margin-left: 25%;margin-top: 15%"> 
         
        <div>         
          
            <center><h1 class="h1">Login  Form</h1></center>
            <HR>
            <BR>
            <form action="login_validate.jsp" method="post"  >
                
                <center><table style="margin-left: 5%">
                    <tr>
                        <td>User Type </td>
                        <td style="width: 50%"><select  name="type"  style="width: 80%">
                                <option value="admin">Admin</option>
                                <option value="user">User</option>
                                <option value="seller">Seller</option>
                            </select><br><br> </td>
                    </tr>
                    <tr>  </tr>
                    <tr>
                                        
                        <td>User Name:</td>
                        <td><input type="text"  name="username" placeholder="User Name" style="width: 80%" >
                        <br>
                        <br></td></tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password"  name="pass" placeholder="Password" style="width: 80%">
                        <br>
                        <br></td>
                        </tr>                                  
                    <tr>
                        <td colspan="2"> <input type="submit" name="login" class="button1"  value="login" style="width: 40%;margin-left:50%;height: 40px"/></td>

                        <td></td>
                    </tr>
                </table>
            </form>
                </div>
            <br> <br>
            <br>             
            
            <div>
            <form action="user_signup.jsp" method="get" style="margin-left: 4%">
               <center> <table style="margin-left: 2%;margin-top: 5%">
                  <tr>
                  <input type="number" placeholder="Adhar Verification" name="virtual" style="width: 50%" pattern="[0-9]+"> 
                    <input type="submit" name="sigh_up" class="button1" style="margin-left: 2%;width: 20%" value="Sign Up" />
                </tr>
                   </table></center>
                
            </form>
            </div>
         </div>
        
        <div> <%@include file="footer.jsp"%></div>
    </body>

</html>
