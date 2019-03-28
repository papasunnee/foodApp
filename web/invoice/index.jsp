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
      <h6 class="text-success" style="float : right">
          <span class="text-muted">
              <%
                out.println(session.getAttribute("user_type")) ;
              %>:
          </span>
          <%
              out.println(session.getAttribute("username")) ;
          %>
      </h6>
         <sql:query dataSource="${ds}" var="myresult">
                SELECT * from users;
          </sql:query>
         <form name="invoice_form" class="form-inline" action="AllInvoice" method="post">
             <input type="hidden" name="currentUserId" value="<%= session.getAttribute("user_id") %>" />
             
              <label for="invoiceoption" class="mr-sm-2">Select Invoice to View</label>
              <select name="invoiceoption" class="form-control mb-2 mr-sm-2">
                 <%
                    if((int)session.getAttribute("user_role_id") < 2){
                 %>
                    <option value="-1">All</option>
                
                    <c:forEach var="row" items="${myresult.rows}">
                        <option value='<c:out value="${row.id}"/>' > <c:out value="${row.fname} ${row.lname}"/> </option>
                    </c:forEach>
                    <%
                        } else {
                    %>
                    <option value="<%= session.getAttribute("user_id") %>">Personal</option>
                    <%
                        } 
                    %>
              </select>
            
            <button type="submit" class="btn btn-success mb-2">View Invoices</button>
        </form>
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
                <th><a class="btn btn-secondary" href="javascript:void(0);" style="font-size:18px;" id="addMore" title="Add More Person"><span class="glyphicon glyphicon-plus">Add Item</span></a></th>
            </tr>
            <tr>
                <td>
                    <select name="designation" class="form-control">
                        <option value="-1" name="itemid" selected>Select Food Item</option>
                            <c:forEach var="row" items="${result.rows}">
                                <option value='<c:out value="${row.id}"/>' <c:if test = "${row.quantity == 0}">disabled</c:if>  data-price='<c:out value="${row.price}"/>' data-label='<c:out value="${row.finame}"/>' data-quantity='<c:out value="${row.quantity}"/>'> <c:out value="${row.finame}-(${row.quantity})"/> </option>
                            </c:forEach>
                    </select>
                </td>
                <td><input type="number" min="0" name="quantity" id="quantity" class="form-control" oninput="this.value = Math.abs(this.value)"></td>
                <td><input type="text" name="price" id="price" class="form-control" readonly value="0"/></td>
                <td><input type="text" name="totalprice" id="totalprice" class="form-control" readonly value="0"/></td>
                <td></td>
            </tr>
        </table>
            <div class="invoicedetail">
                
            </div>

        <button type="button" name="createInvoice" id="createInvoice" class="btn btn-success">Create Invoice</button>
      </form>
    </main>
        
    <jsp:include page="/footer.jsp" />

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
 
<script>
$(function(){
    var sales = [] ;
    $("#quantity").attr("disabled", true) ;      
    $('#addMore').on('click', function() {
//              var data = $("#tb tr:eq(1)").clone(true).appendTo("#tb");
//              data.find("input").val('');
                var qty = $("input#quantity").val() ;
                var p = $("input#price").val() ;
                var tp =$("input#totalprice").val() ;
                var dl = $("select").find('option:selected')[1].dataset.label;
                var item_id = $("select").find('option:selected')[1].value ;
                if( p == 0 || tp == 0 || isNaN(tp) || p == null){
                    alert("Please Input all necessary values") ;
                }else{
                    let detail = {
                        id : item_id,
                        price : p,
                        quantity : qty,
                        totalprice : tp,
                        fooditem : dl
                    } ;
                    sales.push(detail) ;
                    var total = 0 ;
                    var text = "<table  class='table table-hover small-text'>" ;
                    text += sales.map(function(sale){
                              total = parseFloat(sale.totalprice) + total ;
                              return "<tr><td>"+sale.quantity+"</td><td>"+sale.fooditem+"</td><td>"+sale.price+"</td><td>"+sale.totalprice+"</td></tr>" ;
                        });
                        text+= "<tr><td colspan='4' style='text-align:right'>Total : "+total+"</td></tr>" ;
                        text += "</table>" ;
                    $("div.invoicedetail").html(text) ;
                    $("input#price").val(0) ;
                    $("input#totalprice").val(0) ;
                    $("input#quantity").val(null) ;
                    $("select").val(-1);
                }
     });
     
      $('#createInvoice').on('click', function() {
          if(sales.length > 0){
           $.post("${pageContext.request.contextPath}/invoice/ManageAddInvoice.jsp",{invoice_detail : JSON.stringify(sales)} ,function(data, status){
            sales = [] ;
            if(status == "success"){ 
                alert("Invoice Successfully Created") ;
                location.href = "${pageContext.request.contextPath}/invoice/index.jsp" ;
            }
          });
        } 
        else{
            alert('Add an item to the list') ;
        }
      }) ;
     
      $("select").on("change", function(e){
          if($(this).val() == -1){
              $("#quantity").attr("disabled", "true") ;
          }else
          {
              $("#quantity").removeAttr("disabled") ;
          }
            var price = $("select").find('option:selected')[1].dataset.price;
            $("input#price").val(price) ;
            $("input#totalprice").val(0) ;
            $("input#quantity").val(null) ;
      });
      
      $("#quantity").on("change", function(e){
            var quantity = $("select").find('option:selected')[1].dataset.quantity ;
            if($(this).val()=== null){
                $("input#totalprice").val(0) ;
                $("input#quantity").val(0) ;
            }
            else if($(this).val() > quantity){
                alert("Product Quantity Insufficient") ;
                $("input#totalprice").val(0) ;
                $("input#quantity").val(null) ;
            }
            else
            {
//                var price = $("select").find('option:selected').data("price") ;
                  var price = $("select").find('option:selected')[1].dataset.price;
                 var qty = $("input#quantity").val() ;
                $("input#totalprice").val(parseFloat(price)*qty) ;
            }
      });
      
      
      $("#quantity").on("keyup", function(e){
            var quantity = $("select").find('option:selected')[1].dataset.quantity ;
            if($(this).val()== null){
                $("input#totalprice").val(0) ;
                $("input#quantity").val(0) ;
            }
            else if($(this).val() > quantity){
                alert("Product Quantity Insufficient") ;
                $("input#totalprice").val(0) ;
                $("input#quantity").val(null) ;
            }
            else
            {
                var price = $("select").find('option:selected')[1].dataset.price;
                 var qty = $("input#quantity").val() ;
                $("input#totalprice").val(parseFloat(price)*qty) ;
            }
      });
});      
</script>
  </body>
</html>
