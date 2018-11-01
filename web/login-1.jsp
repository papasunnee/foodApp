<%-- 
    Document   : login
    Created on : Oct 8, 2018, 8:27:23 PM
    Author     : Adetona Sunday
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food App Login Page</title>
    </head>
    <body>
        <form name="login_form" action="ProductController" method="post">
            <table>
                <tr>
                    <th colspan="3">Login here</th>
                </tr>
                <tr>
                    <td>Username</td>
                    <td>:</td>
                    <td><input type="text" name="name"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>:</td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><input type="submit" name="login" value="Login"/></td>
                </tr>
                <tr style="text-align:center;">
                    <td colspan="3">
                        <font color="red">
                        <%
                            if (session.getAttribute("em") != null) {
                                out.println(session.getAttribute("em"));
                                session.setAttribute("em", null);
                            }
                        %>
                        </font>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
