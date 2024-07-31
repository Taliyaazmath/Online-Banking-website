<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register Admin</title>
    <link rel="stylesheet" type="text/css" href="MyStyles.css">
</head>
<body>
    <div class="container">
        <h2>Register Admin</h2>
        <form method="post">
            Username: <input type="text" name="username" required><br>
            Password: <input type="password" name="password" required><br>
            <input type="submit" value="Register">
        </form>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (username != null && password != null) {
                Connection conn = null;
                PreparedStatement ps = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Replace with your JDBC driver
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "12345678910@goat");
                    String sql = "INSERT INTO admins (username, password) VALUES (?, ?)";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, username);
                    ps.setString(2, password);
                    int result = ps.executeUpdate();
                    if (result > 0) {
        %>
                        <p>Admin registered successfully!</p>
        <%
                    } else {
        %>
                        <p>Failed to register admin. Please try again.</p>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
        %>
                    <p>An error occurred while registering the admin.</p>
        <%
                } finally {
                    try {
                        if (ps != null) ps.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>
    <form action="main.jsp" method="get">
        <button type="submit">Go to Admin Dashboard </button>
    </form>
</body>
</html>
