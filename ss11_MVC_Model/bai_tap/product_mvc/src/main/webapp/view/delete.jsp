<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 10/31/2023
  Time: 11:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product">Trở về danh sách sản phẩm</a>
<form method="post" action="/product?action=delete">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product information</legend>
        <tr>
            <td>ID: </td>
            <td><input type="number" name="id" id="id" value="${product.getId()}"></td>
        </tr>
        <tr>
            <td>Name: </td>
            <td><input type="text" name="ProductName" id="name" value="${product.getProductName()}"></td>
        </tr>
        <tr>
            <td>Price: </td>
            <td><input type="number" name="price" id="price" value="${product.getPrice()}"></td>
        </tr>
        <tr>
            <td>Description: </td>
            <td><input type="text" name="describe" id="describe" value="${product.getDescribe()}"></td>
        </tr>
        <tr>
            <td>Manufacturer: </td>
            <td><input type="text" name="producer" id="producer" value="${product.getProducer()}"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Delete product"></td>
        </tr>
    </fieldset>
</form>
</body>
</html>
