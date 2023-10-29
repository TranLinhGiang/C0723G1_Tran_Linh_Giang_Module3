<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/index" method="post">
    <p> Enter product Description</p> <input name="productDescription" type="text">
    <br>
    <p>Enter list Price</p> <input name="listPrice" type="number" step="0.01">
    <br>
    <p>Enter discount Percent</p> <input name="discountPercent" type="number" step="0.01">
    <br>
    <button type="submit">
        Calculate</button>
</form>
</body>
</html>