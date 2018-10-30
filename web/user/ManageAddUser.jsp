<%-- 
    Document   : ManageAddUser
    Created on : Oct 28, 2018, 3:11:36 PM
    Author     : Sunday
--%>

<%@page import="dao.UserDataAccess"%>
<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String mname = request.getParameter("mname");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            int roleId = Integer.parseInt(request.getParameter("roleId")) ;
            String gender = request.getParameter("gender");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
//            String empDate = request.getParameter("empDate");
//            String dob = request.getParameter("dob");
            
            
            User u = new User(0, fname, lname,  mname, phone, email, address, username,  password, gender, roleId) ;
            UserDataAccess ud = new UserDataAccess() ;
            ud.addUser(u);
            String url = request.getContextPath() + "/user/AllUser" ;
            response.sendRedirect(url);
            
        %>
    </body>
</html>
