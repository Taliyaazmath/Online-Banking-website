<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Customer</title>
    <link rel="stylesheet" type="text/css" href="MyStyles.css">
</head>
<body>
    <div class="container">
        <h2>View Customer</h2>
        <form method="post">
            Account Number: <input type="text" name="accountNo" required><br>
            <input type="submit" value="View Details">
        </form>

        <%
            String accountNo = request.getParameter("accountNo");
            if (accountNo != null && !accountNo.trim().isEmpty()) {
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Replace with your JDBC driver
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "12345678910@goat");
                    String sql = "SELECT account_no, full_name, email_id,mobile_no,initial_balance FROM user_details WHERE account_no = ?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, accountNo);
                    rs = ps.executeQuery();

                    if (rs.next()) {
        %>
                        <table>
                            <tr>
                                <th>Account Number</th>
                                <td><%= rs.getString("account_no") %></td>
                            </tr>
                            <tr>
                                <th>Full Name</th>
                                <td><%= rs.getString("full_name") %></td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td><%= rs.getString("email_id") %></td>
                            </tr>
                            <tr>
                                <th>Phone</th>
                                <td><%= rs.getString("mobile_no") %></td>
                            </tr>
                            <tr>
                                <th>Initial Balance</th>
                                <td><%= rs.getDouble("initial_balance") %></td>
                            </tr>
                        </table>
        <%
                    } else {
        %>
                        <p>No customer found with account number <%= accountNo %>.</p>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
        %>
                    <p>An error occurred while retrieving customer details.</p>
        <%
                } finally {
                    try {
                        if (rs != null) rs.close();
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
