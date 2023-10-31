<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 10/31/2023
  Time: 11:47 PM
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
    <td>Id</td>
    <td>Name</td>
    <td>Price</td>
    <td>Description</td>
    <td>Manufacturer</td>
  </tr>
  <c:forEach items="${products}" var="product">
    <tr>
      <td>${product.getId()}</td>
      <td>${product.getProductName()}</td>
      <td>${product.getPrice()}</td>
      <td>${product.getDescribe()}</td>
      <td>${product.getProducer()}</td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
