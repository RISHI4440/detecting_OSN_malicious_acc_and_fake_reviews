<%@page import="java.sql.ResultSet"%>
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
        <div> <%@include file="admin_header.jsp"%></div>
        <br><br>
        <br>
        <h1>REGISTRATION FOR USER</h1>
        <hr style="color: black">
        <form action="user_insert.jsp" method="get"  >
            <fieldset style="margin-left: 3%">
                <%
                    String virtual = request.getParameter("virtual");
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
                        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM registration where virtual=?");
                        pstmt.setString(1, virtual);
                        ResultSet rs = pstmt.executeQuery();
                        if (rs.next()) {


                %>
              <center>  <table style="width: 50%">
                  <tr> 
                      <td>Adhar Number</td>
                      <td><input type="text"  name="virtual"  style="width: 50%" value="<%= rs.getString(1)%>" ></td>
                </tr>
                <tr>
                       <td>First Name</td>
                       <td>  <input type="text"  name="fname"  style="width: 50%" value="<%= rs.getString(2)%>"></td>
                  </tr>
                    <tr>
                        <td>Last Name</td>
                        <td> <input type="text"  name="lname"   style="width: 50%" value="<%= rs.getString(3)%>"></td>
                    </tr>
               
                    <tr>
                    <td>Address</td>
                    <td> <input type="text"  name="addr"  class="textfeild1" style=" height: 50px;width: 50%" value="<%= rs.getString(4)%>"></td>
                    </tr>
                  
                <tr> 
                    <td>City</td>
                    <td><input type="text"  name="city"  style="width: 50%" value="<%= rs.getString(5)%>"></td>
                </tr>
                <tr>
                    <td>State</td>
                <td><input type="text"  name="state"  style="width: 50%" value="<%= rs.getString(6)%>"></td>
                </tr>
                <tr>
                    <td>Pin Code</td>
                    <td> <input type="text"  name="pin"  style="width: 50%" value="<%= rs.getString(7)%>"></td>
                </tr>
                
                
                
                <tr>
                    <td>Country</td>
                    <td> <input type="text"  name="country"  style="width: 50%" value="<%= rs.getString(8)%>"></td>
                </tr>
                <tr>
                    <td>Mobile Number</td>
                    <td> <input type="text"  name="phno"  style="width: 50%" value="<%= rs.getString(9)%>"></td>
                </tr>       
               
                <tr>
                    <td>Mail</td>
                    <td><input type="email"  name="mail" style="width: 50%" value="<%= rs.getString(10)%>"></td>
                </tr>
                
                
                <tr>
                    <td>Age</td>
                    <td><input type="text"  name="age" style="width: 50%" value="<%= rs.getString(11)%>"></td>
                </tr>

                 <tr>
                     <td>Gender</td>
                     <td><input type="text"  name="gender"  style="width: 50%" value="<%= rs.getString(12)%>"></td>
                </tr>
               
                <tr>
                    <td>User Name</td>
                    <td> <input type="text"  name="username"  style="width: 50%" required="" ></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="text"  name="password"  style="width: 50%" required=""></td>
                </tr>

                <tr>    
                    <td> <input type="submit" value="Save"></td>
                </tr>

                  </table></center>>
            </fieldset>
       
        <%} else {
        %>
        <script>
            alert("Adhar Number is invalid");
            window.location = "login_1.jsp";
        </script>
        <%
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>
 </form>



        <div> <%@include file="footer.jsp"%></div>
    </body>
</html>
