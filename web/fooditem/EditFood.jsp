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

    <title>Edit Food Item :: FoodStore App</title>
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
      <h1 class="mt-5">Edit Food Item</h1>
      <c:forEach items="${getFoodById}" var="f">
      <form name="create_food_item" action="ManageEditFood.jsp" method="post">
         <input type="hidden" name="id" value="${f.id}" />
         <div class="form-group">
            <label for="fooditemname">Food Item Name</label>
            <input type="text" required name="finame"class="form-control" id="fooditemname" placeholder="Food Item Name" readonly value="${f.finame}">
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="fooditemquantity">Quantity</label>
              <input type="number" min="0" name="qty"class="form-control" required id="fooditemquantity" placeholder="Quantity" value="${f.qty}">
            </div>
            <div class="form-group col-md-6">
              <label for="price">Unit Price</label>
              <input type="number" min="0" step=".01" required name="price" class="form-control" id="price" placeholder="Price" value="${f.price}">
            </div>
        </div>
        <div class="form-group">
          <label for="description">Food Item Description</label>
          <input type="text" name="description" class="form-control" id="description" placeholder="Description" value="${f.description}">
        </div>
        
        <button type="submit" name="update" class="btn btn-primary">Update Food Item</button>
        <a href="${pageContext.request.contextPath}/fooditem/AllFood"  class="btn btn-success">View Food Items</a>
      </form>
      </c:forEach>
    </main>

    <footer class="footer">
      <div class="container">
        <span class="text-muted">Olufunmilola Oroniran</span>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  </body>
</html>
