<%@page import="Manager.OrderDAO"%>
<!doctype html>
<%@page import="Manager.MenuManager"%>
<%@page import="Entity.Menu"%>


<% MenuManager menuManager = new MenuManager();
    Menu menu = menuManager.populateMenu();//defaultMenu();

    session.setAttribute("menu", menu);
    session.setAttribute("orders", OrderDAO.populateOrder());
    //session.setAttribute("orders", OrderDAO.populateOrder());
    session.setAttribute("eorders",OrderDAO.populateEmergencyOrder());
%>
<html>
    <link rel="stylesheet" href="css/bootstrap.min.css">  
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="css/main.css">

    <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <html>


    <head>
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

        
        <div class="jumbotron">
            <div class="container">
                <h1>Web Experiment</h1>
                <a href="welcome.jsp" class="btn btn-primary btn-lg">Begin Test</a>

            </div>
        </div>

    </body>

</html>
