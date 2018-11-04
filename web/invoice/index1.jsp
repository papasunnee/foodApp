<%-- 
    Document   : Supply Index
    Created on : Oct 29, 2018, 1:30:15 PM
    Author     : Funmilola
--%>
<%@page import="bean.User"%>
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

    <title>Invoice :: FoodStore App</title>
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
      <h1 class="mt-5">Create New Invoice</h1>
      <h6 class="text-success">
          <span class="text-muted">
              <%
                out.println(session.getAttribute("user_type")) ;
              %>:
          </span>
          <%
              out.println(session.getAttribute("username")) ;
          %>
      </h6>
      <form name="create_supply" action="${pageContext.request.contextPath}/supply/ManageAddInvoice.jsp" method="get">
        <sql:query dataSource="${ds}" var="result">
            SELECT * from fooditem;
        </sql:query>
        <table  class="table table-hover small-text" id="tb">
            <tr class="tr-header">
                <th>Food Item Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total Cost</th>
                <th><a href="javascript:void(0);" style="font-size:18px;" id="addMore" title="Add More Person"><span class="glyphicon glyphicon-plus">d</span></a></th>
            </tr>
            <tr>
                <td>

                    <select name="designation[]" class="form-control">
                        <option value="" name="itemid" selected>Select Food Item</option>
                            <c:forEach var="row" items="${result.rows}">
                                <option value='<c:out value="${row.id}"/>' price='<c:out value="${row.price}"/>'> <c:out value="${row.finame}"/> </option>
                            </c:forEach>
                    </select>
                </td>
                <td><input type="text" name="quantity[]" class="form-control"></td>
                <td><input type="text" name="price[]" class="form-control" readonly value="0"/></td>
                <td><input type="text" name="totalprice[]" class="form-control" readonly value="0"/></td>
                <td><a href='javascript:void(0);'  class='remove'><span class='glyphicon glyphicon-remove'>x</span></a></td>
            </tr>
        </table>

        <button type="submit" name="insert" class="btn btn-success">Create Invoice</button>
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
 
<script>
$(function(){
    $('#addMore').on('click', function() {
              var data = $("#tb tr:eq(1)").clone(true).appendTo("#tb");
              data.find("input").val('');
     });
     $(document).on('click', '.remove', function() {
         var trIndex = $(this).closest("tr").index();
            if(trIndex>1) {
             $(this).closest("tr").remove();
           } else {
             alert("Sorry!! Can't remove first row!");
           }
      });
      $("select").on("change", function(e){
          console.log(e) ;
      });
});      
</script>
  </body>
</html>
