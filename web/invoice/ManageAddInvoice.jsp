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
            int user_id = (int)session.getAttribute("user_id") ;
            System.out.println(request.getParameter("invoice_detail") + " invoice_detailp") ;
            String invoice_detail = request.getParameter("invoice_detail");
            Invoice inv = new Invoice(0, invoice_detail, user_id) ;
            InvoiceDataAccess invd = new InvoiceDataAccess() ;
            invd.addInvoice(inv) ;
            String url = request.getContextPath() + "/invoice/AllInvoice" ;
            response.sendRedirect(url);
            
        %>
    </body>
</html>
