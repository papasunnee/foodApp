<%-- 
    Document   : ManageAddFood
    Created on : Oct 28, 2018, 10:22:51 AM
    Author     : Funmilola
--%>

<%@page import="bean.Supplier"%>
<%@page import="dao.FoodDataAccess"%>
<%@page import="dao.SupplierDataAccess"%>
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
            String suppliername = request.getParameter("suppliername");
            String supplierphone = request.getParameter("supplierphone");
            String supplieraddress = request.getParameter("supplieraddress");
            
            Supplier s = new Supplier(0, suppliername, supplierphone, supplieraddress) ;
            
            SupplierDataAccess sd = new SupplierDataAccess() ;
            sd.addSupplier(s);
            String url = request.getContextPath() + "/supplier/AllSupplier" ;
            response.sendRedirect(url);
            
        %>
    </body>
</html>
