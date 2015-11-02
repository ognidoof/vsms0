<%@include file="protect.jsp"%>
<%@page import="Manager.OrderDAO"%>
<%@page import="Entity.Order"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <%@page import = "java.util.*" %>
        <%@page import = "Entity.*" %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
        <script type="text/javascript" src="js/script.js"></script>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/main.css">

        <style>
            body {
                padding-top: 50px;
                padding-bottom: 20px;
            }
            #button1 , #button2 {
                display:inline-block;
                margin:1em;
                /**other codes**/
            }
            div.orders {
                display: inline-block;
                margin: 1em;
                background-color:black;
                color:white;
                padding:20px;
            }	
            panel{
                margin:1em;
            }

        </style>
        <!-- This is for the calendar -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

        <link rel="stylesheet" href="/resources/demos/style.css">
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
        <!-- DONE with id calendar-->
        <!-- This is for modal -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <!-- Done for modal! -->
    </head>
    <body>

        <script type="text/javascript" src="script.js"></script>
        <!--Insertion of menu, ref: script.js-->
        <div id="menu"> </div>

        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div class="jumbotron">
            <div class="container">
                <h1>Emergency Order</h1>
                <!-- 2 tiles side by side together -->
                <a data-toggle="modal" data-target="#createOrder" style="text-align:center" class="btn btn-primary btn-lg col-sm-6" id ="button1" href="#" role="button">Create New Order</a>

                <div id="createOrder" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-lg">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Create Order</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" method="get" action="EmergencyOrder.jsp">
                                    <fieldset>

                                        <!-- Form Name -->
                                        <legend></legend>

                                        <form name="RecipeCreation" method="get" action="MenuDish.jsp">


                                            <!--validity check, unsure if still required-->    
                                            <!--
                                            <input type="checkbox" id="chkValidate" /> Validate Submit
                                        
                                        <p>
                                            <input type="checkbox" id="chkValidateOnKeyPress" checked="checked" /> Display OnKeyPress
                                            <span id="spanOutput" style="border: 1px solid #000; padding: 3px;"> </span>
                                             </p>
                                            -->

                                            <h3 class="title2">Deadline</h3>


                                            <input class="inputs" type="text" size="30" name="deadline" placeholder="Deadline Date" /><br/>

                                            <table id="tblSample">
                                                <tr><br/></tr><tr>
                                                    <th>No.&nbsp</th><th colspan="1">Ingredients</th><th>Quantity</th><th>Units</th>
                                                </tr>
                                                <tr>
                                                    <td>1&nbsp</td>
                                                    <td><input type="text" name="ingredient1"
                                                               id="ingredient" size="40" placeholder="ingredient"  />&nbsp</td>
                                                    <td>
                                                        <input type="text" name="quantity1"
                                                               id="quantity" size="10" placeholder="amount"  />&nbsp
                                                    </td>
                                                    <td>
                                                        <input   type="text" name="units1"
                                                                 id="units" size="10" placeholder="unit"  />&nbsp
                                                        </select>
                                                    </td>

                                                </tr>
                                            </table>

                                            <br/>
                                            <p>
                                                <input class="btn btn-success btn-small" type="button" value="Add + " onclick="addRowToTable();" />
                                                <input class="btn btn-danger btn-small" type="button" value="Remove - " onclick="removeRowFromTable();" />
                                            </p><p class="toRight">

                                                <input class="btn btn-primary" type="submit" value="Send" onclick="validateRow(this.form);" />

                                                <button id="cancel" name="cancel" class="btn btn-danger">Cancel</button>             





                                                </fieldset>
                                        </form>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                        </div>

                                        </div>
                                        </div>

                                        <%
                                            ArrayList<Order> orderList = (ArrayList<Order>) session.getAttribute("eorders");
                                            String success_msg = "";
                                            if (request.getParameter("deadline") != null) {
                                                int count = 1;

                                                ArrayList<OrderItem> itemList5 = new ArrayList<OrderItem>();

                                                while (request.getParameter("ingredient" + count) != null && request.getParameter("quantity" + count) != null && request.getParameter("units" + count) != null) {
                                                    String s = request.getParameter("quantity" + count);
                                                    Double d = 0.0;
                                                    if (!s.equals("")) {
                                                        d = Double.parseDouble(s);
                                                    }
                                                    
                                                    //UPDATE NOTE: Currently no feedback to user if order has invalid quantitiy, just brings to new page with no new order created.
                                                    //May consider error message?
                                                    if (d != 0.0) {
                                                        OrderItem item9 = new OrderItem(request.getParameter("ingredient" + count), d, request.getParameter("units" + count));
                                                        itemList5.add(item9);
                                                    }
                                                    count++;
                                                }
                                                //OrderItem item9 = new OrderItem(request.getParameter("item"), Double.parseDouble(request.getParameter("quantity")), request.getParameter("units"));
                                                //ArrayList<OrderItem> itemList5 = new ArrayList<OrderItem>();
                                                //itemList5.add(item9);
                                                if (!itemList5.isEmpty()) {
                                                    Order order5 = new Order(OrderDAO.getOrderNum() + "", request.getParameter("deadline"), "Fast Foods", itemList5);
                                                    orderList.add(order5);
                                                    success_msg = "Order has been Successfully Broadcasted!";
                                                }
                                            }
                                        %>

                                        <div class="well">
                                            <p>Pending Orders</p>
                                            <p class="success"><%=success_msg%></p>
                                        </div>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <% for (int i = orderList.size() - 1; i >= 0; i--) {
                                                        Order tempOrder = orderList.get(i);
                                                        ArrayList<OrderItem> tempItemList = tempOrder.getOrderItem();
                                                %>
                                                <div class="panel panel-default col-sm-5" onclick="location.href = 'OrderDetail.jsp?num=<%=i%>';">
                                                    <div class="panel-heading"><h4>Order #<%=tempOrder.getOrderNum()%></h4></div>
                                                    <div class="panel-body"> 
                                                        <%--<h3><%=tempOrder.getSupplier()%></h3>--%>
                                                        <h5><%=tempOrder.getDeadline()%></h5>
                                                        <ul>
                                                            <li ><%=tempItemList.get(0).getName()%> ... <%=tempItemList.get(0).getQuantity()%><%=tempItemList.get(0).getUnits()%></li>
                                                            <li >
                                                                <% if (tempItemList.size() > 2) {%>
                                                                <%=tempItemList.get(1).getName()%> ... <%=tempItemList.get(1).getQuantity()%><%=tempItemList.get(1).getUnits()%>
                                                                <%}%>
                                                            </li>
                                                            <li >...</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <%}%>
                                            </div>
                                        </div>







                                        </div>
                                        </div>


                                        <hr>

                                        <footer>
                                            <p>&copy; Ognidoof 2015</p>
                                        </footer>
                                        </div> <!-- /container -->        


                                        </body>
                                        </html>
