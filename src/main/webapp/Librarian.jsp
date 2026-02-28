<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || !"librarian".equals(sessionObj.getAttribute("role"))) {
        response.sendRedirect("index.jsp");
        return;
    }

    String librarianName = (String) sessionObj.getAttribute("name");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Librarian Dashboard</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body>

<!-- ================= NAVBAR ================= -->
<nav class="top-nav">
    <div class="nav-brand">Library Portal</div>

    <div class="user-info">
        <span>Welcome, <strong><%= librarianName %></strong></span>
        <button class="logout-btn"
                onclick="window.location.href='logout'">
            Logout
        </button>
    </div>
</nav>

<!-- ================= MAIN ================= -->
<main class="dashboard-wrapper">

    <div class="page-greeting">
        <div class="greeting-title">
            Librarian Control Panel
        </div>
    </div>

    <!-- ================= ACTION GRID ================= -->
    <div class="role-grid">

        <!-- View Books -->
        <div class="action-box">
            <div class="icon-container highlight-icon">
                <i class="fa-solid fa-book"></i>
            </div>
            <h3>Manage Books</h3>
            <p>View, update, or delete books.</p>
            <button class="action-link-btn primary"
                    onclick="window.location.href='ViewBooksServlet'">
                Open
            </button>
        </div>

        <!-- Add Book -->
        <div class="action-box">
            <div class="icon-container">
                <i class="fa-solid fa-plus"></i>
            </div>
            <h3>Add Book</h3>
            <p>Add new books to library.</p>
            <button class="action-link-btn"
                    onclick="window.location.href='AddBook.jsp'">
                Add
            </button>
        </div>

        <!-- Book Requests -->
        <div class="action-box">
            <div class="icon-container">
                <i class="fa-solid fa-inbox"></i>
            </div>
            <h3>Book Requests</h3>
            <p>Approve or reject student requests.</p>
            <button class="action-link-btn"
                    onclick="window.location.href='ViewRequestsServlet'">
                View
            </button>
        </div>

        <!-- Issued Books -->
        <div class="action-box">
            <div class="icon-container">
                <i class="fa-solid fa-clipboard-list"></i>
            </div>
            <h3>Issued Books</h3>
            <p>Track issued and returned books.</p>
            <button class="action-link-btn"
                    onclick="window.location.href='IssuedBooksServlet'">
                Track
            </button>
        </div>

    </div>

</main>

</body>
</html>