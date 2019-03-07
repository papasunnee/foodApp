<%-- 
    Document   : ManageAddUser
    Created on : Oct 28, 2018, 3:11:36 PM
    Author     : Funmilola
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
            if(session.getAttribute("username") == null){
                response.sendRedirect(request.getContextPath());
            }   

            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String mname = request.getParameter("mname");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            int roleId = Integer.parseInt(request.getParameter("role_id")) ;
            String gender = request.getParameter("gender");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            
            User u = new User(0, fname, lname,  mname, phone, email, address, username,  password, gender, roleId) ;
            UserDataAccess ud = new UserDataAccess() ;
            String url = request.getContextPath() + "/user/" ;
            int index = ud.addUser(u) ;
            System.out.println(index + " " + " ddeom") ;
            if(index > 0){
                url = request.getContextPath() + "/user/AllUser" ;
//                response.sendRedirect(url);
            }else if( index == -5)
            {
                url = request.getContextPath() + "/user/?error=e4cba4de95045a6745685f7ffd4abe1f" ;
            }else if( index == -6)
            {
                url = request.getContextPath() + "/user/?error=eee914b1bc431b94c394813019227b37" ;
            }
            else if( index == -7)
            {
                url = request.getContextPath() + "/user/?error=080a6fef808b67abeb925db7287b1c50" ;
            }
            response.sendRedirect(url);
            
        %>
    </body>
</html>
