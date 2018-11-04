<%-- 
    Document   : ManageEdit
    Created on : Oct 28, 2018, 12:14:49 PM
    Author     : Funmilola
--%>

<%@page import="dao.SupplierDataAccess"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Supplier</title>
    </head>
    <body>
     <%
        if(session.getAttribute("username") == null){
            response.sendRedirect(request.getContextPath());
        }   

            String suppliername = request.getParameter("suppliername");
            String supplierphone = request.getParameter("supplierphone");
            String supplieraddress = request.getParameter("supplieraddress");
            int id = Integer.parseInt(request.getParameter("id"));
            
            SupplierDataAccess sd = new SupplierDataAccess() ;
            sd.edit(id, suppliername, supplierphone, supplieraddress);
            String url = request.getContextPath() + "/supplier/AllSupplier" ;
            response.sendRedirect(url);
            
        %>
    </body>
</html>
