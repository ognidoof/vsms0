<%@page import="Manager.OrderDAO"%>
<!doctype html>
<%@page import="Manager.MenuManager"%>
<%@page import="Entity.Menu"%>


<% MenuManager menuManager = new MenuManager();
    Menu menu = menuManager.defaultMenu();

    session.setAttribute("menu", menu);
    session.setAttribute("orders", OrderDAO.populateOrder());
    session.setAttribute("orders",OrderDAO.populateOrder());
    session.setAttribute("eorders",OrderDAO.populateEmergencyOrder());
%>
<html>
    <link rel="stylesheet" href="css/bootstrap.min.css">  
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="css/main.css">

    <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <body>

        <div class="jumbotron">
            <div class="container">
                <h1>User Test</h1>
                <a href="welcome.jsp" class="btn btn-primary btn-lg">Begin Test</a>

            </div>
        </div>

    </body>

</html>
