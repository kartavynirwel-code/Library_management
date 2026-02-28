package org.kartavya;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ReturnBook")
public class ReturnBookServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/library";
    private static final String USER = "root";
    private static final String PASS = "root";

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int issueId = Integer.parseInt(req.getParameter("issue_id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(URL, USER, PASS)) {

                conn.setAutoCommit(false);

                // 1️⃣ Get book_id
                PreparedStatement getBook = conn.prepareStatement(
                        "SELECT book_id FROM issue_books WHERE issue_id=?");
                getBook.setInt(1, issueId);
                ResultSet rs = getBook.executeQuery();

                int bookId = 0;
                if (rs.next()) {
                    bookId = rs.getInt("book_id");
                }

                // 2️⃣ Update issue_books
                PreparedStatement updateIssue = conn.prepareStatement(
                        "UPDATE issue_books SET status='Returned', return_date=CURDATE() WHERE issue_id=?");
                updateIssue.setInt(1, issueId);
                updateIssue.executeUpdate();

                // 3️⃣ Increase book available count
                PreparedStatement updateBook = conn.prepareStatement(
                        "UPDATE books SET available = available + 1 WHERE book_id=?");
                updateBook.setInt(1, bookId);
                updateBook.executeUpdate();

                conn.commit();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        res.sendRedirect("StudentReport.jsp");
    }
}