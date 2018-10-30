<%-- 
    Document   : ALlUser
    Created on : Oct 28, 2018, 3:44:23 PM
    Author     : Sunday
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>User Table</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Middle Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>User Type</th>
                    <th>Modify</th>
                </tr>
            </thead>
            <tbody>
                
                <c:forEach items="${AllUser}" var="u">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.fname}</td>
                        <td>${u.lname}</td>
                        <td>${u.mname}</td>
                        <td>${u.phone}</td>
                        <td>${u.email}</td>
                        <td>${u.address}</td>
                        <td>${u.roleId}</td>
                        <td><a href="edit?id=${u.id}">Edit</a> | 
                        <a href="delete?id=${u.id}">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
