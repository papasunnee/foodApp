<%-- 
    Document   : FoodStore App
    Created on : Oct 29, 2018, 1:30:15 PM
    Author     : Funmilola
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>All Invoice :: FoodStore App</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/sticky-footer-navbar.css" rel="stylesheet">
  </head>

  <body>

    <jsp:include page="/loginHeader.jsp" />
    <%
        if(session.getAttribute("username") == null){
            response.sendRedirect(request.getContextPath());
        }   
    %>

    <!-- Begin page content -->
    <main role="main" class="container">
      <h1 class="mt-5">List of All Invoices</h1>
      <a href="index.jsp" name="add_new_supplier" class="mt-3 mb-3 btn btn-success">
          Create New Invoice</a>
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Invoice Detail</th>
            <th scope="col">User Name</th>
            <th scope="col">Invoice Date</th>
            <th scope="col">View</th>
          </tr>
        </thead>
        <tbody>
            <c:forEach items="${AllInvoice}" var="i">
                <tr>
                <th scope="row">${i.id}</th>
                <td>${i.invoice_detail}</td>
                <td>${i.user_id}</td>
                <td>${i.date_created}</td>
                <td><button class="btn btn-link viewInvoice" name="viewInvoice" onclick='displayInvoice(${i.invoice_detail})' id="${i.invoice_detail}">View</button> 
                    <!--| <a href="delete?id=${s.id}">Delete</a>-->
                </td>

            </tr>
            </c:forEach>
        </tbody>
      </table>
    </main>

    <jsp:include page="/footer.jsp" />
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Invoice Summary</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p class="invoiceContent"></p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script>
        function displayInvoice(invoice_detail){
            var total = 0 ;
             var text = "<table  class='table table-hover small-text'>" ;
                text += invoice_detail.map(function(invoice){
                          total = parseFloat(invoice.totalprice) + total ;
                          return "<tr><td>"+invoice.quantity+"</td><td>"+invoice.fooditem+"</td><td>"+invoice.price+"</td><td>"+invoice.totalprice+"</td></tr>" ;
                    });
                    text+= "<tr><td colspan='4' style='text-align:right'>Total : "+total+"</td></tr>" ;
                    text += "</table>" ;
            $(".invoiceContent").html(text) ;
            $("#exampleModal").modal("show") ;
            console.log(invoice_detail) ;
        }
        $(document).ready(function(){
           
            if(modal === "e4cba4de95045a6745685f7ffd4abe1f"){
                modal = "clear" ;
                $(".invoiceContent").html("Application Requires Unique Email") ;
                $("#exampleModal").modal("show") ;
            }
            
            $("#exampleModal").on("hidden.bs.modal", function(){
                console.log("clear") ;
                if(modal === "clear"){
                 location.href = contextPath + "/user" ;   
                }
            }) ; 
        });

        
    </script>
  </body>
</html>
