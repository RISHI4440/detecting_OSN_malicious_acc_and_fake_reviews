<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/slider.css" rel="stylesheet" type="text/css" media="all"/>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js" ></script>
        <script src="http://malsup.github.com/jquery.form.js" ></script>
        <script src="js/fileUploadScript.js" ></script>
        <!-- Include css styles here -->
        <!--      <link href="css/style.css" rel="stylesheet" type="text/css" />-->

        <script>
            $(document).ready(function () {
                var options = {
                    beforeSend: function () {
                        $("#progressbox").show();
                        // clear everything
                        $("#progressbar").width('0%');
                        $("#message").empty();
                        $("#percent").html("0%");
                    },
                    uploadProgress: function (event, position, total, percentComplete) {
                        $("#progressbar").width(percentComplete + '%');
                        $("#percent").html(percentComplete + '%');

                        // change message text to red after 50%
                        if (percentComplete > 50) {
                            $("#message").html("<font color='red'>File Upload is in progress</font>");
                        }
                    },
                    success: function () {
                        $("#progressbar").width('100%');
                        $("#percent").html('100%');
                    },
                    complete: function (response) {
                        $("#message").html("<font color='blue'>Your file has been completely trained</font>");
                    },
                    error: function () {
                        $("#message").html("<font color='red'> ERROR: unable to upload files</font>");
                    }
                };
                $("#UploadForm").ajaxForm(options);
            });





        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div> <%@include file="demo_header.jsp"%></div>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
         <br><br>
         <hr>
        
        <h1>GENERATING DICISSION TREE</h1>
        <hr>
        <form id="UploadForm" action="newjspdemo.jsp" method="get"  enctype="multipart/form-data">
                            <table style="margin-left: 30%;margin-top: 10%;height: 50%">
                                <td><img src="img/tree.png" style="margin-left: 25%;margin-top:-45%;height: 150%"></td>
                                <br>
                                <tr><td><input type="file" size="60" id="myfile" name="myfile" multiple="true" required=""/></td> 
                                <tr><td> <div id="progressbox"></td></tr>
                                <tr><td> <div id="progressbar"></div></td>
                                     <td> <div id="percent"></div></td></tr>
                                </div
                                <td><div id="message"></div></td>
                                <tr>
               <td>
               </td>                
      <tr>
                <td>Confidence Factor</td>
                <td><select name="sele"  style="width: 200%; height: 150%">
                        <option>--choose--</options>
                        <option>0.25</options>
                        <option>0.20</options>
                        <option>0.15</options>
                        <option>0.10</options>
                        <option>0.5</options>
                    </select></td></tr>
      
                <tr>
                 
                <td>Min Number Of Object </td>
                <td> <select name="sele1"  style="width: 200%;">
                        <option>--choose--</options>
                        <option>1</options>
                        <option>2</options>
                        <option>3</options>
                        <option>4</options>
                        <option>5</options>
                    </select></td>    </tr>   
          
                    <tr><td> <input type="submit" style="width: 48%;margin-left: 100%"value="Generate Decission Tree"></td><tr>
            </table>
        </form>
        <br><br>
        <br>
        <%@include file="footer.jsp" %>
    </body>
</html>
