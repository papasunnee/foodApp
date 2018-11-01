<%-- 
    Document   : index
    Created on : Oct 28, 2018, 2:59:33 PM
    Author     : Funmilola
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form name="create_food_item" action="${pageContext.request.contextPath}/user/ManageAddUser.jsp" method="post">
            <table>
                <tr>
                    <th colspan="3">Create New User</th>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td>:</td>
                    <td><input type="text" name="fname"/></td>
                </tr>
                
                <tr>
                    <td>Last Name</td>
                    <td>:</td>
                    <td><input type="text" name="lname"/></td>
                </tr>
                <tr>
                    <td>Middle Name</td>
                    <td>:</td>
                    <td><input type="text" name="mname"/></td>
                </tr>
               <tr>
                    <td>Phone Number</td>
                    <td>:</td>
                    <td><input type="text" name="phone"/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>:</td>
                    <td><input type="text" name="email"/></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>:</td>
                    <td><input type="text" name="address"/></td>
                </tr>
                
                <tr>
                    <td>Date of Birth</td>
                    <td>:</td>
                    <td><input type="date" name="dob"/></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>:</td>
                    <td>
                        <select name="gender">
                            <option value="-1">Select Gender</option>
                            <option value="1">Male</option>
                            <option value="2">Female</option>
                        </select>
                </tr>
                <tr>
                    <td>Username</td>
                    <td>:</td>
                    <td><input type="text" name="username"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>:</td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td>:</td>
                    <td><input type="password" name="cpassword"/></td>
                </tr>
                
                <tr>
                    <td>Employment Date</td>
                    <td>:</td>
                    <td><input type="date" name="empDate"/></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>:</td>
                    <td>
                        <select name="roleId">
                            <option value="-1">Select Gender</option>
                            <option value="1">Admin</option>
                            <option value="2">Manager</option>
                            <option value="3">Staff</option>
                        </select>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><input type="submit" name="createUser" value="Create New User"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>