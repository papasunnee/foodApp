<%-- 
    Document   : Supply Index
    Created on : Oct 29, 2018, 1:30:15 PM
    Author     : Funmilola
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Supplier :: FoodStore App</title>
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
      <h1 class="mt-5">Create New Supplier</h1>
      <form name="create_supplier" id="create_supplier" action="${pageContext.request.contextPath}/supplier/ManageAddSupplier.jsp" method="post">
         <div class="form-group">
            <label for="suppliername">Supplier's Name</label>
            <input type="text" required name="suppliername"class="form-control" id="suppliername" placeholder="Supplier's Name">
          </div>
         
         <div class="form-group">
            <label for="supplierphone">Supplier's Phone</label>
            <input type="text"  required name="supplierphone" id="supplierphone" class="form-control" id="supplierphone" placeholder="Supplier's Phone">
          </div>
         
         <div class="form-group">
            <label for="supplieraddress">Supplier's Address</label>
            <input type="text" required name="supplieraddress"class="form-control" id="supplieraddress" placeholder="Supplier's Address">
          </div>
         
         
        <button type="submit" name="insert" class="btn btn-primary">Create Supplier</button>
        <a href="${pageContext.request.contextPath}/supplier/AllSupplier"  class="btn btn-success">View Supplier List</a>
      </form>
    </main>

    <footer class="footer">
      <div class="container">
        <span class="text-muted">Olufunmilola Oroniran</span>
      </div>
    </footer>
     <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Create User Error</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p class="errorModal"></p>
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
        function validatePhone(phone){
            return /^\d{11}$/g.test(phone) ;
        }
        $(document).ready(function(){
            var contextPath = "${pageContext.request.contextPath}" ;
            var modal = '<%= request.getParameter("error")%>' ;
            if(modal === "e4cba4de95045a6745685f7ffd4abe1f"){
                modal = "clear" ;
                $(".errorModal").html("Application Requires Unique Supplier Name") ;
                $("#exampleModal").modal("show") ;
            }
            
            $("#exampleModal").on("hidden.bs.modal", function(){
                console.log("clear") ;
                if(modal === "clear"){
                 location.href = contextPath + "/supplier" ;   
                }
            }) ; 
            
            $("#create_supplier").on("submit", function(e){
               e.preventDefault() ;
               if(validatePhone(document.getElementById("supplierphone").value)){
                   this.submit() ;
               }
               else
               {
                   alert("Invalid Phone Number") ;
               }
            });
        });
    </script>
  </body>
</html>
