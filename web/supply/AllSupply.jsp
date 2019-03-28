<%-- 
    Document   : FoodStore App
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

    <title>Supply List :: FoodStore App</title>
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
      <h1 class="mt-5">List of Supplies</h1>
      <a href="index.jsp" name="add_new_supply" class="mt-3 mb-3 btn btn-success">Add New Supply</a>
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Supplier's Name</th>
            <th scope="col">Food Item Name</th>
            <th scope="col">Quantity</th>
            <th scope="col">Price</th>
            <th scope="col">Supply Date</th>
            <th scope="col">Modify</th>
          </tr>
        </thead>
        <tbody>
            <c:forEach items="${AllSupply}" var="s">
                <tr>
                <th scope="row">${s.id}</th>
                <td>${s.suppliername}</td>
                <td>${s.finame}</td>
                <td>${s.quantity}</td>
                <td>${s.price}</td>
                <td>${s.supplieraddress}</td>
                <td><a href="edit?id=${s.id}">Edit</a> 
<!--                    | 
                <a href="delete?id=${s.id}">Delete</a>-->
                </td>

            </tr>
            </c:forEach>
        </tbody>
      </table>
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
