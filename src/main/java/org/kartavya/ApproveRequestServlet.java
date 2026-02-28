package org.kartavya;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;

@WebServlet("/ApproveRequest")
public class ApproveRequestServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/library";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // 🔒 Librarian Only
        if (session == null ||
                !"librarian".equals(session.getAttribute("role"))) {

            response.sendRedirect("index.jsp");
            return;
        }

        int requestId = Integer.parseInt(request.getParameter("request_id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {

                conn.setAutoCommit(false); // 🔥 transaction start

                // 1️⃣ Get request details
                PreparedStatement getReq = conn.prepareStatement(
                        "SELECT student_id, book_id FROM book_requests WHERE request_id = ?");
                getReq.setInt(1, requestId);
                ResultSet rs = getReq.executeQuery();

                if (!rs.next()) {
                    conn.rollback();
                    response.sendRedirect("ViewRequestsServlet?error=notfound");
                    return;
                }

                int studentId = rs.getInt("student_id");
                int bookId = rs.getInt("book_id");

                // 2️⃣ Check availability
                PreparedStatement checkBook = conn.prepareStatement(
                        "SELECT available FROM books WHERE book_id = ?");
                checkBook.setInt(1, bookId);
                ResultSet rsBook = checkBook.executeQuery();

                if (!rsBook.next() || rsBook.getInt("available") <= 0) {
                    conn.rollback();
                    response.sendRedirect("ViewRequestsServlet?error=nostock");
                    return;
                }

                // 3️⃣ Insert into issue_books
                LocalDate today = LocalDate.now();
                LocalDate dueDate = today.plusDays(7);

                PreparedStatement issueBook = conn.prepareStatement(
                        "INSERT INTO issue_books (student_id, book_id, due_date, status) VALUES (?, ?, ?, 'Issued')");

                issueBook.setInt(1, studentId);
                issueBook.setInt(2, bookId);
                issueBook.setDate(3, Date.valueOf(dueDate));
                issueBook.executeUpdate();

                // 4️⃣ Decrease stock
                PreparedStatement updateStock = conn.prepareStatement(
                        "UPDATE books SET available = available - 1 WHERE book_id = ?");
                updateStock.setInt(1, bookId);
                updateStock.executeUpdate();

                // 5️⃣ Update request status
                PreparedStatement updateReq = conn.prepareStatement(
                        "UPDATE book_requests SET status = 'Approved' WHERE request_id = ?");
                updateReq.setInt(1, requestId);
                updateReq.executeUpdate();

                conn.commit(); // ✅ all good

                response.sendRedirect("ViewRequestsServlet?msg=approved");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}