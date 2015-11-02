<%@include file="protect.jsp"%>
<%@page import="Entity.Supplier"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Manager.*"%>
<html>
    <head>
        <script src="https://cdn.firebase.com/js/client/2.2.1/firebase.js"></script>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js'></script>
        <link rel="stylesheet" type="text/css" href="css/chatstylesheet.css">
        <link rel ="stylesheet" type ="text/css" href="css/bootstrap.css">
        <link rel ="stylesheet" type ="text/css" href="css/bootstrap.min.css">
    </head>
    <style>
        #chat{
            margin-top: 100px;
        }

        .list-group-item:active{
            background-color: blue; 
        }

    </style>

    <body>
        <%@include file="menu.jsp"%>
        <%
            //SupplierDAO supplierDao = new SupplierDAO();
            ArrayList<Supplier> supplierList = SupplierDAO.favouriteSuppliers("1");//session.getId());
        %>
        <form action="ChatVendor.jsp" method="GET" id="chat">
            <input type="hidden" value="FreshFoodz" name="hiddenvalue" id="hiddenvalue"></input>

            <ul class ="list-group">
                <li class ="list-group-item"><h1>Contact Lists</h1></li>
                    <% for (Supplier supplier : supplierList) {
                            String supName = supplier.getSupName();
                    %>
                <li class ="list-group-item" name="<%=supName%>" onclick="submitFunction('<%=supName%>')" ><h3><%=supName%></h3></li>
                        <%}%>
            </ul>
        </form>
        <script>
            function submitFunction(supplierName) {
                document.getElementById("hiddenvalue").setAttribute("value", supplierName);
                document.getElementById("chat").submit();
            }
        </script>
    </body>
</html>