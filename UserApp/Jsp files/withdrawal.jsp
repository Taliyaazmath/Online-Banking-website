<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Withdraw</title>
    <link rel="stylesheet" type="text/css" href="Styles_css.css">
</head>
<body>
    <h2>Withdraw Amount</h2>
    <form action="Withdrawal_Servlet" method="post">
        <label for="withdrawalAmount">Amount:</label>
        <input type="number" id="withdrawalAmount" name="withdrawalAmount" required>
        <input type="submit" value="Withdraw">
    </form>
</body>
</html>