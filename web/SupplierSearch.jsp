<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@include file="protect.jsp"%>
<html>
    <head>


        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="script.js"></script>
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">


        <style>
            body {
                padding-top: 50px;
                padding-bottom: 20px;
            }
        </style>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/main.css">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!--Insertion of menu, ref: script.js-->
        <div id="menu">
        </div>


        <div class="jumbotron">
            <div class="container">
                <div>
                    <table>
                        <tr>
                            <th>
                        <h2>Supplier Search</h2>
                        </th>
                        <th>
                            <img src=""></img>
                        </th>
                        <th>
                            <img src=""></img>
                        </th>
                        </tr>
                    </table>
                </div>
                <div> 
                </div>
                <div>
                    <form method="post" action="SupplierSearchResults.jsp">
                        <input class="inputs" type="text" name="supName"> 
                        <input type="hidden" name="items" value="chaff">
                        <input type="hidden" name="category" value="flare">
                        <br>
                        <input class="btn btn-success btn-lg" type="submit" value="Go!">
                        <br><br>
                    </form>
                    <!--<button type="button" onclick="SupAdvSearch.html">Advanced Search</button>-->
                    <a href ="SupplierAdvSearch.jsp">Advanced Search</a>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
