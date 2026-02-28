package org.kartavya;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/IssuedBooksServlet")
public class IssuedBooksServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // 🔒 Librarian Security Check
        if (session == null ||
                !"librarian".equals(session.getAttribute("role"))) {

            response.sendRedirect("index.jsp");
            return;
        }

        List<IssuedBook> issuedList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/library",
                    "root",
                    "root");

                 PreparedStatement ps = conn.prepareStatement(
                         "SELECT i.issue_id, s.name, b.book_title, " +
                                 "i.issue_date, i.due_date, i.return_date, " +
                                 "i.status, i.fine " +
                                 "FROM issue_books i " +
                                 "JOIN registration s ON i.student_id = s.student_id " +
                                 "JOIN books b ON i.book_id = b.book_id " +
                                 "ORDER BY i.issue_date DESC");

                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    IssuedBook ib = new IssuedBook();

                    ib.setIssueId(rs.getInt("issue_id"));
                    ib.setStudentName(rs.getString("name"));
                    ib.setBookTitle(rs.getString("book_title"));
                    ib.setIssueDate(rs.getTimestamp("issue_date"));
                    ib.setDueDate(rs.getDate("due_date"));
                    ib.setStatus(rs.getString("status"));

                    issuedList.add(ib);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("issuedBooks", issuedList);
        request.getRequestDispatcher("IssuedBooks.jsp")
                .forward(request, response);
    }
}