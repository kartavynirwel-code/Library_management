package org.kartavya;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.sql.*;

@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // 🔒 Role Security Check
        if (session == null ||
                !"librarian".equals(session.getAttribute("role"))) {

            response.sendRedirect("index.jsp");
            return;
        }

        String title = request.getParameter("book_title");
        String author = request.getParameter("author");
        String availableStr = request.getParameter("available");

        // ✅ Basic Validation
        if (title == null || title.trim().isEmpty() ||
                author == null || author.trim().isEmpty() ||
                availableStr == null || availableStr.trim().isEmpty()) {

            response.sendRedirect("AddBook.jsp?error=invalid");
            return;
        }

        int available;

        try {
            available = Integer.parseInt(availableStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("AddBook.jsp?error=invalidnumber");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/library",
                    "root",
                    "root");

                 PreparedStatement ps = conn.prepareStatement(
                         "INSERT INTO books (book_title, author, available) VALUES (?, ?, ?)")) {

                ps.setString(1, title);
                ps.setString(2, author);
                ps.setInt(3, available);

                ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AddBook.jsp?error=db");
            return;
        }

        // ✅ Success Redirect
        response.sendRedirect("AddBook.jsp?success=true");
    }
}