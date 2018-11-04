<%-- 
    Document   : ManageAddFood
    Created on : Oct 28, 2018, 10:22:51 AM
    Author     : Funmilola
--%>

<%@page import="dao.FoodDataAccess"%>
<%@page import="bean.Food"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User Manager</title>
    </head>
    <body>
        <%
            if(session.getAttribute("username") == null){
                response.sendRedirect(request.getContextPath());
            } 
            String finame = request.getParameter("finame");
            double price = Double.parseDouble(request.getParameter("price"));
            int qty = Integer.parseInt(request.getParameter("qty"));
            String description = request.getParameter("description");
            Food f = new Food(0 , finame,price, qty, description) ;
            FoodDataAccess fd = new FoodDataAccess() ;
            fd.addFood(f);
            String url = request.getContextPath() + "/fooditem/AllFood" ;
            response.sendRedirect(url);
            
        %>
    </body>
</html>
