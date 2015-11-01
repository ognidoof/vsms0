<%-- 
    Document   : LoginMain
    Created on : 21 Oct, 2015, 10:46:00 PM
    Author     : Joel
--%>

<%@page import="Entity.*"%>
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
            String currentVendor = (String)session.getAttribute("currentVendor");
            String currentSupplier = (String)session.getAttribute("currentSupplier");
            String errorMsg = (String)request.getAttribute("errorMsg");
        %>
            
        <%
            if(currentVendor == null && currentSupplier == null){
                out.println(errorMsg);
            }
        %>
        <div>
            <!--<p>Supplier Login</p>-->
            <p>Login</p>
            <form action ="LoginServlet" method="POST">
                <!--
                <input type="text" value="supplierName" placeholder="Enter username"></br>
                <input type="text" value="supplierPw" placeholder="Enter password"></br>
                -->
                <input type="text" name="username" placeholder="Enter username" required="true"></br>
                <input type="text" name="password" placeholder="Enter password" required="true"></br>
                <input type="submit" value="Submit">
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
        
    </body>
</html>
