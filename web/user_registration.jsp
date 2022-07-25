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
          <script>
              function name(){
    var textBox1 = document.getElementById("fname1");
       var textLength = textBox1.value.length;
       if(textBox1.value==='' || textLength<=2)
         {
          alert('Please enter correct name');
          
         }
}
              </script>
               <script>
function validateForm() {
    var x = document.forms["user"]["mail"].value;
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
        <div> <%@include file="user_header.jsp"%></div>
        <br><br>
        <br><br>
        <br>
        <br>
    <center><h2 style="color: green">REGISTRATION FOR USER</h2></center>>
        <hr style="color: black">
        <form name="user"  action="admin_insert.jsp" method="get">
           <center> <fieldset style="margin-left: 5%">
                   <legend>Registration Form</legend>
                   <input type="number" id="adhar"  name="virtual"  placeholder="Adhar Number" style="width: 25%" required=""/>
                     <br><br>
                            
                     <input type="text" id="fname1"  name="fname" onclick="return valid()"  placeholder="First Name" style="width: 25%" required=""><br><br>
                     
                     <input type="text"  name="lname" onclick=" return name()" placeholder="Last Name"  style="width: 25%" required><br>
                     <br>
                     <input type="text"  name="addr" placeholder="Address" class="textfeild1" style=" height: 100px;width: 25%" required>
                     <br><br>
                     <input type="text"  name="city" placeholder="City" style="width: 25%" required >
                     <br><br>
                     <input type="text"  name="state" placeholder="State" style="width: 25%" required>
                     <br><br>
                     <input type="number"  name="pin" placeholder="Pincode" style="width: 25%" required>
                     <br><br>
                     <input type="text"  name="country" placeholder="Country" style="width: 25%" required>
                     <br><br>
                     <input type="number"  name="phno" data-minlength="10" maxlength="10" placeholder="Mobile Number" style="width: 25%" required>
                     <br><br>
                     <input type="email"  name="mail" placeholder="E mail ID" style="width: 25%" required>
                     <br><br>
                     <input type="number"  name="age" onclick="validateForm()" placeholder="Age" style="width: 25%" required><br><br>
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
                                                            <input type="submit" value="Register" onclick="valid()" style="color: green;width: 10%;margin-left: 3%">
               </fieldset></center>
        </form>

        <div> <%@include file="footer.jsp"%></div>
    </body>
</html>
