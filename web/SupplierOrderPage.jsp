
<%@page import="Manager.SupplierOrderDAO"%>
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
            $(function() {
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
                    String currentSupplierID = (String)session.getAttribute("currentSupplier");
                    //out.println(currentSupplierID);//1
                    ArrayList<Order> supplierOrders = SupplierOrderDAO.getRelevantOrders(currentSupplierID);
                    /*
                    if(supplierOrders!=null){
                        out.println(supplierOrders.size());//0
                    }
                    */
                    //ArrayList<Order> orderedOrders = SupplierOrderDAO.getActualOrderLists(supplierOrders);
                %>
                
                <div class="well">
                    <p>Past Orders <%= supplierOrders.size()%></p>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <% 
                        /*
                           for(int i=orderList.size()-1;i>=0;i--){ 
                           Order tempOrder=orderList.get(i);
                           ArrayList<OrderItem> tempItemList=tempOrder.getOrderItem();
                        */
                        for(int i=supplierOrders.size()-1;i>=0;i--){ 
                           
                           Order o = supplierOrders.get(i);
                           ArrayList<OrderItem> orderItems = o.getOrderItem();
                        %>
                        <div class="panel panel-default col-sm-5" onclick="location.href = 'SupplierRegularOrder.jsp?num=<%=i%>';">
                            <div class="panel-heading"><h4>Order #<%=o.getOrderId()%></h4></div>
                            <div class="panel-body"> 
                                
                                
                                <ul>
                                    <li ><%=orderItems.get(0).getName()%> ... <%=orderItems.get(0).getQuantity()%><%="  "+orderItems.get(0).getUnit()%><%//"  $"+tempItemList.get(0).getPrice()%><%//"  Supplier:"+tempItemList.get(0).getSupplier()%></li>
                                    <li >
                                        <% if(orderItems.size()>=2){%>
                                        <%=orderItems.get(1).getName()%> ... <%=orderItems.get(1).getQuantity()%><%="  "+orderItems.get(1).getUnit()%><%//"  $"+tempItemList.get(1).getPrice()%><%//"  Supplier:"+tempItemList.get(1).getSupplier()%>
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
            <p>&copy; Lalaland 2099</p>
        </footer>
    </div> <!-- /container -->        


</body>
</html>
