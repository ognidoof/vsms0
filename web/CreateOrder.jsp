<%@include file="protect.jsp"%>
<%@page import="Manager.MenuManager"%>
<%@page import="Entity.Ingredient"%>
<%@page import="Entity.Supplier"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="Entity.Menu"%>
<%@page import="Entity.Dish"%>
<%@page import="java.util.ArrayList"%>
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
        <script src="js/parsley.js"></script>
    <!-- test comment-->



        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <%
            Menu menu = MenuManager.populateMenu("1");//(Menu) session.getAttribute("menu");
            ArrayList<Dish> dishList = (ArrayList<Dish>) menu.getDishList();

        %>
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
        <div class="jumbotron">
            <div class="container">
                <h2>Create Order</h2>
                <!--<p>You have <a href="#">1 new message!</a></p>-->


                <form name="OrderForm" action="OrderPage.jsp" method="get">
</p>
                    <%      for (int j = 0; j < dishList.size(); j++) {
                            Dish tempDish = dishList.get(j);
                            HashMap<Ingredient, Supplier> tempMap = tempDish.getIngredientList();
                            Set<Ingredient> kSet = tempMap.keySet();
                            Iterator<Ingredient> iter = kSet.iterator();

                            //LOOPING ACCORDING TO THE MENU
                    %>   
                    <div >
                        <table>
                        <!-- Title + Input textbox-->
                        <tr><td>
                       
                                <h5>   <p id="<%=tempDish.getName()%>" > <%=tempDish.getName()%> 
                                        Qty: </h5>
                            </td>
                            <td ><input class="inputs, toRight"  type="number" name="<%="quantity" + j%>" required data-parsley-type="integer" min="0" data-parsley-min="0"/>
                            <input type="hidden" name="<%="dish" + j%>" value="<%=tempDish.getName()%>">
                            </strong></p>
                        </td></tr>
                    </table>
                    </div>
                    <!-- BOOTSTRAP FOR PANELS -->

                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h5 class="panel-title">


                                    <%
                                        if (tempDish.getName().contains(" ")) {
                                    %>
                                    <a data-toggle="collapse" class="collapsed" href="#<%=j%>" id="<%=tempDish.getName()%>"><%=tempDish.getName()%> Ingredients</a>
                                </h5>
                            </div>
                            <div id="<%=j%>" class="panel-collapse collapse"> 
                                <%
                                } else {
                                %>
                                <a data-toggle="collapse" class="collapsed" href="#<%=tempDish.getName() + 1%>" id="<%=tempDish.getName()%>"><%=tempDish.getName()%> Ingredients</a>
                                </h5>
                            </div>
                            <div id="<%=tempDish.getName() + 1%>" class="panel-collapse collapse"> 
                                <%}
                                %>



                                <div class="panel-body">
                                    <br>
                                    <strong>Ingredients:</strong>
                                    <ul>
                                        <%
                                            while (iter.hasNext()) {
                                                Ingredient ingredient = iter.next();
                                                Supplier supplier = tempMap.get(ingredient);
                                        %>
                                        <li><%=ingredient.getName()%> <b class="quantity"><%=ingredient.getQuantity()%> <b class="unit"><%=ingredient.getUnit()%></b> <i class="result"></i></li>
                                            <%
                                                }
                                            %>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- PANEL ENDS HERE-->
                    <%}%>
                    <p>
                    <input class="btn btn-success btn-lg" type="submit" value="Send Order"/>
                    <a href="OrderPage.jsp" class="btn btn-primary btn-lg">Back</a>
                    </p>
                </form>
            </div>
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