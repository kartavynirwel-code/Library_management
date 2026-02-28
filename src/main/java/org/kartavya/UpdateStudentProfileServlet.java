package org.kartavya;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class UpdateStudentProfileServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/library";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("student_id") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        int studentId = (int) session.getAttribute("student_id");

        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String branch = request.getParameter("branch");
        int year = Integer.parseInt(request.getParameter("year"));
        String course = request.getParameter("course");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {

                String sql = "UPDATE registration SET name=?, mobile=?, address=?, branch=?, year=?, course=? WHERE student_id=?";

                try (PreparedStatement ps = conn.prepareStatement(sql)) {

                    ps.setString(1, name);
                    ps.setString(2, mobile);
                    ps.setString(3, address);
                    ps.setString(4, branch);
                    ps.setInt(5, year);
                    ps.setString(6, course);
                    ps.setInt(7, studentId);

                    int rows = ps.executeUpdate();

                    if (rows > 0) {
                        session.setAttribute("name", name); // update session name
                        response.sendRedirect("Profile.jsp?success=1");
                    } else {
                        out.println("Profile Update Failed!");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Database Error!");
        }
    }
}