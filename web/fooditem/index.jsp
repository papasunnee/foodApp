<%-- 
    Document   : FoodStore App
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

    <title>Food Item :: FoodStore App</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/sticky-footer-navbar.css" rel="stylesheet">
  </head>

  <body>
      <%
        if(session.getAttribute("username") == null || session.getAttribute("user_role_id") == null){
        
            response.sendRedirect(request.getContextPath());
        }   
        if((int)session.getAttribute("user_role_id") > 1){
            response.sendRedirect(request.getContextPath() + "/fooditem/AllFood") ;
        }
      %>
      
      <jsp:include page="/loginHeader.jsp" />

    <!-- Begin page content -->
    <main role="main" class="container">
      <h1 class="mt-5">Create New Food Item</h1>
      <form class="createFoodItem" name="create_food_item" action="${pageContext.request.contextPath}/fooditem/ManageAddFood.jsp" method="post">
         <div class="form-group">
            <label for="fooditemname">Food Item Name</label>
            <input type="text" required name="finame"class="form-control" id="fooditemname" placeholder="Food Item Name">
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="fooditemquantity">Quantity</label>
              <input type="number" min="0" name="qty"class="form-control" required id="fooditemquantity" placeholder="Quantity" readonly value="0">
            </div>
            <div class="form-group col-md-6">
              <label for="price">Unit Price</label>
              <input type="number" min="0" step="0.01" required name="price" class="form-control" id="price" placeholder="Price">
            </div>
        </div>
        <div class="form-group">
          <label for="description">Food Item Description</label>
          <input type="text" name="description" class="form-control" id="description" placeholder="Description">
        </div>
         <button type="submit" name="insert" class="btn btn-primary" >Create Food Item</button>
        <a href="${pageContext.request.contextPath}/fooditem/AllFood"  class="btn btn-success">View Food Items</a>
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
              <h5 class="modal-title" id="exampleModalLabel">Food Item Error</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>Sorry, Food Item Already Exists</p>
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
         $(document).ready(function(){
            var contextPath = "${pageContext.request.contextPath}" ;
            var modal = '<%= request.getParameter("error")%>' ;
            if(modal === "$2y$12$rMTLFa37d2hbtt.ASXI3XOA.Up5h.yxE72vVS/gOyD9NS8DoaF9Yq"){
                $("#exampleModal").modal("show") ;
            }
            
            $("#exampleModal").on("hidden.bs.modal", function(){
                location.href = contextPath + "/fooditem" ;
            }) ; 
         }) ;
    </script>
  </body>
</html>
