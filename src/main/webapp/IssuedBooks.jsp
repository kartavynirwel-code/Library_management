<%@ page import="java.util.*, org.kartavya.IssuedBook" %>
<%
    HttpSession sessionObj = request.getSession(false);

    if (sessionObj == null ||
            !"librarian".equals(sessionObj.getAttribute("role"))) {

        response.sendRedirect("index.jsp");
        return;
    }

    List<IssuedBook> issuedBooks =
            (List<IssuedBook>) request.getAttribute("issuedBooks");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Issued Books</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body>

<nav class="top-nav">
    <div class="nav-brand">Library Portal</div>
    <div class="user-info">
        <button class="logout-btn"
                onclick="window.location.href='logout'">
            Logout
        </button>
    </div>
</nav>

<main class="dashboard-wrapper">

    <div class="report-card">

        <div class="report-header">
            <h1>Issued Books</h1>
            <p>Track issued and returned books</p>
        </div>

        <div class="table-wrap">
            <table class="report-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Student</th>
                    <th>Book</th>
                    <th>Issue Date</th>
                    <th>Due Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>

                <%
                    if (issuedBooks != null && !issuedBooks.isEmpty()) {

                        Date today = new Date();

                        for (IssuedBook ib : issuedBooks) {

                            boolean isLate =
                                    "Issued".equalsIgnoreCase(ib.getStatus())
                                            && today.after(ib.getDueDate());
                %>

                <tr>
                    <td><%= ib.getIssueId() %></td>
                    <td><%= ib.getStudentName() %></td>
                    <td><%= ib.getBookTitle() %></td>
                    <td><%= ib.getIssueDate() %></td>
                    <td><%= ib.getDueDate() %></td>

                    <td>
                        <span class="status-badge
                            <%= "Returned".equalsIgnoreCase(ib.getStatus()) ? "badge-success"
                            : isLate ? "badge-danger"
                            : "badge-warning" %>">

                            <%= "Returned".equalsIgnoreCase(ib.getStatus()) ?
                                    "Returned" :
                                    isLate ? "Late" : "Issued" %>
                        </span>
                    </td>

                    <td>

                        <% if (!"Returned".equalsIgnoreCase(ib.getStatus())) { %>

                        <form action="ReturnBookServlet"
                              method="POST"
                              style="display:inline;">

                            <input type="hidden"
                                   name="issue_id"
                                   value="<%= ib.getIssueId() %>">

                            <button class="submit-btn"
                                    style="background:#16a34a;">
                                Mark Returned
                            </button>

                        </form>

                        <% } else { %>

                        <span style="color:gray;">
                                Completed
                            </span>

                        <% } %>

                    </td>
                </tr>

                <%
                    }

                } else {
                %>

                <tr>
                    <td colspan="7" class="table-empty">
                        No issued books found.
                    </td>
                </tr>

                <%
                    }
                %>

                </tbody>
            </table>
        </div>

    </div>

</main>

</body>
</html>