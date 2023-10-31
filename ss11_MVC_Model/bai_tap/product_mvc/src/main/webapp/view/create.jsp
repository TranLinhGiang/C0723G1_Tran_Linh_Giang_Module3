<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 10/31/2023
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create product</title>
</head>
<body>
<a href="/product">Trở về danh sách sản phẩm</a>
<form action="/product?action=create" method="post">
  <fieldset>
    <legend>Thông tin sản phẩm</legend>
    <table>
      <tr>
        <td>ID: </td>
        <td><input type="number" name="id" id="id"></td>
      </tr>
      <tr>
        <td>Name: </td>
        <td><input type="text" name="productName" id="name"></td>
      </tr>
      <tr>
        <td>Price: </td>
        <td><input type="number" name="price" id="price"></td>
      </tr>
      <tr>
        <td>Description: </td>
        <td><input type="text" name="describe" id="describe"></td>
      </tr>
      <tr>
        <td>Manufacturer: </td>
        <td><input type="text" name="producer" id="producer"></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Create product"></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>
