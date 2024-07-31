<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>
    <link rel="stylesheet" type="text/css" href="MyStyles.css">
</head>
<body>
    <h2>Registration Successful</h2>
    <p>Full Name: <%= request.getAttribute("fullName") %></p>
    <p>Account Number: <%= request.getAttribute("accountNo") %></p>
    <p>Password: <%= request.getAttribute("password") %></p>
    
    <form action="main.jsp" method="get">
        <button type="submit">Go to Admin Dashboard </button>
    </form>
</body>
</html>


    