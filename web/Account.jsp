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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
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
                %><%=s.getSupName()%><%
                %><p> <input  class="btn btn-primary btn-lg" type="button" onclick="location.href = 'Account.jsp?id=<%= s.getId()%>&resent=false';" value="Delete from Favourites" />
                            </p><%
            }
        
        
        
        
        %>
    </body>
</html>
