<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 11/1/2023
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List User</title>
</head>
<body>
<center>
<h1>User Management</h1>
<h2>
    <a href="/users?action=create">Add New User</a>
</h2>
</center>
<div align="center">
<table border="1" style="border: aquamarine" cellpadding="5">
    <tr>
        <th> ID</th>
        <th> NAME</th>
        <th> EMAIL</th>
        <th> COUNTRY</th>
        <th> ACTION</th>
    </tr>
      <c:forEach items="${users}" var="user">
          <tr>
              <td><c:out value="${user.getId()}"></c:out></td>
              <td>${user.getName()}</td>
              <td>${user.getEmail()}</td>
              <td>${user.getCountry()}</td>
              <td>
                  <button style="background: blue"> <a href="/users?action=edit&id=${user.id}"></a> Edit</button>
                  <button style="background: grey"> <a href="/users?action=delete&id=${user.id}"></a> Delete</button>
              </td>
          </tr>
      </c:forEach>
</div>
</table>
</body>
</html>
