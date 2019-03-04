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

    <title>Edit User Item :: FoodStore App</title>
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
      <h1 class="mt-5">Edit User</h1>
      <c:forEach items="${getUserById}" var="u">
      <form name="create_food_item" action="ManageEditUser.jsp" method="post">
        <input type="hidden" name="id" value="${u.id}" />   
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="firstname">First Name</label>
              <input type="text" name="fname"class="form-control" value="${u.fname}" required id="firstname" placeholder="First Name"/>
            </div>
              
            <div class="form-group col-md-4">
              <label for="lastname">Last Name</label>
              <input type="text" name="lname"class="form-control" value="${u.lname}" required id="lastname" placeholder="Last Name"/>
            </div>
              
            <div class="form-group col-md-4">
              <label for="middlename">Middle Name</label>
              <input type="text" name="mname" value="${u.mname}" class="form-control" id="middlename" placeholder="Middle Name"/>
            </div>
          </div>
         
         <div class="form-row">
            <div class="form-group col-md-6">
              <label for="phone">Phone Number</label>
              <input type="text" name="phone"class="form-control" readonly value="${u.phone}" required id="phone" placeholder="Phone"/>
            </div>
              
            <div class="form-group col-md-6">
              <label for="email">Email</label>
              <input type="email" name="email" value="${u.email}" readonly class="form-control" required id="email" placeholder="Email"/>
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
          <input type="text" name="address" value="${u.address}" class="form-control" id="address" placeholder="Address">
        </div>
        
        <div class="form-row">
          <div class="form-group col-md-6">
                <label for="username">Username</label>
                <input type="text" name="username" value="${u.username}" readonly class="form-control" id="username" required placeholder="Username"/>
          </div>
          <jsp:include page="/rolesDropDown.jsp" />
        </div>
          
        <div class="form-row">
            <div class="form-group col-md-6">
              <label for="password">Password</label>
              <input type="password" name="password" value="${u.password}" class="form-control" id="password" required placeholder="Password">
            </div>
              
            <div class="form-group col-md-6">
              <label for="password">Confirm Password</label>
              <input type="password" name="cpassword" value="${u.password}" class="form-control" id="cpassword" required placeholder="Password">
            </div>
          </div>
          
<!--          <div class="form-group">
            <label for="username">Employment Date</label>
            <input type="date" name="empDate" class="form-control" required id="empDate" placeholder="Employment Date"/>
          </div>-->
          
        <button type="submit" name="updateUser" class="btn btn-primary">Update User</button>
        <a href="${pageContext.request.contextPath}/user/AllUser"  class="btn btn-success">View Users</a>
        <br/><br/><br/>
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
