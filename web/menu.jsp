<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@include file="protect.jsp"%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" size="40" href="welcome.jsp"><img src="pictures/Home.png" alt="My Account" style="width:30px; height:30px;"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <form class="navbar-form navbar-right" role="form">


                        <a class="btn btn-primary btn-block" href="Account.jsp" role="button">My Account &raquo;</a>
                    
                        <a class="btn btn-primary btn-block" href="OrderPage.jsp" role="button">Make Regular Order &raquo;</a>
               
                        <a class="btn btn-primary btn-block" href="RecipeCreationTesting.jsp" role="button">Create Dish &raquo;</a>
                        
                        <a class="btn btn-primary btn-block" href="ChatList.jsp" role="button">Supplier Chat &raquo;</a>
                        
                        <a class="btn btn-primary btn-block" href="logout.jsp" role="button">Log Out &raquo;</a>
               
            </form>
        </div><!--/.navbar-collapse -->
    </div>
</nav>