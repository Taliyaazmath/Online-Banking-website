<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="MyStyles.css">
</head>
<body>
    <div class="container">
        <h2>Admin Dashboard</h2>
        <form action="register.jsp">
            <button type="submit">Register Customer</button>
        </form>
        <form action="ViewCustomer.jsp">
            <button type="submit">View Customer</button>
        </form>
        <form action="registeradmin.jsp">
            <button type="submit">Register Admin</button>
        </form>
        
        <form action="index.jsp" method="get">
        	<button type="submit">Logout</button>
        	
    	</form>
    	
    </div>
</body>
</html>
