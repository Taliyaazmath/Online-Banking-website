<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
    <link rel="stylesheet" type="text/css" href="Styles_css.css">
</head>
<body>
    <div class="container">
        <h2>Change Password</h2>
        <form method="post">
            Old Password: <input type="password" name="oldPassword" required><br>
            New Password: <input type="password" name="newPassword" required><br>
            <input type="submit" value="Change Password">
        </form>
        <%
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            String accountNo = (String) request.getSession().getAttribute("accountNo"); // Assuming accountNo is stored in session
            if (oldPassword != null && newPassword != null && accountNo != null) {
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Replace with your JDBC driver
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "12345678910@goat");

                    // Verify old password
                    String verifySQL = "SELECT * FROM user_details WHERE account_no = ? AND password = ?";
                    ps = conn.prepareStatement(verifySQL);
                    ps.setString(1, accountNo);
                    ps.setString(2, oldPassword);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        // Update password in user_details table
                        String updateSQL1 = "UPDATE user_details SET password = ? WHERE account_no = ?";
                        ps = conn.prepareStatement(updateSQL1);
                        ps.setString(1, newPassword);
                        ps.setString(2, accountNo);
                        ps.executeUpdate();

                        // Update password in users table
                        String updateSQL2 = "UPDATE users SET password = ? WHERE account_no = ?";
                        ps = conn.prepareStatement(updateSQL2);
                        ps.setString(1, newPassword);
                        ps.setString(2, accountNo);
                        ps.executeUpdate();

        %>
                        <p>Password changed successfully!</p>
        <%
                    } else {
        %>
                        <p>Old password is incorrect. Please try again.</p>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
        %>
                    <p>An error occurred: <%= e.getMessage() %></p>
        <%
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (conn != null) conn.close(); // Close connection properly
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>
    <form action="AccountDetailsServlet" method="get">
        <input type="submit" value="Go to Account Page">
    </form>
</body>
</html>