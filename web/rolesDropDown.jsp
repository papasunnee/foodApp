<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/food_app" user="root" password=""/>
<sql:query dataSource="${ds}" sql="SELECT id,name from roles" var="result"/>
<div class="form-group col-md-6">
      <label for="role">User Role</label>
      <select name="role_id" class="form-control">
          <c:forEach var="row" items="${result.rows}">
              <option value='<c:out value="${row.id}"/>'> <c:out value="${row.name}"/> </option>
          </c:forEach>
      </select>
</div>