<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register User</title>
    <link rel="stylesheet" type="text/css" href="MyStyles.css">
</head>
<body>
    <h2>Register User</h2>
    <form action="RegisterUserServlet" method="post">
        Full Name: <input type="text" name="fullName" required><br>
        Address: <textarea name="address" required></textarea><br>
        Mobile No: <input type="text" name="mobileNo" required><br>
        Email ID: <input type="email" name="emailId" required><br>
        Account Type: 
        <select name="accountType" required>
            <option value="Saving">Saving Account</option>
            <option value="Current">Current Account</option>
        </select><br>
        Initial Balance: <input type="number" name="initialBalance" min="1000" required><br>
        Date of Birth: <input type="date" name="dateOfBirth" required><br>
        ID Proof: <input type="text" name="idProof" required><br>
        <input type="submit" value="Register">
    </form>
    <form action="main.jsp" method="get">
        <button type="submit">Go to Admin Dashboard </button>
    </form>
</body>
</html>
    