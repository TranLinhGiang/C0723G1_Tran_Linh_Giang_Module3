<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 10/30/2023
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
<style>
    table{
        border: solid;
        width: 100%;

    }
</style>
</head>
<body>
<table>
    <h1> Danh sách khách hàng</h1>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>

    </tr>
    <c:forEach items="${customerList}" var="customer" varStatus="status">
        <tr>
            <td> ${customer.name}</td>
            <td> ${customer.dateOfBirth}</td>
            <td> ${customer.address}</td>
            <td> <img src="${ customer.picture}">
                    </td>
        </tr>
    </c:forEach>
</table></body>
</html>
