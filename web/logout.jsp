<%-- 
    Document   : logout
    Created on : Oct 25, 2018, 9:49:50 PM
    Author     : Funmilola
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
        <%
            session.setAttribute("currentSessionUser", null) ;
            session.invalidate();
            response.sendRedirect("index.jsp");
            %>
        <h1>Hello World!</h1>
    </body>
    <script type="text/javascript">
        window.history.forward();
        function noBack() { window.history.forward(); }
    </script>
</html>
