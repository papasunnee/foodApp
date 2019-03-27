<%
    int timeout = session.getMaxInactiveInterval();
    response.setHeader("Refresh", timeout + "; URL = index.jsp");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>

<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="${pageContext.request.contextPath}">FoodStore App</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/fooditem">Food Items <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/invoice">Sales</a>
            </li>
            <%
                if((int)session.getAttribute("user_role_id") < 2){
            %>
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath}/supplier">Suppliers</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath}/supply">Supply</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/user">Users</a>
                    </li>    
            <%    
                 }   
            %>
<!--            <li class="nav-item">
              <a class="nav-link disabled" href="#">Disabled</a>
            </li>-->
          </ul>
          <form class="form-inline mt-2 mt-md-0">
            <!--<input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">-->
            <a class="btn btn-outline-danger my-2 my-sm-0" href="${pageContext.request.contextPath}/logout.jsp">Logout</a>
          </form>
        </div>
    </nav>
</header>