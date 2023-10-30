<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="/calculate" method="post">
<table>
    <tr>
        <td>Fist operand</td>
        <td>
            <input type="number" name="firstOperand">
        </td>
    </tr>
    <tr>
        <td>Operator</td>
        <td>
            <select>
                <option name="operator" value="1">
                    Add (cộng)
                </option>
                <option name="operator" value="2">
                    Subtract (trừ)
                </option>
                <option name="operator" value="3">
                    Multiply(nhân)
                </option>
                <option name="operator" value="4">
                    Divide(chia)
                </option>
            </select>
        </td>
    </tr>

    <tr>
        <td>Second operand</td>
        <td>
            <input type="number" name="secondOperand">
        </td>
    </tr>


</table>
    <button type="submit"> Calculate</button>
</form>
</body>
</html>