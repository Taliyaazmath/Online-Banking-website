<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Deposit Successful</title>
    <link rel="stylesheet" type="text/css" href="Styles_css.css">
</head>
<body>
    <h2>Deposit Successful</h2>
    <p>Your new balance is: <%= request.getAttribute("newBalance") %></p>
    <form action="AccountDetailsServlet" method="get">
        <input type="submit" value="Go to Account Page">
    </form>
</body>
</html>