<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 10/31/2023
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product">Trở về danh sách sản phẩm</a>
<table>
  <tr>
    <td>ID: </td>
    <td>${product.getId()}</td>
  </tr>
  <tr>
    <td>Name: </td>
    <td>${product.getProductName()}</td>
  </tr>
  <tr>
    <td>Price: </td>
    <td>${product.getPrice()}</td>
  </tr>
  <tr>
    <td>Description: </td>
    <td>${product.getDescribe()}</td>
  </tr>
  <tr>
    <td>Manufacturer: </td>
    <td>${product.getProducer()}</td>
  </tr>
</table>
</body>
</html>
