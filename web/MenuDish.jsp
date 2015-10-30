<%-- 
    Document   : MenuDish
    Created on : 13 Oct, 2015, 9:04:16 AM
    Author     : Benjamin
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="Entity.Supplier"%>
<%@page import="Entity.Ingredient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Dish"%>
<%@page import="Manager.MenuManager"%>
<%@page import="Entity.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Menu menu = (Menu) session.getAttribute("menu");

    int append = 1;
    boolean check = true;
    String dishName = request.getParameter("dishName");

    if (dishName != null) {
        HashMap<Ingredient, Supplier> map = new HashMap<Ingredient, Supplier>();

        while (check) {

            String ingredient = request.getParameter("ingredient" + append);
            if (ingredient != null) {
                //out.println(ingredient);
                String quantity = request.getParameter("quantity" + append);
                String units = request.getParameter("units" + append);
                //out.println(quantity);
                //out.println(units);
                if (quantity == null) {
                    quantity = "0";
                }
                if (units == null) {
                    units = "pieces";
                }
                int qty = Integer.parseInt(quantity);
                Ingredient ing = new Ingredient(ingredient, qty, units);
                map.put(ing, null);
            } else {
                check = false;
            }
            append++;
        }

        Dish newDish = new Dish(dishName, map);
        ArrayList<Dish> dishList = menu.getDishList();
        dishList.add(newDish);
        menu.setDishList(dishList);
    }

%>
<html class="no-js" lang=""> <!--<![endif]-->
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
        <div id="menu">
        </div>
        <div class="jumbotron">
            <div class="container">
                <h1>Menu</h1>

                <div class="container">

                    <div class="panel-group" id="accordion">

                        <%                            Menu m1 = (Menu) session.getAttribute("menu");
                            ArrayList<Dish> dlist = m1.getDishList();
                            int count = 0;
                            for (Dish d : dlist) {
                                String name = d.getName();
                                String ref = "collapse" + count;


                        %>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#<%=ref%>">
                                        <%=name%>
                                    </a>
                                </h4>
                            </div><!--/.panel-heading -->
                            <div id="<%=ref%>" data-toggle="collapse" class="panel-collapse collapse">
                                <div class="panel-body">
                                    
                                    <!--<p class="hist-supplier-green">Supplier: F.O.O.D Inc.</p>-->
                                    <%
                                        HashMap<Ingredient, Supplier> dIList = d.getIngredientList();
                                        Set<Ingredient> ingredientSet = dIList.keySet();
                                        Iterator<Ingredient> iter = ingredientSet.iterator();

                                        while (iter.hasNext()) {
                                            Ingredient i = iter.next();
                                    %>

                                    <p><%=i.getName()%></p>
                                    <%
                                        }
                                    %>
                                </div><!--/.panel-body -->
                            </div><!--/.panel-collapse -->
                        </div><!-- /.panel -->

                        <%
                                count++;
                            }
                        %>


                    </div>
                    <A HREF="welcome.jsp" class="btn btn-primary btn-lg">Back</A>
                    <a href="Recipe.jsp" class="btn btn-primary btn-lg">Create a dish</a>
                </div>
            </div>
            <div>
                <footer>
                    <p>&copy; Lalaland 2099</p>
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
