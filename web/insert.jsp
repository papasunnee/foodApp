<%-- 
    Document   : insert
    Created on : Oct 22, 2018, 6:34:28 PM
    Author     : Adetona Sunday
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form name="insert_form" action="ProductController" method="post">
            <table>
                <tr>
                    <th colspan="3">Inset Product</th>
                </tr>
                <tr>
                    <td>Product name</td>
                    <td>:</td>
                    <td><input type="text" name="pname"/></td>
                </tr>
                <tr>
                    <td>Product Price</td>
                    <td>:</td>
                    <td><input type="text" name="price"/></td>
                </tr>
                <tr>
                    <td>Product Quantity</td>
                    <td>:</td>
                    <td><input type="text" name="qty"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><input type="submit" name="insert" value="Insert"/></td>
                </tr>
                
                <tr style="text-align:center;">
                    <td colspan="3">
                        <font color="green">
                        <%
                            if (session.getAttribute("sm") != null) {
                                out.println(session.getAttribute("sm"));
                                session.setAttribute("sm", null);
                            }
                        %>
                        </font>
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
                <tr style="text-align: center;">
                    <td colspan="3">
                        <a href="index.jsp">Home</a>
                    </td>
                </tr>
            </table>
        </form>

    </body>
</html>
