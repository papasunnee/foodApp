<%-- 
    Document   : ManageEdit
    Created on : Oct 28, 2018, 12:14:49 PM
    Author     : Funmilola
--%>

<%@page import="dao.SupplyDataAccess"%>
<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Supplier :: FoodStore App</title>
    </head>
    <body>
        <%
            if(session.getAttribute("username") == null){
                response.sendRedirect(request.getContextPath());
            }  
       
            double price = Double.parseDouble(request.getParameter("price"));
            int id = Integer.parseInt(request.getParameter("id"));
            
            SupplyDataAccess sd = new SupplyDataAccess() ;
            sd.edit(id, price);
            String url = request.getContextPath() + "/supply/AllSupply" ;
            response.sendRedirect(url);
            
        %>
    </body>
</html>
