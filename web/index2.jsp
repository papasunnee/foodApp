<%-- 
    Document   : index
    Created on : Jul 8, 2017, 3:43:35 PM
    Author     : cyclingbd007
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dao.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>



        <table>
            <tr>
                <th colspan="6">product List</th>
            </tr>
            <tr>
                <th>ID</th>
                <th>Pname</th>
                <th>Price</th>
                <th>Qty</th>
                <th colspan="2">Action</th>
            </tr>
            <%
                Connection con = DBConnect.getConnection();
                String sql = "select * from product";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {

            %>
            <tr>
                <td><%= rs.getInt("pid") %></td>
                <td><%= rs.getString("pname") %></td>
                <td><%= rs.getDouble("price") %></td>
                <td><%= rs.getInt("qty") %></td>
                <td><a href="edit.jsp?pid=<%= rs.getInt("pid") %>">Edit</a></td>
                <td><a href="ProductController?pid=<%= rs.getInt("pid") %>&&for=delete">Delete</a></td>
            </tr>
            <% } %>
            <tr style="text-align:center;">
                <td colspan="6">
                    <font color="green">
                    <%                            if (session.getAttribute("sm") != null) {
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
                <td colspan="6">
                    <a href="insert.jsp">Insert</a>
                </td>
            </tr>
        </table>


    </body>
</html>
