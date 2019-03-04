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
        <title>Add Food Manager</title>
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
            Food f = new Food(0 , finame, price, qty, description) ;
            FoodDataAccess fd = new FoodDataAccess() ;
            int index = fd.addFood(f) ;
            String url = request.getContextPath() + "/fooditem/" ;
            if( index == -5)
            {
                url = request.getContextPath() + "/fooditem/?error=$2y$12$rMTLFa37d2hbtt.ASXI3XOA.Up5h.yxE72vVS/gOyD9NS8DoaF9Yq" ;
                request.getSession().setAttribute("uniqueFiname", "Food Item Already Exists");
                
            }
            else if(index > 0){
                url = request.getContextPath() + "/fooditem/AllFood" ;
            }
            response.sendRedirect(url);
        %>
    </body>
</html>
