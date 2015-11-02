<%-- 
    Document   : MenuDish
    Created on : 13 Oct, 2015, 9:04:16 AM
    Author     : Benjamin
--%>
<%@include file="protect.jsp"%>
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
    String currentVendor = (String) session.getAttribute("currentVendor");
    Menu menu = MenuManager.populateMenu(currentVendor);
    int last = 0;
    int append = 0;
    boolean check = true;
    String dishName = request.getParameter("dishName");
    //Menu menu = MenuManager.populateMenu("1");

    if (dishName != null) {
        HashMap<Ingredient, Supplier> map = new HashMap<Ingredient, Supplier>();
        if (menu != null) {
            ArrayList<Dish> dlist = menu.getDishList();
            last = Integer.parseInt(dlist.get(dlist.size() - 1).getDishID());
        }
        while (check) {

            String element = request.getParameter("element" + append);
            String[] elePart;
            if(element!=null){
            //if (!ingPart[0].toString().equals(null)) {
                //out.println(ingredient);
                elePart = element.split("_");
                String[] supPart = elePart[0].split("@");
                String supName = supPart[0];
                String supID = supPart[1];
                
                String ingName = elePart[1];
                String ingID = MenuManager.getIngredientByName(ingName);
                                        
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
                Ingredient ing = new Ingredient(ingName, ingID, qty, units, supID);
                map.put(ing, null);
            } else {
                check = false;
            }
            append++;
        }
        last = last + 1;
        String l = last + "";
        Dish newDish = new Dish(l, dishName, map);
        MenuManager menuMan = new MenuManager();
        ArrayList<Dish> dishList = menu.getDishList();
        dishList.add(newDish);
        menu.setDishList(dishList);
        menuMan.insertDish(newDish, currentVendor);
        
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

                        <%                            if (menu != null) {
                                ArrayList<Dish> dlist = menu.getDishList();
                                last = Integer.parseInt(dlist.get(dlist.size() - 1).getDishID());
                                int count = 0;
                                for (Dish d : dlist) {
                                    String name = d.getName();
                                    String dID = d.getDishID();
                                    String ref = "collapse" + count;


                        %>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#<%=ref%>">
                                        Dish #<%=dID%> : <%=name%> 
                                    </a>
                                </h4>
                            </div><!--/.panel-heading -->
                            <div id="<%=ref%>" data-toggle="collapse" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Ingredient</th>
                                                <th>Quantity</th>
                                                <th>Unit</th>
                                            </tr>
                                        </thead>
                                        <!--<p class="hist-supplier-green">Supplier: F.O.O.D Inc.</p>-->
                                        <%
                                            HashMap<Ingredient, Supplier> dIList = d.getIngredientList();
                                            Set<Ingredient> ingredientSet = dIList.keySet();
                                            Iterator<Ingredient> iter = ingredientSet.iterator();
                                            //boolean block=false;
                                            //iter.next();
                                            //Ingredient test=iter.next();
                                        %><%//dIList==null%><%
                                                while (iter.hasNext()) {
                                                    Ingredient i = iter.next();
                                                    if (i != null) {
                                        %>

                                        <tbody>
                                            <tr>
                                                <td><%=i.getName()%></td>
                                                <td><%=i.getQuantity()%></td>
                                                <td><%=i.getUnit()%></td>
                                            </tr>
                                        </tbody>


                                        <%
                                                }
                                            }
                                        %>
                                    </table>
                                </div><!--/.panel-body -->
                            </div><!--/.panel-collapse -->
                        </div><!-- /.panel -->

                        <%
                                count++;
                            }
                        } else {
                        %>
                        <p>No recipes found<%=menu == null%></p>
                        <%
                            }
                        %>


                    </div>
                    <A HREF="welcome.jsp" class="btn btn-primary btn-lg">Back</A>
                    <a href="RecipeCreationTesting.jsp" class="btn btn-primary btn-lg">Create a dish</a>
                </div>
            </div>

        </div>
    </div>
    <div>
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
