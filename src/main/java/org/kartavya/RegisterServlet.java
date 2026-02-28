package org.kartavya;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

public class RegisterServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/library";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {


        String name = req.getParameter("fullname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String mobile = req.getParameter("mobile");
        String address = req.getParameter("address");
        String branch = req.getParameter("branch");
        int year = Integer.parseInt(req.getParameter("year"));
        String role = req.getParameter("role");
        String course = req.getParameter("course");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {

                String checkQuery = "SELECT email FROM registration WHERE email = ?";
                try (PreparedStatement checkPs = conn.prepareStatement(checkQuery)) {
                    checkPs.setString(1, email);
                    ResultSet rs = checkPs.executeQuery();

                    if (rs.next()) {
                        res.getWriter().println("Email already exists!");
                        return;
                    }
                }

                String insertQuery = "INSERT INTO registration " +
                        "(name, email, password, mobile, address, branch, year, role, course) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

                try (PreparedStatement ps = conn.prepareStatement(insertQuery)) {

                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.setString(3, password);
                    ps.setString(4, mobile);
                    ps.setString(5, address);
                    ps.setString(6, branch);
                    ps.setInt(7, year);
                    ps.setString(8, role);
                    ps.setString(9, course);

                    int rows = ps.executeUpdate();

                    if (rows > 0) {
                        res.sendRedirect("index.jsp");
                    } else {
                        res.getWriter().println("Registration Failed!");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Database Error!");
        }
    }
}