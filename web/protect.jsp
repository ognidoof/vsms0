<%
    String cv = (String) session.getAttribute("currentVendor");
    String sv = (String) session.getAttribute("currentSupplier");

    if (cv == null && sv == null) {
        response.sendRedirect("LoginMain.jsp?errorMsg=Please login to continue.");
        return;
    }
%>
