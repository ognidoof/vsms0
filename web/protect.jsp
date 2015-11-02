<%
    String cv = (String) session.getAttribute("currentVendor");

    if (cv == null) {
        response.sendRedirect("LoginMain.jsp?errorMsg=Please login to continue.");
        return;
    }
%>
