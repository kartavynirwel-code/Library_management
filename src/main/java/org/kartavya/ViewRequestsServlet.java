package org.kartavya;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ViewRequestsServlet")
public class ViewRequestsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // 🔒 Librarian Only
        if (session == null ||
                !"librarian".equals(session.getAttribute("role"))) {

            response.sendRedirect("index.jsp");
            return;
        }

        List<BookRequest> requestList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/library",
                    "root",
                    "root");

                 PreparedStatement ps = conn.prepareStatement(
                         "SELECT r.request_id, s.name, b.book_title, r.status " +
                                 "FROM book_requests r " +
                                 "JOIN registration s ON r.student_id = s.student_id " +
                                 "JOIN books b ON r.book_id = b.book_id " +
                                 "ORDER BY r.request_date DESC");

                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    BookRequest br = new BookRequest();
                    br.setRequestId(rs.getInt("request_id"));
                    br.setStudentName(rs.getString("name"));
                    br.setBookTitle(rs.getString("book_title"));
                    br.setStatus(rs.getString("status"));

                    requestList.add(br);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("requests", requestList);
        request.getRequestDispatcher("ViewRequests.jsp")
                .forward(request, response);
    }
}