<%
    String cven = (String) session.getAttribute("currentVendor");

    if (cven == null) {
        response.sendRedirect("LoginMain.jsp?errorMsg=Please login to continue.");
        return;
    }
%>
