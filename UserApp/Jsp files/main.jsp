<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Account Details</title>
    <link rel="stylesheet" type="text/css" href="Styles_css.css">
    <script type="text/javascript">
        function confirmCloseAccount() {
            return confirm("Are you sure you want to close your account?");
        }
    </script>
</head>
<body>
    <h2>Welcome, <%= request.getAttribute("fullName") %></h2>
    <p>Account Number: <%= session.getAttribute("accountNo") %></p>
    <p>Balance: <%= request.getAttribute("balance") %></p>
    <form action="deposit.jsp" method="get">
        <input type="submit" value="Deposit">
    </form>
    <form action="withdrawal.jsp" method="get">
        <input type="submit" value="Withdrawal">
    </form>
    <form action="transaction.jsp" method="get">
        <input type="submit" value="Transaction">
    </form>
    <form action="changepassword.jsp" method="get">
        <button type="submit">Change Password</button>
    </form>
    <form action="closeaccount.jsp" method="post" onsubmit="return confirmCloseAccount();">
        <button type="submit">Close Account</button>
    </form>
    <form action="user_login.jsp" method="get">
        <button type="submit">Logoutt</button>
    </form>
</body>
</html>