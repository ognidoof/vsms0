

<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Supplier"%>
<%@page import="java.util.List"%>
<%@page import="Manager.SearchDAO"%>
<%@page import="DAO.SupplierDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>

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
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!--Insertion of menu, ref: script.js-->
        <div id="menu">
        </div>
<%
    String inputStr = request.getParameter("supName");
    //SupplierDAO sDAO = new SupplierDAO();
    SearchDAO sDAO = new SearchDAO();
    List<Supplier> slist = sDAO.Search(inputStr);
%>

<div class="jumbotron">
            <div class="container">
        <div><h2>Supplier Search Results</h2></div><br/>
            <div>
        </div>
        <div>
            <%
                String supName = request.getParameter("supName");
                String items = request.getParameter("items");
                String category = request.getParameter("category");
                
                List<Supplier> slist2 = new ArrayList<Supplier>();
                
                for(Supplier s : slist){
                    String storedName = s.getSupName();
                    if(storedName.toLowerCase().contains(supName.toLowerCase())){
                        slist2.add(s);
                    }
                }
                
                if(slist2 == null){
                    out.println("No results found.");
                }else{
                    for (Supplier found : slist2){
            %>
            <p><Strong> <a href="SupplierView.jsp?id=<%= found.getId() %>"><%= found.getSupName() %></a> </Strong></p>
            <p> <%= found.getDesc() %> </p><br/>
            <%        
                    }
                }
            %>

        </div>
            </div>
</div>
        <!--
        <div>
            <h4><strong><a href="SupplierFreshFruitz.jsp">Fresh Fruitz</a></strong></h4><br>
            <p><strong>Description: </strong>Providing the freshest and cheapest fruits<br>
                since 1987. Offering a wide range, from tropical to imported exotic fruits.</p><br>
            <p><strong>Items Sold: </strong>Rainbow pinapples, Purple apples, Pink oranges etc<p/><br>
            <p><strong>Location: </strong>Punggol Street 10, Industrial Block #B1-10</br>
            
            <h4><strong>Fresh Foodz</strong></h4><br>
            <p><strong>Description: </strong>Providing the freshest and cheapest chicken since<br>
                1887. Offering a wide range of fresh chicken parts.<p/><br>
            <p><strong>Items Sold: </strong>Chicken feet, foreign and local chicken</p><br>
            <p><strong>Location: </strong>Lakeside Street 20, Block 401, #11-10</p><br>
            
            <h4><strong>Fresh Saladz</strong></h4><br>
            <p><strong>Description: </strong>Established in 2014, we provide the best technology in<br>
                growing organic vegetables. We conduct research in additive free, genetically modified <br>
                vegetables infused with a variety of vitamins and minerals.</p><br>
            <p><strong>Items Sold: </strong>Rainbow cabbage, Blue spinach, Organic olives etc</p><br>
            <p><strong>Location: </strong>Jurong Avenue 2, Opposite Jurong Bird Park</p><br>       
        </div>
        -->
    </body>
</html>