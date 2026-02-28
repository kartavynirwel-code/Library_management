package org.kartavya;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ViewBooksServlet")
public class ViewBooksServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // 🔒 Security Check
        if (session == null ||
                !"librarian".equals(session.getAttribute("role"))) {

            response.sendRedirect("index.jsp");
            return;
        }

        List<Book> bookList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/library",
                    "root",
                    "root");

                 PreparedStatement ps = conn.prepareStatement(
                         "SELECT * FROM books ORDER BY book_id DESC");

                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Book book = new Book();
                    book.setBookId(rs.getInt("book_id"));
                    book.setTitle(rs.getString("book_title"));
                    book.setAuthor(rs.getString("author"));
                    book.setAvailable(rs.getInt("available"));

                    bookList.add(book);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("books", bookList);
        request.getRequestDispatcher("ViewBooks.jsp")
                .forward(request, response);
    }
}