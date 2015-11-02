<%-- 
    Document   : logout
    Created on : Nov 2, 2015, 5:45:46 PM
    Author     : TC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 

    session.invalidate();
    response.sendRedirect("LoginMain.jsp?succMsg=Logout successful.");

%>