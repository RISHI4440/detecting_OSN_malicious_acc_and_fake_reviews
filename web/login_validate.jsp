<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String uname = request.getParameter("username");
    String pass = request.getParameter("pass");
    String type = request.getParameter("type");
   session.setAttribute("username", uname);
    session.setAttribute("username", uname);
     session.setAttribute("pass", pass);
  if(type.equals("seller")){
  
  Connection con = db.Connect.getConnection();
        PreparedStatement pstmt = con.prepareStatement("SELECT uname,pass FROM user WHERE uname=? AND pass=?");
        pstmt.setString(1, uname);
        pstmt.setString(2, pass);
        ResultSet rs = pstmt.executeQuery();
        session.setAttribute("uname", uname);
        if (rs.next()) {
        %>
        <script>
            
        alert("Login Successfull");
        window.location="seller_product.jsp";
        
        </script>
            
  
  
  <%}
else{%>
     <script>
            
        alert("Login Failed");
        window.location="login_1.jsp";
        
        </script>


       
<%}}     
     
  if (type.equals("admin")) {

        if (uname.equals("admin") && pass.equals("admin")) {

%>
<script>
    alert("LOGIN SUCCESSFULL");
    window.location = "main_admin.jsp";
</script>
<%} else {
%>
<script>
    alert("Login Failed");
    window.location = "login_1.jsp";
</script>
<%
    }

} else if (type.equals("user")) {

    try {

        Connection con1 = db.Connect.getConnection();
        PreparedStatement pstmt1 = con1.prepareStatement("SELECT username,password FROM registration WHERE username=? AND password=?");
        pstmt1.setString(1, uname);
        pstmt1.setString(2, pass);
        ResultSet rs1 = pstmt1.executeQuery();
        session.setAttribute("uname", uname);
        if (rs1.next()) {


%>
<script>
    alert("LOGIN SUCCESSFULL");
    window.location = "verifying_card.jsp";
</script>
<%    pstmt1.close();
    con1.close();

} else {

%>
<script>
    alert("LOGIN FAILED");
    window.location = "login_1.jsp";
</script>

<%  
    
       session.setAttribute("username",uname);
        }

    } catch (Exception ex) {

        ex.printStackTrace();
    }

} 
%>
