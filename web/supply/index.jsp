<%-- 
    Document   : Supply Index
    Created on : Oct 29, 2018, 1:30:15 PM
    Author     : Funmilola
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Supply :: FoodStore App</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/sticky-footer-navbar.css" rel="stylesheet">
  </head>

  <body>
      
    <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/food_app" user="root" password=""/>
 
     <jsp:include page="/loginHeader.jsp" />
     <%
        if(session.getAttribute("username") == null){
            response.sendRedirect(request.getContextPath());
        }   
    %>

    <!-- Begin page content -->
    <main role="main" class="container">
      <h1 class="mt-5">Create New Supply</h1>
      <form name="create_supply" action="${pageContext.request.contextPath}/supply/ManageAddSupply.jsp" method="post">
         <div class="form-group">
            <sql:query dataSource="${ds}" var="result">
                SELECT * from fooditem;
            </sql:query>
            <label for="fooditemname">Suppy Name</label>
            <select class="form-control" name="itemid">
                <c:forEach var="row" items="${result.rows}">
                    <option value='<c:out value="${row.id}"/>'> <c:out value="${row.finame}"/> </option>
                </c:forEach>
            </select>
          </div>
         
         <div class="form-group">
            
            <sql:query dataSource="${ds}" var="result">
                SELECT * from supplier;
            </sql:query>
            <label for="supplierid">Supplier's Name</label>
            <select class="form-control" name="supplierid">
                <c:forEach var="row" items="${result.rows}">
                    <option value='<c:out value="${row.id}"/>'> <c:out value="${row.suppliername}"/> </option>
                </c:forEach>
            </select>
          </div>
         
         <div class="form-row">
            <div class="form-group col-md-6">
              <label for="fooditemquantity">Quantity</label>
              <input type="number" min="0" name="quantity"class="form-control" required id="fooditemquantity" placeholder="Quantity">
            </div>
            <div class="form-group col-md-6">
              <label for="price">Unit Price</label>
              <input type="number" min="0" step=".01" required name="price" class="form-control" id="price" placeholder="Price">
            </div>
         </div>
        <button type="submit" name="insert" class="btn btn-primary">Create Supply</button>
        <a href="${pageContext.request.contextPath}/supply/AllSupply" name="insert" class="btn btn-success">View Supply</a>
      </form>
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
