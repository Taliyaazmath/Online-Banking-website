package com.mains;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.UUID;
import java.util.Random;


public class RegisterUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String mobileNo = request.getParameter("mobileNo");
        String emailId = request.getParameter("emailId");
        String accountType = request.getParameter("accountType");
        double initialBalance = Double.parseDouble(request.getParameter("initialBalance"));
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idProof = request.getParameter("idProof");

        String accountNo = generateAccountNumber();
        String password = generatePassword();

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = javadbconnection.getConnection();

            // Insert into user_details table
            String sql = "INSERT INTO user_details (full_name, address, mobile_no, email_id, account_type, initial_balance, date_of_birth, id_proof, account_no, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, address);
            ps.setString(3, mobileNo);
            ps.setString(4, emailId);
            ps.setString(5, accountType);
            ps.setDouble(6, initialBalance);
            ps.setString(7, dateOfBirth);
            ps.setString(8, idProof);
            ps.setString(9, accountNo);
            ps.setString(10, password);

            int result = ps.executeUpdate();
            if (result > 0) {
                // Insert into users table
                sql = "INSERT INTO users (account_no, password) VALUES (?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, accountNo);
                ps.setString(2, password);
                ps.executeUpdate();

                // Debug statements
                System.out.println("User Registered with Account No: " + accountNo + " and Password: " + password);

                // Redirect to success page with details
                request.setAttribute("fullName", fullName);
                request.setAttribute("accountNo", accountNo);
                request.setAttribute("password", password);
                request.getRequestDispatcher("register_success.jsp").forward(request, response);
            } else {
                System.out.println("Failed to insert user details into user_details table");
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private String generateAccountNumber() {
        String uuid = UUID.randomUUID().toString();
        return uuid.replaceAll("-", "").substring(0, 10);
    }

    private String generatePassword() {
        String capitalChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerChars = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        String specialChars = "!@#$%^&*_=+-/";

        String allChars = capitalChars + lowerChars + numbers + specialChars;
        Random random = new Random();
        char[] password = new char[8];
        password[0] = capitalChars.charAt(random.nextInt(capitalChars.length()));
        password[1] = lowerChars.charAt(random.nextInt(lowerChars.length()));
        password[2] = numbers.charAt(random.nextInt(numbers.length()));
        password[3] = specialChars.charAt(random.nextInt(specialChars.length()));

        for (int i = 4; i < 8; i++) {
            password[i] = allChars.charAt(random.nextInt(allChars.length()));
        }

        return new String(password);
    }
}

