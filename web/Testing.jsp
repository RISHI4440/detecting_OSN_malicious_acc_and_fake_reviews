<%-- 
    Document   : Testing
    Created on : Sep 10, 2017, 12:50:20 PM
    Author     : sai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
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
    </head>
    <body>
        <div> <%@include file="demo_header.jsp"%></div>
        <hr>
        <br><br>
        <br><br>
        <h1>TESTING DATASETS</h1>
        <hr>
        <div class="content">
            <div class="content_bottom">

                <div class="feature_list">

                    <form id="UploadForm" action="upload_page.jsp" method="post"  enctype="multipart/form-data">
                        <table style="margin-left: 30%;margin-top: 15%;height: 50%">
                            <td><img src="img/images.jpg" style="margin-left: 25%;margin-top:-45%;height: 150%"></td>
                            
                            <tr><td><input type="file" id="myfile" name="file" /></td> 
                            <td><input type="submit" value=" File Upload"></td></tr>
                            
                            <tr><td> <div id="progressbox"></td></tr>
                            <tr><td> <div id="progressbar"></div></td>
                                <td> <div id="percent"></div></td></tr>
                                                       <!--                            <input type="text" style="width: 60%;height:70%"> --><br />
                            <td><div id="message"></div></td>
                            <!--                    <tr> <td><a href="header.jsp" style="margin-left: 25%">  Click here to Move Back</a></li></td><tr>-->
                        </table>

                    </form>


                </div>

            </div>
        </div>
        <br><br>
        <br><br>
        <br><br>
        <%@include file="footer.jsp" %>
    </body>
</html>
