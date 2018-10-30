<%-- 
    Document   : insert
    Created on : Jul 8, 2017, 6:34:28 PM
    Author     : cyclingbd007
--%>

<%@page import="dao.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>



        <form name="edit_form" action="ProductController" method="post">
            <%
                String pid = request.getParameter("pid");

                Connection con = DBConnect.getConnection();
                String sql = "select * from product where pid=" + pid;
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
            %>
            <table>
                <tr>
                    <th colspan="3">Inset Product</th>
                </tr>
                <tr>
                    <td>Product ID</td>
                    <td>:</td>
                    <td><input type="text" name="pid" value="<%= rs.getInt("pid") %>"/></td>
                </tr>
                <tr>
                    <td>Product name</td>
                    <td>:</td>
                    <td><input type="text" name="pname" value="<%= rs.getString("pname") %>"/></td>
                </tr>
                <tr>
                    <td>Product Price</td>
                    <td>:</td>
                    <td><input type="text" name="price" value="<%= rs.getDouble("price") %>"/></td>
                </tr>
                <tr>
                    <td>Product Quantity</td>
                    <td>:</td>
                    <td><input type="text" name="qty" value="<%= rs.getInt("qty") %>"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><input type="submit" name="update" value="Update"/></td>
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
            <% }%>
        </form>

    </body>
</html>
