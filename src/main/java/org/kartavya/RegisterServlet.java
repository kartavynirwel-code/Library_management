package org.kartavya;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        String role = req.getParameter("role");
        String name = req.getParameter("fullname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/library",
                    "root",
                    "root"
            );

            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO users (role, fullname, email, password) VALUES (?, ?, ?, ?)"
            );
            ps.setString(1, role);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, password);
            int r = ps.executeUpdate();
            if (r > 0) {
                res.sendRedirect("index.jsp");
            }else{
                out.println("<script type='text/javascript'>alert('invalid')</script>");
            }


            conn.close();

        } catch (Exception e) {
            out.println("Database error: " + e.getMessage());
        }

    }
}
