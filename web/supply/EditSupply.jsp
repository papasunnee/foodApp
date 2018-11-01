<%-- 
    Document   : demo
    Created on : Oct 29, 2018, 1:30:15 PM
    Author     : Funmilola
--%>

<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Edit Supplier :: FoodStore App</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/sticky-footer-navbar.css" rel="stylesheet">
  </head>

  <body>
      <% 
            if(null == session.getAttribute("currentSessionUser")){
                response.sendRedirect(request.getContextPath());
            }
            else
            {
            User currentUser = (User) session.getAttribute("currentSessionUser");
            }

        %>

    <header>
      <!-- Fixed navbar -->
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="#">FoodStore App</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">Disabled</a>
            </li>
          </ul>
          <form class="form-inline mt-2 mt-md-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form>
        </div>
      </nav>
    </header>

    <!-- Begin page content -->
    <main role="main" class="container">
      <h1 class="mt-5">Edit Supplier</h1>
      <c:forEach items="${getSupplierById}" var="s">
      <form name="create_food_item" action="ManageEditSupplier.jsp" method="post">
         <input type="hidden" name="id" value="${s.id}" />
         <div class="form-group">
            <label for="suppliername">Supplier's Name</label>
            <input type="text" required name="suppliername"class="form-control" id="suppliername" placeholder="Supplier's Name" value="${s.suppliername}">
          </div>
          
          <div class="form-group">
            <label for="supplierphone">Supplier's Phone</label>
            <input type="text" required name="supplierphone"class="form-control" id="supplierphone" placeholder="Supplier's Phone" value="${s.supplierphone}">
          </div>
          
          <div class="form-group">
            <label for="supplieraddress">Supplier's Address</label>
            <input type="text" required name="supplieraddress"class="form-control" id="supplieraddress" placeholder="Supplier's Address" value="${s.supplieraddress}">
          </div>
          
        
        <button type="submit" name="update" class="btn btn-primary">Update Supplier</button>
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
