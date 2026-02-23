package org.kartavya;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class VerifyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        String userEmail = req.getParameter("id");
        String userPass = req.getParameter("pass");
        String role = req.getParameter("role");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/library",
                    "root",
                    "root"
            );

            String sql = "SELECT * FROM users WHERE email=? AND password=? AND role=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userEmail);
            ps.setString(2, userPass);
            ps.setString(3, role);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                if(role.equals("Student")) {
                    req.getRequestDispatcher("Welcome.jsp").forward(req, res);
                }
                else if(role.equals("Faculty")) {
                    req.getRequestDispatcher("Faculty.jsp").forward(req, res);
                }
                else if(role.equals("Librarian")) {
                    req.getRequestDispatcher("Librarian.jsp").forward(req, res);
                }
            } else {
                req.setAttribute("error", "Invalid Email, Password or Role!");
                req.getRequestDispatcher("index.jsp").forward(req, res);
            }

            conn.close();

        } catch (Exception e) {
            out.println("<h3>Database error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    }
}