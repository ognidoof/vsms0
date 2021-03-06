<%@include file="protect.jsp"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <%@page import="Manager.OrderDAO"%>

    <%        String username = OrderDAO.getVendorNameById((String) session.getAttribute("currentVendor"));
    %>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>

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


    </head>
    <body>
        <div id="menu">
        </div>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!--Insertion of menu, ref: script.js-->


        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div class="jumbotron">
            <div class="container">
                <h1>Welcome,<br/> </h1>

                <div class="user"><h2><%=username%></h2></div> <br/>

                <div class="row">

                    <div class="col-xs-4">
                        <div class="tile-large">
                            <a href="Account.jsp" style="display:block; height:inherit; width:inherit; text-decoration: none;">
                                <div class="tile-content slide-up-2">
                                    <div class="slide">
                                        <img src="pictures/My Account.png" alt="My Account" style="width:inherit; height:inherit;">
                                    </div>

                                    <div class="slide-over">
                                        <img src="pictures/My Account Slide.png" alt="My Account Slide" style="width:inherit; height:inherit;">

                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-2"></div>
                    <div class="col-xs-4">
                        <div class="tile-large">
                            <a href="MenuDish.jsp" style="display:block; height:inherit; width:inherit; text-decoration: none;">
                                <div class="tile-content slide-up-2">
                                    <div class="slide">
                                        <img src="pictures/Menu.png" alt="Menu" style="width:inherit; height:inherit;">
                                    </div>
                                    <div class="slide-over">
                                        <img src="pictures/Menu Slide.png" alt="Menu Slide" style="width:inherit; height:inherit;">
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-xs-2"></div>
                </div>



                <p>
                <div class="row">
                    <div class="col-xs-4">
                        <div class="tile-large">
                            <a href="OrderPage.jsp" style="display:block;height:inherit; width:inherit; text-decoration: none;"> 
                                <div class="tile-content slide-up-2">
                                    <div class="slide">
                                        <img src="pictures/Order.png" alt="Order Icon" style="width:inherit; height:inherit;">
                                    </div>
                                    <div class="slide-over">
                                        <img src="pictures/Order Slide.png" alt="Order Slide" style="width:inherit; height:inherit;">
                                    </div>
                                </div>
                            </a>
                        </div>

                    </div>
                    <div class="col-xs-2"></div>
                    <div class="col-xs-4">
                        <div class="tile-large">
                            <a href="SupplierSearch.jsp" style="display:block; height:inherit; width:inherit; text-decoration: none;">
                                <div class="tile-content slide-up-2">
                                    <div class="slide">

                                        <img src="pictures/Supplier.png" alt="Suppluer" style="width:inherit; height:inherit;">

                                    </div>
                                    <div class="slide-over">
                                        <img src="pictures/Supplier Slide.png" alt="Supplier Slide" style="width:inherit; height:inherit;">

                                    </div>
                                </div>
                            </a>     
                        </div>
                    </div>
                    <div class="col-xs-2"></div>
                </div>
                </p> 






            </div>
        </div>

        <div class="container">
            <!-- Example row of columns -->
            <!-- <div class="row">
             <div class="col-md-4">
               <h2>Heading</h2>
               <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
               <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
             </div>
             <div class="col-md-4">
               <h2>Heading</h2>
               <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
               <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div>
             <div class="col-md-4">
               <h2>Heading</h2>
               <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
               <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
             </div>-->

        </div>

        <hr>

        <%@include file="footer.jsp"%>
    </div> <!-- /container -->        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.js"><\/script>')</script>

    <script src="js/vendor/bootstrap.min.js"></script>

    <script src="js/main.js"></script>

    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
    <script>
        (function(b, o, i, l, e, r) {
            b.GoogleAnalyticsObject = l;
            b[l] || (b[l] =
                    function() {
                        (b[l].q = b[l].q || []).push(arguments)
                    });
            b[l].l = +new Date;
            e = o.createElement(i);
            r = o.getElementsByTagName(i)[0];
            e.src = '//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e, r)
        }(window, document, 'script', 'ga'));
        ga('create', 'UA-XXXXX-X', 'auto');
        ga('send', 'pageview');
    </script>
</body>
</html>

