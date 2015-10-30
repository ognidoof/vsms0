<%-- 
    Document   : LoginMain
    Created on : 21 Oct, 2015, 10:46:00 PM
    Author     : Joel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Main</title>
    </head>
    <body>
        <h1>Login</h1>
        <%
            Vendor currentVendor = (Vendor)session.getAttribute("currentVendor");
            Supplier currentSupplier = (Supplier)session.getAttribute("currentSupplier");
            String errorMsg = (String)request.getAttribute("errorMsg");
                
        %>
        
        <%
            if(currentVendor == null && currentSupplier == null){
        %>
        <div>
            <!--<p>Supplier Login</p>-->
            <p>Login</p>
            <form action ="LoginServlet" method="POST">
                <!--
                <input type="text" value="supplierName" placeholder="Enter username"></br>
                <input type="text" value="supplierPw" placeholder="Enter password"></br>
                -->
                <input type="text" value="username" placeholder="Enter username"></br>
                <input type="text" value="password" placeholder="Enter password"></br>
                <input type="submit" value="submit1">
            </form>
        </div>
        <!--
        <div> 
            <p>Vendor Login</p>
            <form action ="LoginServlet" method="POST">
                <input type="text" value="vendorName" placeholder="Enter username"></br>
                <input type="text" value="vendorrPw" placeholder="Enter password"></br>
                <input type="submit" value="submit2">
            </form>
        </div>
        -->
        <%
            }  
        %>
    </body>
</html>
