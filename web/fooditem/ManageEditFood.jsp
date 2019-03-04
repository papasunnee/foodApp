<%-- 
    Document   : ManageEdit
    Created on : Oct 28, 2018, 12:14:49 PM
    Author     : Funmilola
--%>

<%@page import="dao.FoodDataAccess"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Food Manager</title>
    </head>
    <body>
        <%
            if(session.getAttribute("username") == null){

                  response.sendRedirect(request.getContextPath());
            }
            int id = Integer.parseInt(request.getParameter("id"));
            String finame = request.getParameter("finame");
            double price = Double.parseDouble(request.getParameter("price"));
            int qty = Integer.parseInt(request.getParameter("qty"));
            String description = request.getParameter("description");

            FoodDataAccess fd = new FoodDataAccess() ;
            fd.edit(id, finame, price, qty, description);
            String url = request.getContextPath() + "/fooditem/AllFood" ;
            response.sendRedirect(url);
            
        %>
    </body>
</html>
