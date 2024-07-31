package com.mains;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			Connection conn = javadbconnection.getConnection();
			String sql = "SELECT * FROM admins WHERE username= ? AND password = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				response.sendRedirect("main.jsp");
				
			}
			else {
				response.sendRedirect("admin_login.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
