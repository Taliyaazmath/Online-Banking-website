<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <title>Last Ten Transactions</title>
    <link rel="stylesheet" type="text/css" href="Styles_css.css">
</head>
<body>
    <h2>Last Ten Transactions</h2>
    <table>
        <tr>
            <th>Transaction ID</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Date</th>
        </tr>
        <%
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String accountNo = (String) session.getAttribute("accountNo");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "12345678910@goat");

                String sql = "SELECT * FROM transactions WHERE account_no = ? ORDER BY transaction_date DESC LIMIT 10";
                ps = conn.prepareStatement(sql);
                ps.setString(1, accountNo);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int transactionId = rs.getInt("transaction_id");
                    String transactionType = rs.getString("transaction_type");
                    double amount = rs.getDouble("amount");
                    Timestamp transactionDate = rs.getTimestamp("transaction_date");
        %>
                    <tr>
                        <td><%= transactionId %></td>
                        <td><%= transactionType %></td>
                        <td><%= amount %></td>
                        <td><%= sdf.format(transactionDate) %></td>
                    </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
                <tr>
                    <td colspan="4">An error occurred while retrieving transactions.</td>
                </tr>
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
        %>
    </table>
    <form action="AccountDetailsServlet" method="get">
        <input type="submit" value="Go to Account Page">
    </form>
    <form action="DownloadTransactions.jsp" method="get">
        <input type="submit" value="Download Transactions">
    </form>
</body>
</html>
