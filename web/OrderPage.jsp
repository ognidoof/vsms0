<%@page import="Manager.OrderDAO"%>
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
                <h1>Order Page</h1>
                <!-- 2 tiles side by side together -->
                <!--<a data-toggle="modal" data-target="#createOrder" style="text-align:center" class="btn btn-primary btn-lg col-sm-6" id ="button1" href="#" role="button">Create New Order</a>-->
                <a style="text-align:center" class="btn btn-primary btn-lg col-sm-6" id ="button1" href="CreateOrder.jsp" role="button">Create New Order</a>
                <div id="createOrder" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-lg">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Create Order</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal">
                                    <fieldset>

                                        <!-- Form Name -->
                                        <legend></legend>

                                        <!-- Text input-->
                                        <div class="form-group" method="get" action="">
                                            <label class="col-md-4 control-label" for="deadline">Deadline</label>  
                                            <div class="col-md-5">
                                                <input  name="deadline" type="text" class="form-control input-md" id="datepicker" required="">
                                                <span class="help-block">Insert your order deadline here</span>
                                            </div>
                                        </div>
                                        
                                        <!-- inline forms -->
                                        <div class="form-group" method="get" action="">
                                            <div class="col-xs-4">
                                                <label for="item">Item</label>
                                                <select id="item" name="item" class="form-control">
                                                    <option value="chicken">Chicken</option>
                                                    <option value="fish">Fish</option>
                                                    <option value="coliander">Coliander</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-2">
                                                <label for="unit">Unit</label>
                                                <select id="unit" name="unit" class="form-control">
                                                    <option value="whole">Whole</option>
                                                    <option value="pieces">Pieces</option>
                                                    <option value="cans">Cans</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-2">
                                                <label for="quantity">Quantity</label>
                                                <input class="form-control" name="quantity" id="quantity" placeholder="1" type="text">
                                            </div>
                                            <div class="col-xs-4">
                                                <label for="maximumprice">Maximum Price</label>
                                                <input class="form-control" name="maximumprice" id="maximumprice" placeholder="$0.00" type="text">
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
                                        <div class="form-group" method="get" action="">
                                            <label class="col-md-4 control-label" for="send"></label>
                                            <div class="col-md-8">
                                                <button id="send" type="submit" name="send" class="btn btn-success">Send</button>
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
                
                <%
                    Menu menu = (Menu) session.getAttribute("menu");
                    ArrayList<Dish> dishList = (ArrayList<Dish>) menu.getDishList();
                    ArrayList<Order> orderList=(ArrayList<Order>)session.getAttribute("orders");
                    int count=0;
                    HashMap<String, ArrayList<OrderItem>> outputMap=new HashMap<String, ArrayList<OrderItem>>();
                    
                        //String ingredient = request.getParameter("quantity1");
                       // String dish = request.getParameter("dish1");
                        //String deadline = request.getParameter("deadline");
                    
                    while(request.getParameter("quantity"+count)!=null){
                        
                        //Dish tempDish=(Dish)session.getAttribute("attribute"+count);
                        String dish=request.getParameter("dish"+count);
                        String ingredientQuantity = request.getParameter("quantity"+count);
                        Double ingredientQuantityNum=Double.parseDouble(ingredientQuantity);
                        Dish tempDish=null;
                        
                        for(int j=0;j<dishList.size();j++){
                            Dish verify=dishList.get(j);
                            if(verify.getName().equals(dish)){
                                tempDish=verify;
                            }
                        }
                        
                        HashMap<Ingredient,Supplier> tempMap=tempDish.getIngredientList();
                        Set<Ingredient> kSet=tempMap.keySet();
                        Iterator<Ingredient> iter=kSet.iterator();
                        
                        while(iter.hasNext()){
                            
                            Ingredient ingredient=iter.next();
                            OrderItem tempItem=new OrderItem(ingredient.getName(),(ingredient.getQuantity())*ingredientQuantityNum,ingredient.getUnit());
                            Supplier supplier=tempMap.get(ingredient);
                           
                            String supplierName="";
                            if(supplier!=null){
                                supplierName=supplier.getSupName();
                            }
                            else{
                                supplierName="Awesome Foodz";
                            }
                            
                            
                            if(outputMap.containsKey(supplierName)){
                                outputMap.get(supplierName).add(tempItem);
                            }else{
                                ArrayList<OrderItem> tempItemList=new ArrayList<OrderItem>();
                                tempItemList.add(tempItem);
                                outputMap.put(supplierName,tempItemList);
                            }
                                      
                        }
                        
                              
                        count++;
                        //int number=(Integer)session.getAttribute("attribute"+count);
                    
                    }
                            
                    Set<String> keySet=outputMap.keySet();
                    Iterator<String> stringIter=keySet.iterator();
                    while(stringIter.hasNext()){
                        String supName=stringIter.next();
                        Order tempOrder=new Order((OrderDAO.getOrderNum()+""),request.getParameter("deadline"),supName,(ArrayList<OrderItem>)outputMap.get(supName));
                        orderList.add(tempOrder);
                    }
                    
                    //get dish from form
                    //Dish dish=request.getParameter("Dish");
                    //dish is a hashmap of Key ingredient value supplier
                   // HashMap<String,String> tempMap=new HashMap<String, String>();
                   //Set<String> kSet=tempMap.keySet();
                    //Iterator<String> iter=kSet.iterator();
                    //while(iter.hasNext()){
                        //String ingredient=iter.next();
                       // String supplier=tempMap.get(ingredient);
                        
                   // }
                    //if(request.getParameter("deadline")!=null){
                    //    OrderItem item9=new OrderItem(request.getParameter("item"),Double.parseDouble(request.getParameter("maximumprice")),Double.parseDouble(request.getParameter("quantity")),request.getParameter("unit"));
                    //    ArrayList<OrderItem> itemList5=new ArrayList<OrderItem>();
                    //    itemList5.add(item9);
                    //    Order order5=new Order("999",request.getParameter("deadline"),"Fast Foods",itemList5);
                    //    orderList.add(order5);
                    //}   
                %>
                <div class="well">
                                            <p>Pending Orders</p>
                                        </div>
                <div class="container-fluid">
                    <div class="row">
                        <% 
                           for(int i=orderList.size()-1;i>=0;i--){ 
                           Order tempOrder=orderList.get(i);
                           ArrayList<OrderItem> tempItemList=tempOrder.getOrderItem();
                        %>
                        <div class="panel panel-default col-sm-5" onclick="location.href = 'RegularOrderDetail.jsp?num=<%=i%>';">
                            <div class="panel-heading"><h4>Order #<%=tempOrder.getOrderNum()%></h4></div>
                            <div class="panel-body"> 
                                <h3><%=tempOrder.getSupplier()%></h3>
                                <h5><%=tempOrder.getDeadline()%></h5>
                                <ul>
                                    <li ><%=tempItemList.get(0).getName()%> ... <%=tempItemList.get(0).getQuantity()%><%=tempItemList.get(0).getUnits()%></li>
                                    <li >
                                        <% if(tempItemList.size()>=2){%>
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
            <p>&copy; Lalaland 2099</p>
        </footer>
    </div> <!-- /container -->        


</body>
</html>
