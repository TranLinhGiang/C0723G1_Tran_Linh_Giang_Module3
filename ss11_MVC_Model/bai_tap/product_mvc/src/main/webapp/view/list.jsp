<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 10/31/2023
  Time: 11:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product List</h1>
<p>
  <a href="/product?action=create">
    <button>Create new product</button>
  </a>

</p>
<form action="/product">
  <input hidden="hidden" type="text" name="action" value="findByName">
  <input type="text" name="name"><button>Search</button>
</form>
<table>
  <tr>
    <td>Id</td>
    <td>Name</td>
    <td>Price</td>
    <td>Description</td>
    <td>Manufacturer</td>
    <td>Edit</td>
    <td>Delete</td>
  </tr>
  <c:forEach items='${requestScope["productList"]}' var="product">
    <tr>
      <td>${product.getId()}</td>
      <td><a href="/product?action=view&id=${product.getId()}">${product.getProductName()}</a></td>
      <td>${product.getPrice()}</td>
      <td>${product.getDescribe()}</td>
      <td>${product.getProducer()}</td>
      <td><a href="/product?action=edit&id=${product.getId()}">
        <button>Edit</button>
      </a></td>
      <td><a href="/product?action=delete&id=${product.getId()}">
        <button>Delete</button>
      </a></td>
    </tr>
  </c:forEach>
</table>

</body>
</html>
