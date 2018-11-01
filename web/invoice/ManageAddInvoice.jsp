<%-- 
    Document   : ManageAddFood
    Created on : Oct 28, 2018, 10:22:51 AM
    Author     : Funmilola
--%>

<%@page import="dao.FoodDataAccess"%>
<%@page import="dao.SupplyDataAccess"%>
<%@page import="bean.Supply"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User Manager</title>
    </head>
    <body>
        <% 
            int itemid = Integer.parseInt(request.getParameter("itemid"));
            int supplierid = Integer.parseInt(request.getParameter("supplierid"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            
            Supply s = new Supply(0, itemid, quantity, price, supplierid) ;
            
            SupplyDataAccess sd = new SupplyDataAccess() ;
            sd.addSupply(s);
            FoodDataAccess fd = new FoodDataAccess() ;
            fd.updateFoodQuantity(itemid , quantity, price) ;
            String url = request.getContextPath() + "/supply/AllSupply" ;
            response.sendRedirect(url);
            
        %>
    </body>
</html>
