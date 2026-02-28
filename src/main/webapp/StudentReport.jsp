<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    HttpSession userSession = request.getSession(false);

    if (userSession == null || userSession.getAttribute("student_id") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    int studentId = (Integer) userSession.getAttribute("student_id");
    String studentName = (String) userSession.getAttribute("name");

    int rowCount = 0;
    SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Portal | Reports</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <style>
        .back-btn-wrapper {
            margin-top: 30px;
            text-align: center;
        }

        .back-btn {
            display: inline-block;
            padding: 10px 20px;
            background: #0f172a;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.2s ease;
        }

        .back-btn:hover {
            background: #1d4ed8;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>

<nav class="top-nav">
    <div class="nav-brand">Library Portal</div>
    <div class="user-info">
        <span>Welcome, <strong><%= studentName %></strong></span>
        <button class="logout-btn" onclick="window.location.href='logout'">Logout</button>
    </div>
</nav>

<main class="dashboard-wrapper">

    <div class="report-card">

        <div class="report-header">
            <h1>Library Reports</h1>
            <p>Your issued books history</p>
        </div>

        <div class="table-wrap">
            <table class="report-table">
                <thead>
                <tr>
                    <th>Book Title</th>
                    <th>Issue Date</th>
                    <th>Due Date</th>
                    <th>Status</th>
                    <th>Action</th> <!-- NEW COLUMN -->
                </tr>
                </thead>
                <tbody>

                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        try (
                                Connection conn = DriverManager.getConnection(
                                        "jdbc:mysql://localhost:3306/library", "root", "root");

                                PreparedStatement ps = conn.prepareStatement(
                                        "SELECT i.issue_id, b.book_title, i.issue_date, i.due_date, i.status " +
                                                "FROM issue_books i " +
                                                "JOIN books b ON i.book_id = b.book_id " +
                                                "WHERE i.student_id = ? " +
                                                "ORDER BY i.issue_date DESC"
                                )
                        ) {

                            ps.setInt(1, studentId);
                            ResultSet rs = ps.executeQuery();

                            while (rs.next()) {

                                rowCount++;

                                int issueId = rs.getInt("issue_id");
                                String title = rs.getString("book_title");
                                Timestamp issueDate = rs.getTimestamp("issue_date");
                                Date dueDate = rs.getDate("due_date");
                                String status = rs.getString("status");

                                boolean isLate = false;

                                if (dueDate != null && "Issued".equalsIgnoreCase(status)) {
                                    Date today = new Date(System.currentTimeMillis());
                                    isLate = today.after(dueDate);
                                }

                                String badgeClass;
                                String finalStatus;

                                if ("Returned".equalsIgnoreCase(status)) {
                                    badgeClass = "badge-success";
                                    finalStatus = "Returned";
                                }
                                else if (isLate) {
                                    badgeClass = "badge-danger";
                                    finalStatus = "Late";
                                }
                                else {
                                    badgeClass = "badge-warning";
                                    finalStatus = "Issued";
                                }
                %>

                <tr>
                    <td><%= title %></td>
                    <td><%= issueDate != null ? sdf.format(issueDate) : "-" %></td>
                    <td><%= dueDate != null ? sdf.format(dueDate) : "-" %></td>

                    <td>
        <span class="status-badge <%= badgeClass %>">
            <%= finalStatus %>
        </span>
                    </td>

                    <td>

                        <% if (!"Returned".equalsIgnoreCase(status)) { %>

                        <form action="ReturnBook" method="POST" style="display:inline;">
                            <input type="hidden" name="issue_id" value="<%= issueId %>">

                            <button type="submit"
                                    style="
                    padding:6px 12px;
                    background:#2563eb;
                    color:white;
                    border:none;
                    border-radius:6px;
                    cursor:pointer;
                    font-size:13px;
                    font-weight:600;
                ">
                                Return
                            </button>
                        </form>

                        <% } else { %>
                        <span style="color:gray;">-</span>
                        <% } %>

                    </td>
                </tr>

                <%
                        }
                        rs.close();
                    }

                } catch (Exception e) {
                %>
                <tr>
                    <td colspan="5" style="text-align:center;color:red;">
                        Error loading records.
                    </td>
                </tr>
                <%
                    }

                    if (rowCount == 0) {
                %>
                <tr>
                    <td colspan="5" style="text-align:center;">
                        No issued books found.
                    </td>
                </tr>
                <%
                    }
                %>

                </tbody>
            </table>
        </div>

        <% if (rowCount > 0) { %>
        <div class="table-footer">
            <%= rowCount %> record<%= rowCount == 1 ? "" : "s" %> found
        </div>
        <% } %>

    </div>
    <div class="back-btn-wrapper">
        <a href="Welcome.jsp" class="back-btn">
            ← Back to Dashboard
        </a>
    </div>

</main>
</body>
</html>