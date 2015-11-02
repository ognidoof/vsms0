
<%@page import="Manager.SupplierOrderDAO"%>
<%@include file="protect.jsp"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <%@page import="Manager.OrderDAO"%>
        <%@page import = "java.util.*" %>
        <%@page import = "Entity.*" %>
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


        <!--Insertion of menu, ref: script.js-->
        <div id="menu">
        </div>

        <!-- Main jumbotron for a primary marketing message or call to action -->

        <div class="jumbotron">
            <div class="container">
                <h1>Past Orders</h1>
                <%
                    String currentSupplierID = (String) session.getAttribute("currentSupplier");
                    //out.println(currentSupplierID);//1
                    ArrayList<Order> supplierOrders = SupplierOrderDAO.getRelevantOrders(currentSupplierID);
                    System.out.println("Supplier orders are: "+supplierOrders.size());
                    for(Order order : supplierOrders){
                        System.out.println( order.getOrderId());
                    }

                    HashMap<String, ArrayList<OrderItem>> orderlists = SupplierOrderDAO.getActualOrders(supplierOrders);
                %>

                <div class="well">
                    <p>Past Orders </p>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <%
                            Iterator iter = orderlists.keySet().iterator();
                            while (iter.hasNext()) {
                                String orderid = (String) iter.next();
                                ArrayList<OrderItem> orderItems = orderlists.get(orderid);

//                        
//                        for(Map.Entry<String, ArrayList<OrderItem>> entry : orderlists.entrySet()){
//                            String orderid = entry.getKey();
//                            ArrayList<OrderItem> orderItems = entry.getValue(); 
//                            System.out.println(orderid);
%>
                        <div class="panel panel-default col-sm-5" onclick="location.href = 'SupplierRegularOrder.jsp?num=<%=orderid%>';">
                            <div class="panel-heading"><h4>Order #<%= orderid%></h4></div>
                            <div class="panel-body">   
                                <ul>
                                    <%
                                        int i = 0;
                                        for (OrderItem orderItem : orderItems) {
                                            i++;
                                            if (i > 2) {
                                                String name = orderItem.getName();
                                                String quantity = orderItem.getQuantity();
                                                String unit = " " + orderItem.getUnit();
                                    %>
                                    <li ><%=name%> ... <%=quantity%><%=unit%><%//"  $"+tempItemList.get(0).getPrice()%><%//"  Supplier:"+tempItemList.get(0).getSupplier()%></li>
                                        <%}
                                       }%>
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
     <!-- /container -->        


</body>
</html>
