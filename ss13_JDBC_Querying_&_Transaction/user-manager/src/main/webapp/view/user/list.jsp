<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 11/2/2023
  Time: 11:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <form action="/users">
        <input hidden="hidden" type="text" name="action" value="search">
        <input type="text" name="country">
        <button>Search by country</button>
    </form>

    <h2>
        <button> <a style="text-decoration: none" href="/users?action=create">Add New User</a></button>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <button style="background: blue; border: none"><a style="color: bisque" href="/users?action=edit&id=${user.id}">Edit</a></button>
                    <button style="background: red; border: none"><a style="color: bisque; text-autospace: none" href="/users?action=delete&id=${user.id}">Delete</a></button>
                </td>
            </tr>
        </c:forEach>

    </table>
</div>
</body>
</html>
