<%-- 
    Document   : ManageAddFood
    Created on : Oct 28, 2018, 10:22:51 AM
    Author     : Funmilola
--%>

<%@page import="dao.InvoiceDataAccess"%>
<%@page import="bean.Invoice"%>
<%@page import="dao.FoodDataAccess"%>
<%@page import="dao.SupplyDataAccess"%>
<%@page import="bean.Supply"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Invoice</title>
    </head>
    <body>
    <%
            if(session.getAttribute("username") == null){
                response.sendRedirect(request.getContextPath());
            }   
            System.out.println(request.getParameter("invoice_detail") + " invoice_detail") ;
            String invoice_detail = request.getParameter("invoice_detail");
            Invoice inv = new Invoice(0, invoice_detail, 1) ;
            InvoiceDataAccess invd = new InvoiceDataAccess() ;
            invd.addInvoice(inv) ;
            String url = request.getContextPath() + "/invoice/AllInvoice" ;
            response.sendRedirect(url);
            
        %>
    </body>
</html>
