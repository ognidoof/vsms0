<%-- 
    Document   : LoginMain
    Created on : 21 Oct, 2015, 10:46:00 PM
    Author     : Joel
--%>

<%@page import="Entity.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">


        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="script.js"></script>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="css/metro/metro-icon.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>
            body {
                padding-top: 50px;
                padding-bottom: 20px;
            }
        </style>
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/main.css">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/main.js"></script>

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

        <title>Login Main</title>
    </head>
    <body>

        <div class="jumbotron">

            <div class="container">
                <img src="pictures/REKT logo.png" alt="Logo" style="width:80% ">



                <%
                    String currentVendor = (String) session.getAttribute("currentVendor");
                    String currentSupplier = (String) session.getAttribute("currentSupplier");
                    String errorMsg = (String) request.getParameter("errorMsg");
                    String succMsg = (String) request.getParameter("succMsg");
                %>

                <%
                    if (errorMsg == null) {
                        errorMsg = "";
                    }
                    if (succMsg == null) {
                        succMsg = "";
                    }
                %>
                <div>
                    <!--<p>Supplier Login</p>-->
                    <p><h2></h2></p>
                    <form action ="LoginServlet" method="POST">
                        <!--
                        <input type="text" value="supplierName" placeholder="Enter username"></br>
                        <input type="text" value="supplierPw" placeholder="Enter password"></br>
                        -->
                        <p><input class="inputs" type="text" name="username" placeholder="Enter username" required="true"></p>
                        <p><input class="inputs" type="password" name="password" placeholder="Enter password" required="true"></p>
                        <p class="logFail"><%=errorMsg%></p>
                        <p class="logSucc"><%=succMsg%></p>
                        <input class="btn-primary btn-lg" type="submit" value="Login">

                    </form>
                </div>
                <%@include file="footer.jsp"%>
            </div>
        </div>
    </body>
</html>
