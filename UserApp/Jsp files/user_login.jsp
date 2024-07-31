<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <link rel="stylesheet" type="text/css" href="Styles_css.css">
</head>
<body>
	<h1>Online Banking application</h1><br>
    <h2>User Login</h2>
    <form action="UserLoginServlet" method="post">
        Account No: <input type="text" name="accountNo" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>