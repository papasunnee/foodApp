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

    <title>List of Food :: FoodStore App</title>
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
      <h1 class="mt-5">List of Created Food Item</h1>
       <%
            if((int)session.getAttribute("user_role_id") < 2){
       %>
                <a href="index.jsp" name="add_new_fooditem" class="mt-3 mb-3 btn btn-success">Add New Food Item</a>
      <%
          }
      %>
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Food Item Name</th>
            <th scope="col">Unit Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Description</th>
            <%
                if((int)session.getAttribute("user_role_id") < 2){
            %>
            <th scope="col">Modify</th>
            <%
                }
            %>
          </tr>
        </thead>
        <tbody>
            <c:forEach items="${AllFood}" var="f">
                <tr>
                <th scope="row">${f.id}</th>
                <td>${f.finame}</td>
                <td>${f.price}</td>
                <td>${f.qty}</td>
                <td>${f.description}</td>
                <%
                    if((int)session.getAttribute("user_role_id") < 2){
                %>
                <td><a href="edit?id=${f.id}">Edit</a> | 
                <a href="delete?id=${f.id}">Delete</a></td>
                <%
                    }
                %>

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
