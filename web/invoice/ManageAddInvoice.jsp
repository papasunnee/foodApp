<%-- 
    Document   : ManageAddFood
    Created on : Oct 28, 2018, 10:22:51 AM
    Author     : Funmilola
--%>

<%@page import="dao.InvoiceDataAccess"%>
<%@page import="bean.Invoice"%>
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
            String invoice_detail = request.getParameter("invoice_detail");
            String customerName = request.getParameter("customerName");
            Invoice inv = new Invoice(0, invoice_detail, user_id, customerName) ;
            InvoiceDataAccess invd = new InvoiceDataAccess() ;
            int resp = invd.addInvoice(inv) ;
            System.out.println(resp) ;
//            String url = request.getContextPath() + "/invoice/AllInvoice" ;
//            response.sendRedirect(url);
            
        %>
    </body>
</html>
