<%-- 
    Document   : ManageEdit
    Created on : Oct 28, 2018, 12:14:49 PM
    Author     : Funmilola
--%>

<%@page import="dao.UserDataAccess"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User Manager</title>
    </head>
    <body>
        <%
            if(session.getAttribute("username") == null){
                response.sendRedirect(request.getContextPath());
            }
            int id = Integer.parseInt(request.getParameter("id"));
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String mname = request.getParameter("mname");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            int role_id = Integer.parseInt(request.getParameter("role_id"));

            UserDataAccess ud = new UserDataAccess() ;
            ud.edit(fname, lname, mname, address, password, gender, role_id, id);
            String url = request.getContextPath() + "/user/AllUser" ;
            response.sendRedirect(url);
            
        %>
    </body>
</html>
