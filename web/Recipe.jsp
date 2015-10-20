<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
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
        <script type="text/javascript" src="parsley.js"></script>

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
    <body>

        <div id="menu">
        </div>


        <div class="jumbotron">
            <div class="container">
                <h1>Recipe Builder</h1>



                <form name="RecipeCreation" method="get" action="MenuDish.jsp" data-parsley-validate >


                    <!--validity check, unsure if still required-->    
                    <!--
                    <input type="checkbox" id="chkValidate" /> Validate Submit
                
                <p>
                    <input type="checkbox" id="chkValidateOnKeyPress" checked="checked" /> Display OnKeyPress
                    <span id="spanOutput" style="border: 1px solid #000; padding: 3px;"> </span>
                     </p>
                    -->

                    <h3 class="title2">Name of Dish</h3>


                    <input class="inputs" type="text" size="30" name="dishName" placeholder="Dish Name" /><br/>

                    <table id="tblSample">
                        <tr><br/></tr><tr>
                            <th>No.&nbsp</th><th colspan="1">Ingredients</th><th>Quantity</th><th>Units</th>
                        </tr>
                        <tr>
                            <td>1&nbsp</td>
                            <td><input type="text" name="ingredient1"
                                       id="ingredient" size="40" placeholder="ingredient"  required/>&nbsp</td>
                            <td>
                               <input type="number" name="quantity1"
                                       id="quantity" size="10" placeholder="amount" data-parsley-type="integer" min="0" data-parsley-min="0" required />&nbsp
                            </td>
                            <td>
                                <input   type="text" name="units1"
                                         id="units" size="10" placeholder="unit"  required/>&nbsp
                                </select>
                            </td>

                        </tr>
                    </table>

                    <br/>
                    <p>
                        <input class="btn btn-success btn-small" type="button" value="Add + " onclick="addRowToTable();" />
                        <input class="btn btn-danger btn-small" type="button" value="Remove - " onclick="removeRowFromTable();" />
                    </p><p class="toRight">

                        <input class="btn btn-primary btn-lg" type="submit" value="Save" onclick="validateRow(this.form);" />
                        <a href="MenuDish.jsp" class="btn btn-primary btn-lg">Back</a>
                    </p>

                </form>
            </div>
        </div>


        <hr>

        <footer>
            <p>&copy; Lalaland 2099</p>
        </footer>
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
