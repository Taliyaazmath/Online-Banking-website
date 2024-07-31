<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Deposit</title>
    <link rel="stylesheet" type="text/css" href="Styles_css.css">
</head>
<body>
    <h2>Deposit Amount</h2>
    <form action="Deposit_Servlet" method="post">
        <label for="depositAmount">Amount:</label>
        <input type="number" id="depositAmount" name="depositAmount" required>
        <input type="submit" value="Deposit">
    </form>
</body>
</html>