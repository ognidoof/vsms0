<%-- 
    Document   : SupplierView
    Created on : 12 Oct, 2015, 11:29:49 PM
    Author     : Joel
--%>

<%@page import="Manager.MenuManager"%>
<%@page import="java.util.List"%>
<%@page import="Manager.SupplierDAO"%>
<%@page import="Entity.Supplier"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String id = (String) request.getParameter("id");
    String resent=(String)request.getParameter("resent");
    if(resent!=null&&resent.equals("true")){
        SupplierDAO.saveAsFavouriteSupplier(id,"1");
    }
    if(resent!=null&&resent.equals("false")){
        SupplierDAO.deleteFavouriteSupplier(id,"1");
    }
%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>--%>
        <script type="text/javascript" src="script.js"></script>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <!--<link rel="stylesheet" href="css/bootstrap.min.css">-->
        <style>
            body {
                padding-top: 50px;
                padding-bottom: 20px;
            }
        </style>
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!--Insertion of menu, ref: script.js-->
        <div id="menu">
        </div>


        <div class="jumbotron">
            
            <div class="container">
                <%
                    //SupplierDAO sDAO = new SupplierDAO();
                   // List<Supplier> supList = sDAO.retrieveAll();
                    Supplier toDisplay = MenuManager.getSupplierById(id);//sDAO.getSupplier(id, supList);
                %>
                <h1><%= toDisplay.getSupName()%></h1>
                <div>
                    <p> <%= toDisplay.getDesc()%> </p></br>

                    <div>
                        <table>
                            <p>
                            <form action="">
                                <!--<input class="btn btn-primary btn-lg" type="submit" value="Website">-->

                            </form>

                            <%--
                            <td>
                                <form action="SupplierCatalogue.jsp?send=<%= toDisplay.getSupName() %>">
                                    <input type="submit" value="Catalogue">
                                </form>
                            </td>
                            --%>
                            <p> <input  class="btn btn-primary btn-lg" type="button" onclick="location.href = 'SupplierView.jsp?id=<%= toDisplay.getId()%>&resent=false';" value="Delete from Favourites" />
                            </p>
                            
                            <p>
                            <a data-toggle="modal" class="btn btn-primary btn-lg" data-target="#myModal" >Add to Favourites +</a>
                            <input  class="btn btn-primary btn-lg" type="button" onclick="location.href = 'SupplierCatalogue.jsp?send=<%= toDisplay.getId()%>';" value="View Catalogue" />
                            </p>
                        </table>
                         
                                <!-- Trigger the modal with a button -->
                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Website</button>

                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Favourite Supplier</h4>
                            </div>
                            <div class="modal-body">
                                <p>Add Supplier to Favourites?</p>
                            </div>
                            <div class="modal-footer">
                                <input  class="btn btn-primary btn-lg" type="button" onclick="location.href = 'SupplierView.jsp?id=<%= toDisplay.getId()%>&resent=true';" value="Add to Favourites" />
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>

            
                    </div>    
                </div>
            </div>
        </div>
    </body>
</html>
