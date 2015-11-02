<%@include file="protect.jsp"%>
<%-- 
    Document   : SupplierCatalogue
    Created on : 12 Oct, 2015, 11:47:15 PM
    Author     : Joel
--%>

<%@page import="Manager.MenuManager"%>
<%@page import="java.util.Iterator"%>
<%@page import="Entity.Ingredient"%>
<%@page import="java.util.HashMap"%>
<%@page import="Entity.Dish"%>
<%@page import="Entity.Menu"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Supplier"%>
<%@page import="DAO.SupplierDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String send = (String) request.getParameter("send");
%>



<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="script.js"></script>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <style>
            body {
                padding-top: 50px;
                padding-bottom: 20px;
            }
        </style>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/main.css">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>


    <body>

        <div id="menu">
        </div>

        <div class="jumbotron">
            <div class="container">

                <%
                    //SupplierDAO sDAO = new SupplierDAO();
                    //List<Supplier> supList2 = sDAO.retrieveAll();
                    Supplier toDisplay = MenuManager.getSupplierById(send);//sDAO.getSupplier(send, supList2);
                %>
                <h1><%= toDisplay.getSupName()%></h1>
                <h3>Ingredients Sold:</h3>
                <%
                    List<String> items = toDisplay.getItems();
                    
                    for (String item : items) {
                        out.println("<a  class=\"btn btn-default btn-lg btn-block\" data-toggle=\"modal\" data-target=\"#myModal\">" + item  + "</a><br>");
                        
                        //Print out the modal menu
                        try {
                            Menu menu = MenuManager.populateMenu("1");//(Menu) session.getAttribute("menu");
                            ArrayList<Dish> dishList = menu.getDishList();

                %>
                
                <!-- Modal -->
               
                <div class="modal fade" id="myModal" role="dialog">
                    
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                               
                                <button  type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Dish Lists</h4>
                            </div>
                            
                            <div class="modal-body">
                                
                                <%for (Dish dish : dishList) {%>
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                
                                                <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#<%=dish.getName().replaceAll("\\s", "")%>">
                                                    <%=dish.getName()%></a>
                                            </h4>
                                            
                                        </div>
                                        <div id="<%=dish.getName().replaceAll("\\s", "")%>" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <ul>
                                                    <%
                                                    
                                                        HashMap<Ingredient, Supplier> ingredientMap = dish.getIngredientList();
                                                        Iterator iter = ingredientMap.keySet().iterator();
                                                         
                                                        while (iter.hasNext()) {
                                                           
                                                            Ingredient ingredient = (Ingredient) iter.next();
                                                            Supplier supplier = ingredientMap.get(ingredient);
                                                            if (supplier == null) {
                                                    %><li><b><%=ingredient.getName()%></b>
                                                        <a data-toggle="modal" data-target="#linkPrompt">Link</a></li><%
                                                    } else {
                                                            %><li><b><%=ingredient.getName()%></b><font color="red"><%=supplier.getSupName()%></font></li><%
                                                                    }
                                                                }
                                                            %>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>

                <%

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }//Linked to modal

                %>
                <div id="linkPrompt" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Link Prompt</h4>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to link to this supplier?</p>
                            </div>
                            <div class="modal-footer">
                                <form class="form-horizontal">
                                    <fieldset>                
                                        <!-- Button (Double) -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="send"></label>
                                            <div class="col-md-8">
                                                <button type="button" class="btn btn-success" data-dismiss="modal">Link</button>
                                                <button id="cancel" name="cancel" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
