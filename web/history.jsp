<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <%@include file="protect.jsp"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>

        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
        <script type="text/javascript" src="script.js"></script>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>
            body {
                padding-top: 50px;
                padding-bottom: 20px;
            }
        </style>
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

        <!-- Main jumbotron for a primary marketing message or call to action -->

        <!-- <div class="container">
            <div class="jumbotron">
                <h1>Order History</h1>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">Order History</div>
                <div class="panel-body">
                    
                </div>
            </div>
        </div> -->
        <ul class="nav nav-tabs">
            <li><a href="#">Routine</a></li>
            <li><a href="#">Emergency</a></li>
        </ul>
        <div class="container">

            <div class="panel-group" id="accordion">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                Regular Order #1
                            </a>
                        </h4>
                    </div><!--/.panel-heading -->
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                           <!--<p class="hist-supplier-green">Supplier: F.O.O.D Inc.</p>-->
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Supplier name</th>
                                        <th>Supplier ID</th>
                                        <th>Order date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>F.O.O.D Inc.</td>
                                        <td>ABC12345</td>
                                        <td>19/9/2015</td>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Quantity</th>
                                        <th>Unit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Chicken</td>
                                        <td>5</td>
                                        <td>Whole</td>
                                    </tr>
                                    <tr>
                                        <td>Egg</td>
                                        <td>10</td>
                                        <td>Carton(s)</td>
                                    </tr>
                                    <tr>
                                        <td>Duck</td>
                                        <td>10</td>
                                        <td>Whole</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!--/.panel-body -->
                    </div><!--/.panel-collapse -->
                </div><!-- /.panel -->

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                Regular Order #2
                            </a>
                        </h4>
                    </div><!--/.panel-heading -->
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <p class="hist-supplier-green">Supplier: Eat Green Pte Ltd.</p>
                            <p>Chicken x 3</p>
                            <p>Egg x 1</p>
                            <p>Duck x 11</p>
                        </div><!--/.panel-body -->
                    </div><!--/.panel-collapse -->
                </div><!-- /.panel -->

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                Emergency Order #995
                            </a>
                        </h4>
                    </div><!--/.panel-heading -->
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                            <p>Chicken x 3</p>
                            <p>Egg x 1</p>
                            <p>Duck x 11</p>
                        </div><!--/.panel-body -->
                    </div><!--/.panel-collapse -->
                </div><!-- /.panel -->
            </div><!-- /.panel-group -->

        </div><!-- /.container -->  

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

        <footer>
            <p>&copy; Ognidoof 2015</p>
        </footer>
    </div> <!-- /container -->        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.js"><\/script>')</script>

    <script src="js/vendor/bootstrap.min.js"></script>

    <script src="js/main.js"></script>

    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
    <script>
        (function (b, o, i, l, e, r) {
            b.GoogleAnalyticsObject = l;
            b[l] || (b[l] =
                    function () {
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
