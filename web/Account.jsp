<%@include file="protect.jsp"%>
<%-- 
    Document   : Account
    Created on : Nov 2, 2015, 2:19:44 PM
    Author     : David
--%>

<%@page import="Manager.SupplierDAO"%>
<%@page import="Entity.Supplier"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    <head>
         <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="script.js"></script>
        <script src="https://cdn.rawgit.com/remy/bind/928c52ce335d6fd2c824b536a97efa460554b9e0/dist/bind.min.js"></script>
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

        <script src = "bootstrap/js/bootstrap.js"></script>
        
        
        
        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>   
        
     
    </head>
    <body>
         <div id="menu">
        </div>


        <div class="jumbotron">
            
            <div class="container">
        <h1>Favourite Suppliers</h1>
        
        <br/><div class="panel panel-default col-sm-5">
            <h2 class="panel-heading">Favourite List</h2><div class="panel-body">
                <table>


<%
            String id = (String) request.getParameter("id");
            String resent=(String)request.getParameter("resent");
            if(resent!=null&&resent.equals("true")){
             SupplierDAO.saveAsFavouriteSupplier(id,"1");
            }
            if(resent!=null&&resent.equals("false")){
               SupplierDAO.deleteFavouriteSupplier(id,"1");
             }
            
            
            ArrayList<Supplier> supplierList=SupplierDAO.favouriteSuppliers("1");
            for(Supplier s:supplierList){
                %>
                
                <tr><p><h3><%=s.getSupName()%>
                    <%
                    
                %>
                 <a data-toggle="modal" class="btn btn-danger btn toRight" data-target="#myModal" >Remove -</a>
                </h3></p></tr><br/>
                
                
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Remove Supplier</h4>
                            </div>
                            <div class="modal-body">
                                <p>Remove Supplier from Favourites?</p>
                            </div>
                            <div class="modal-footer">
                                <p>
                                    
                                  <input  class="btn btn-danger btn toRight" type="button" onclick="location.href = 'Account.jsp?id=<%= s.getId()%>&resent=false';" value="Remove Supplier" />
                                
                                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </p>
                            </div>
                        </div>

                    </div>
                </div>
                
                <%
            
                
                
            }
        %></table>
            </div>
        </div>
    </body>
</html>
