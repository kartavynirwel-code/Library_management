<%@ page import="java.util.*, org.kartavya.BookRequest" %>
<%
    HttpSession sessionObj = request.getSession(false);

    if (sessionObj == null ||
            !"librarian".equals(sessionObj.getAttribute("role"))) {

        response.sendRedirect("index.jsp");
        return;
    }

    List<BookRequest> requests =
            (List<BookRequest>) request.getAttribute("requests");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Book Requests</title>
    <link rel="stylesheet" href="css/dashboard.css">

    <!-- INLINE FIX CSS -->
    <style>
        .action-btn {
            padding: 7px 14px;
            border-radius: 6px;
            border: none;
            font-weight: 600;
            font-size: 13px;
            cursor: pointer;
            margin-right: 6px;
            transition: 0.2s ease;
            color: white;
        }

        .approve-btn {
            background: #16a34a;
        }

        .approve-btn:hover {
            background: #15803d;
            transform: translateY(-2px);
        }

        .reject-btn {
            background: #e11d48;
        }

        .reject-btn:hover {
            background: #be123c;
            transform: translateY(-2px);
        }

        .back-btn {
            margin-top: 20px;
            padding: 8px 16px;
            background: #0f1f3d;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
        }

        .back-btn:hover {
            background: #1d4ed8;
            transform: translateY(-2px);
        }

        td {
            vertical-align: middle;
        }
    </style>

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
            <h1>Book Requests</h1>
            <p>Manage student book requests</p>
        </div>

        <div class="table-wrap">
            <table class="report-table">
                <thead>
                <tr>
                    <th>Request ID</th>
                    <th>Student</th>
                    <th>Book</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>

                <%
                    if (requests != null && !requests.isEmpty()) {

                        for (BookRequest r : requests) {
                %>

                <tr>
                    <td><%= r.getRequestId() %></td>
                    <td><%= r.getStudentName() %></td>
                    <td><%= r.getBookTitle() %></td>

                    <td>
                        <span class="status-badge
                            <%= "Approved".equalsIgnoreCase(r.getStatus()) ? "badge-success"
                            : "Rejected".equalsIgnoreCase(r.getStatus()) ? "badge-danger"
                            : "badge-warning" %>">

                            <%= r.getStatus() %>
                        </span>
                    </td>

                    <td>

                        <% if ("Pending".equalsIgnoreCase(r.getStatus())) { %>

                        <!-- APPROVE -->
                        <form action="ApproveRequest"
                              method="POST"
                              style="display:inline;">
                            <input type="hidden"
                                   name="request_id"
                                   value="<%= r.getRequestId() %>">
                            <button class="action-btn approve-btn">
                                Approve
                            </button>
                        </form>

                        <!-- REJECT -->
                        <form action="RejectRequest"
                              method="POST"
                              style="display:inline;">
                            <input type="hidden"
                                   name="request_id"
                                   value="<%= r.getRequestId() %>">
                            <button class="action-btn reject-btn">
                                Reject
                            </button>
                        </form>

                        <% } else { %>

                        <span style="color:gray;">No Action</span>

                        <% } %>

                    </td>
                </tr>

                <%
                    }
                } else {
                %>

                <tr>
                    <td colspan="5" class="table-empty">
                        No requests found.
                    </td>
                </tr>

                <%
                    }
                %>

                </tbody>
            </table>
        </div>

        <!-- BACK BUTTON -->
        <button onclick="window.location.href='Librarian.jsp'"
                class="back-btn">
            ← Back to Dashboard
        </button>

    </div>

</main>

</body>
</html>