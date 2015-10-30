<%@page import="Entity.OrderItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Order"%>
<%@page import="Entity.Order"%>
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
                alignment-adjust: central;
                /**other codes**/
            }
            .inline{
                display: inline-block;
                margin: 1em;
            }
            table{
                margin: 1em
            }

        </style>
        <!-- This is for modal -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <!-- Done for modal! -->

    </head>
    <body>


        <!--Insertion of menu, ref: script.js-->
        <div id="menu"> </div>

        <!-- Main jumbotron for a primary marketing message or call to action -->
        <% 
            ArrayList<Order> orderList=(ArrayList<Order>)session.getAttribute("orders");
            int num=Integer.parseInt(request.getParameter("num"));
            Order display=orderList.get(num);
        %>                
        <div class="jumbotron">
            <div class="container">

                <div class="inline">
                    <h1>Order #<%=display.getOrderId()%></h1>
                </div>
                <div class="inline">
                    <h5>TotalPrice: <%=display.getTotalPrice()%></h5>
                    <%--<h5>Supplier: <%=display.getSupplier()%></h5>--%>
                </div>

                <div>
                    <!--<a data-toggle="modal" data-target="#addItem" class="btn btn-success btn-lg" id ="button1"  role="button">Add Item</a>-->
                    <!--<a data-toggle="modal" data-target="#deletePrompt" class="btn btn-danger btn-lg col-sm-6" id ="button2" href="#" role="button">Delete Order</a>-->
                </div>
                <div id="addItem" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Insert Order</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal">
                                    <fieldset>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="deadline">Item</label>  
                                            <div class="col-md-5">
                                                <input  name="deadline" type="text" class="form-control input-md" id="datepicker" required="">
                                                <span class="help-block">Insert item here</span>
                                            </div>
                                        </div>

                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="items">Item</label>
                                            <div class="col-md-5">
                                                <select id="items" name="items" class="form-control">
                                                    <option value="chicken">Chicken</option>
                                                    <option value="fish">Fish</option>
                                                    <option value="coliander">Coliander</option>
                                                </select>
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="price">Price</label>  
                                            <div class="col-md-2">
                                                <input id="price" name="price" type="text" placeholder="$0.00" class="form-control input-md">
                                                <span class="help-block">Insert your max price here</span>  
                                            </div>
                                        </div>

                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="quantity">Quantity</label>
                                            <div class="col-md-2">
                                                <select id="quantity" name="quantity" class="form-control">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                </select>
                                            </div>
                                        </div>
                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="units">Units</label>
                                            <div class="col-md-4">
                                                <select id="units" name="units" class="form-control">
                                                    <option value="whole">Whole</option>
                                                    <option value="pieces">Pieces</option>
                                                    <option value="cans">Cans</option>
                                                </select>
                                            </div>
                                        </div>



                                        <!-- Button -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="add"></label>
                                            <div class="col-md-4">
                                                <button id="add" name="add" class="btn btn-success">+Add</button>
                                            </div>
                                        </div>

                                        <!-- Button (Double) -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="send"></label>
                                            <div class="col-md-8">
                                                <button id="send" name="send" class="btn btn-success">Send</button>
                                                <button id="cancel" name="cancel" class="btn btn-danger">Cancel</button>
                                            </div>
                                        </div>

                                    </fieldset>
                                </form>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
                <div id="deletePrompt" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Delete Prompt</h4>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to delete?</p>
                            </div>
                            <div class="modal-footer">
                                <form class="form-horizontal">
                                    <fieldset>                
                                        <!-- Button (Double) -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="send"></label>
                                            <div class="col-md-8">
                                                <button id="delete" name="delete" class="btn btn-danger">Delete</button>
                                                <button id="cancel" name="cancel" class="btn btn-primary">Cancel</button>
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- table of orders -->
                <div class="table-responsive table-condensed">   
                    <table class="table table-condensed" style="margin:1em">
                        <tr>
                            <th>No.</th>
                            <th>Item</th>
                            <!--<th>Price</th>-->
                            <th>Quantity</th>
                            <th>Units</th>
                            <th>Supplier</th>
                            <!--<th>Edit?</th>-->
                            <!--<th>Delete?</th>-->
                        </tr>
                        
                        <%
                            ArrayList<OrderItem> itemList=display.getOrderItem();
                            for(int i=0;i<itemList.size();i++){
                                OrderItem tempItem=itemList.get(i);
                            
                        %>
                        <tr>
                            <th><%=i+1%></th>
                            <td><%=tempItem.getName()%></td>
                            <!--<td>$<%//tempItem.getPrice()%></td>-->
                            <td><%=tempItem.getQuantity()%></td>
                            <td><%=tempItem.getPrice()%></td>
                            <td><%=tempItem.getSupplier()%></td>
                            <!--<td><a class="btn btn-primary btn-sm" id ="edit" href="#" role="button">Edit</a></td>-->
                            <!--<td><a data-toggle="modal" data-target="#deletePrompt" class="btn btn-danger btn-sm" id ="button2" href="#" role="button">Delete</a></td>-->
                        </tr>
                        <%}%>
                        
                    </table>
                </div>
            </div>
        </div>


        <hr>

        <footer>
            <p>&copy; Lalaland 2099</p>
        </footer> <!-- /container -->        


    </body>
</html>
