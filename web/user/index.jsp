<%-- 
    Document   : FoodStore App
    Created on : Oct 29, 2018, 1:30:15 PM
    Author     : Funmilola
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>User :: FoodStore App</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/sticky-footer-navbar.css" rel="stylesheet">
  </head>

  <body>
      <jsp:include page="/loginHeader.jsp"/>
      <%
      if(session.getAttribute("username") == null){
            response.sendRedirect(request.getContextPath());
        }   
      %>
    <!-- Begin page content -->
    <main role="main" class="container">
      <h1 class="mt-5">Create New User</h1>
      <form name="create_user" id="create_user" action="${pageContext.request.contextPath}/user/ManageAddUser.jsp" method="post">
         
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="firstname">First Name</label>
              <input type="text" name="fname"class="form-control" required id="firstname" placeholder="First Name"/>
            </div>
              
            <div class="form-group col-md-4">
              <label for="lastname">Last Name</label>
              <input type="text" name="lname"class="form-control" required id="lastname" placeholder="Last Name"/>
            </div>
              
            <div class="form-group col-md-4">
              <label for="middlename">Middle Name</label>
              <input type="text" name="mname" class="form-control" id="middlename" placeholder="Middle Name"/>
            </div>
          </div>
         
         <div class="form-row">
            <div class="form-group col-md-6">
              <label for="phone">Phone Number</label>
              <input type="text" name="phone"class="form-control" required id="phone" placeholder="Phone"/>
            </div>
              
            <div class="form-group col-md-6">
              <label for="email">Email</label>
              <input type="email" name="email" class="form-control" required id="email" placeholder="Email"/>
            </div>
             
          </div>
         
         <div class="form-row">
            <div class="form-group col-md-6">
              <label for="dob">Date of Birth</label>
              <input type="date" name="dob" class="form-control" id="dob" placeholder="Date of Birth"/>
            </div>
              
            <div class="form-group col-md-6">
              <label for="gender">Gender</label>
                <select name="gender" class="form-control">
                    <option value="-1">Select Gender</option>
                    <option value="1">Male</option>
                    <option value="2">Female</option>
                </select>
            </div>
             
          </div>
         
        <div class="form-group">
          <label for="address">Address</label>
          <input type="text" name="address" class="form-control" id="address" placeholder="Address">
        </div>
        
        <div class="form-row">
          <div class="form-group col-md-6">
                <label for="username">Username</label>
                <input type="text" name="username" class="form-control" id="username" required placeholder="Username"/>
          </div>
          <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/food_app" user="root" password=""/>
          <sql:query dataSource="${ds}" var="result">
            SELECT id,name from roles;
          </sql:query>
          <div class="form-group col-md-6">
                <label for="role">User Role</label>
                <select name="role_id" class="form-control">
                    <c:forEach var="row" items="${result.rows}">
                        <option value='<c:out value="${row.id}"/>'> <c:out value="${row.name}"/> </option>
                    </c:forEach>
                </select>
          </div>
        </div>
          
        <div class="form-row">
            <div class="form-group col-md-6">
              <label for="password">Password</label>
              <input type="password" name="password" class="form-control" id="password" required placeholder="Password">
            </div>
              
            <div class="form-group col-md-6">
              <label for="password">Confirm Password</label>
              <input type="password" name="cpassword" class="form-control" id="cpassword" required placeholder="Password">
            </div>
          </div>
          
