<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Close Account</title>
    <link rel="stylesheet" type="text/css" href="Styles_css.css">
</head>
<body>
    <div class="container">
        <h2>Close Account</h2>
        <%
            String accountNo = (String) request.getSession().getAttribute("accountNo");
            if (accountNo != null) {
                Connection conn = null;
                PreparedStatement ps = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Replace with your JDBC driver
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "12345678910@goat");

                    // Delete account from user_details table
                    String deleteSQL1 = "DELETE FROM user_details WHERE account_no = ?";
                    ps = conn.prepareStatement(deleteSQL1);
                    ps.setString(1, accountNo);
                    int rowsDeleted1 = ps.executeUpdate();

                    // Delete account from users table
                    String deleteSQL2 = "DELETE FROM users WHERE account_no = ?";
                    ps = conn.prepareStatement(deleteSQL2);
                    ps.setString(1, accountNo);
                    int rowsDeleted2 = ps.executeUpdate();

                    if (rowsDeleted1 > 0 && rowsDeleted2 > 0) {
        %>
                        <div class="message success">Account closed successfully!</div>
        <%
                        // Invalidate the session after closing the account
                        request.getSession().invalidate();
                    } else {
        %>
                        <div class="message error">Failed to close the account. Please try again.</div>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
        %>
                    <div class="message error">An error occurred: <%= e.getMessage() %></div>
        <%
                } finally {
                    try {
                        if (ps != null) ps.close();
                        if (conn != null) conn.close(); // Close connection properly
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            } else {
        %>
                <div class="message error">No account number found in session.</div>
        <%
            }
        %>
    </div>
    <form action="AccountDetailsServlet" method="get">
        <input type="submit" value="Go to Account Page">
    </form>
</body>
</html>
