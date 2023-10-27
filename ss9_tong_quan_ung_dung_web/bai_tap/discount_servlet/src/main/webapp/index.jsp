<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Currency Converter</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Currency Converter</h2>
<form action="/product" method="post">
    <label>Mô tả: </label><br/>
    <input type="text" name="Product Description" placeholder="hãy mô tả sản phẩm" value=""/><br/>
    <label>Giá niêm yết: </label><br/>
    <input type="number" name="List Price" placeholder="Giá niêm yết của sản phẩm" value="0" step="0.01"/><br/>
    <label>Tỷ lệ chiết khấu:</label><br/>
    <input type="number" name="Discount Percent" placeholder="Tỷ lệ chiết khấu (phần trăm)" value="0" step="0.01"/><br/>
    <input type = "submit" id = "submit" value = "Converter"/>
</form>
</body>
</html>