<!--          <div class="form-group">
            <label for="username">Employment Date</label>
            <input type="date" name="empDate" class="form-control" required id="empDate" placeholder="Employment Date"/>
          </div>-->
          
        <button type="submit" name="createUser" class="btn btn-primary">Create New User</button>
        <a href="${pageContext.request.contextPath}/user/AllUser"  class="btn btn-success">View Users</a>
        <br/><br/><br/>
      </form>
    </main>

    <jsp:include page="/footer.jsp" />
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
        $(document).ready(function(){
            var contextPath = "${pageContext.request.contextPath}" ;
            var modal = '<%= request.getParameter("error")%>' ;
            if(modal === "e4cba4de95045a6745685f7ffd4abe1f"){
                modal = "clear" ;
                $(".errorModal").html("Application Requires Unique Email") ;
                $("#exampleModal").modal("show") ;
            }
            if(modal === "eee914b1bc431b94c394813019227b37"){
                modal = "clear" ;
                $(".errorModal").html("Application Requires Unique Username") ;
                $("#exampleModal").modal("show") ;
            }
            if(modal === "080a6fef808b67abeb925db7287b1c50"){
                modal = "clear" ;
                $(".errorModal").html("Application Requires Unique Phone Number") ;
                $("#exampleModal").modal("show") ;
            }
            
            $("#exampleModal").on("hidden.bs.modal", function(){
                console.log("clear") ;
                if(modal === "clear"){
                 location.href = contextPath + "/user" ;   
                }
            }) ; 
            
            
            $("#create_user").on("submit", function(e){
               e.preventDefault() ;
               var errorMessage = "" ;
               if (!(/^[0]\d{10}$/g.test($("#phone").val()))){
                   errorMessage += "<strong style='color : red'>*</strong> Invalid Phone Number <br/>" ;
               }
               if (!(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/g.test($("#email").val()))){
                   errorMessage += "Invalid Email \n" ;
               }
               
               var username = document.getElementById("username") ;
               var firstname = document.getElementById("firstname") ;
               var lastname = document.getElementById("lastname") ;
               var el1 = document.getElementById("password") ;
               var el2 = document.getElementById("cpassword") ;
                
                if(firstname.value === "") {
                    errorMessage += "<strong style='color : red'>*</strong> Firstname cannot be blank! <br/>" ;
                }
                if(lastname.value === "") {
                    errorMessage += "<strong style='color : red'>*</strong> Lastname cannot be blank! <br/>" ;
                }
                if(username.value === "") {
                    errorMessage += "<strong style='color : red'>*</strong> Username cannot be blank! <br/>" ;
                }
                var re = /^\w+$/;
                if(!re.test(username.value)) {
                    errorMessage += "<strong style='color : red'>*</strong> Username must contain only letters, numbers and underscores! <br/>" ;
                    username.focus();
                }

                  if(el1.value !== "" && el1.value === el2.value) {
                    if(el1.value.length < 6) {
                      errorMessage += "<strong style='color : red'>*</strong> Password must contain at least six characters! <br/>" ;
                      el1.focus();
                    }
                    if(el1.value === username.value) {
                      errorMessage += "<strong style='color : red'>*</strong> Password must be different from Username! <br/>" ;
                      el1.focus();
                    }
                    re = /[0-9]/;
                    if(!re.test(el1.value)) {
                      errorMessage += "<strong style='color : red'>*</strong> password must contain at least one number (0-9)! <br/>" ;
                      el1.focus();
                    }
                    re = /[a-z]/;
                    if(!re.test(el1.value)) {
                      errorMessage += "<strong style='color : red'>*</strong> password must contain at least one lowercase letter (a-z)! <br/>" ;
                      el1.focus();
                    }
                    re = /[A-Z]/;
                    if(!re.test(el1.value)) {
                      errorMessage += "<strong style='color : red'>*</strong> password must contain at least one uppercase letter (A-Z)! <br/>" ;
                      el1.focus();
                    }
                  } else {
                    errorMessage += "<strong style='color : red'>*</strong> Please check that you've entered and confirmed your password! <br/>" ;
                    el1.focus();
                  }                
               if(errorMessage.length === 0){
                    this.submit() ;
                    return true ;
               }
               else
               {
                   $(".errorModal").html(errorMessage) ;
                   $("#exampleModal").modal("show") ;
                   return false ;
               }
                
            }) ;
        });

        
    </script>
  </body>
</html>
