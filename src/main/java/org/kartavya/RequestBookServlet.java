package org.kartavya;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
@WebServlet("/RequestBook")
public class RequestBookServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/library";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("student_id") == null) {
            res.sendRedirect("index.jsp");
            return;
        }

        int studentId = (Integer) session.getAttribute("student_id");
        int bookId = Integer.parseInt(req.getParameter("book_id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

            String sql = "INSERT INTO book_requests (student_id, book_id) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentId);
            ps.setInt(2, bookId);

            ps.executeUpdate();
            conn.close();

            res.sendRedirect("StudentSearch.jsp?success=1");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}