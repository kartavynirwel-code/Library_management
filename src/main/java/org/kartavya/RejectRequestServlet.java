package org.kartavya;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/RejectRequest")
public class RejectRequestServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/library";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // 🔒 Only librarian allowed
        if (session == null || !"librarian".equals(session.getAttribute("role"))) {
            response.sendRedirect("index.jsp");
            return;
        }

        int requestId = Integer.parseInt(request.getParameter("request_id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement ps = conn.prepareStatement(
                         "UPDATE book_requests SET status = 'Rejected' WHERE request_id = ?")) {

                ps.setInt(1, requestId);
                ps.executeUpdate();
            }

            response.sendRedirect("ViewRequestsServlet?msg=rejected");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}