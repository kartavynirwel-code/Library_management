package org.kartavya;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class VerifyServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/library";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");

        String userEmail = req.getParameter("id");
        String userPass = req.getParameter("pass");
        String role = req.getParameter("role");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {

                String sql = "SELECT * FROM registration WHERE email=? AND password=? AND role=?";

                try (PreparedStatement ps = conn.prepareStatement(sql)) {

                    ps.setString(1, userEmail);
                    ps.setString(2, userPass);
                    ps.setString(3, role);
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {

                        HttpSession session = req.getSession();
                        session.setAttribute("student_id", rs.getInt("student_id"));
                        session.setAttribute("name", rs.getString("name"));
                        session.setAttribute("role", rs.getString("role"));

                        if (role.equalsIgnoreCase("student")) {
                            res.sendRedirect("Welcome.jsp");
                        }
                        else if (role.equalsIgnoreCase("librarian")) {
                            res.sendRedirect("Librarian.jsp");
                        }
                        else {
                            res.sendRedirect("index.jsp");
                        }

                    } else {
                        req.setAttribute("error", "Invalid Email, Password or Role!");
                        req.getRequestDispatcher("index.jsp").forward(req, res);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Database Error!");
        }
    }
}