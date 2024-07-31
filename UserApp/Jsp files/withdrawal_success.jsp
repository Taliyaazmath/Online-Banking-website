<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Withdrawal Successful</title>
    <link rel="stylesheet" type="text/css" href="Styles_css.css">
</head>
<body>
    <h2>Withdrawal Result</h2>
    <p><%= request.getAttribute("message") %></p>
    <form action="AccountDetailsServlet" method="get">
        <input type="submit" value="Go to Account Page">
    </form>
</body>
</html>