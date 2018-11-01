<%-- 
    Document   : home
    Created on : Oct 23, 2018, 12:40:10 PM
    Author     : Funmilola
--%>

 <%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="bean.User"
   %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>

            <% 
                if(null == session.getAttribute("currentSessionUser")){
                    response.sendRedirect("index.jsp");
                }
                else
                {
                User currentUser = (User) session.getAttribute("currentSessionUser");

            %>	
             Welcome <%= currentUser.getId()%>
             <% }
             %>
             
             <a href="logout.jsp">Logout</a>
    </body>
</html>
