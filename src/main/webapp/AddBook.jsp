<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null ||
            !"librarian".equals(sessionObj.getAttribute("role"))) {

        response.sendRedirect("index.jsp");
        return;
    }

    String message = request.getParameter("success");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body>

<!-- ================= NAVBAR ================= -->
<nav class="top-nav">
    <div class="nav-brand">Library Portal</div>
    <div class="user-info">
        <button class="logout-btn"
                onclick="window.location.href='logout'">
            Logout
        </button>
    </div>
</nav>

<!-- ================= MAIN ================= -->
<main class="dashboard-wrapper">

    <div class="profile-page-wrap">

        <!-- Back -->
        <a href="Librarian.jsp" class="back-nav">
            <i class="fa-solid fa-arrow-left"></i>
            Back to Dashboard
        </a>

        <!-- Card -->
        <div class="profile-card">

            <!-- Header -->
            <div class="profile-header">
                <div class="profile-avatar">
                    <i class="fa-solid fa-book"></i>
                </div>
                <h1>Add New Book</h1>
                <p>Enter book details to add to library</p>
            </div>

            <!-- Success Message -->
            <% if (message != null) { %>
            <div class="alert-success">
                <i class="fa-solid fa-circle-check"></i>
                Book added successfully!
            </div>
            <% } %>

            <!-- Form -->
            <form action="AddBookServlet" method="POST" class="profile-form">

                <div class="input-field">
                    <label>Book Title</label>
                    <div class="input-with-icon">
                        <i class="fa-solid fa-book-open"></i>
                        <input type="text"
                               name="book_title"
                               placeholder="Enter book title"
                               required>
                    </div>
                </div>

                <div class="input-field">
                    <label>Author</label>
                    <div class="input-with-icon">
                        <i class="fa-solid fa-pen-nib"></i>
                        <input type="text"
                               name="author"
                               placeholder="Enter author name"
                               required>
                    </div>
                </div>

                <div class="input-field">
                    <label>Total Copies</label>
                    <div class="input-with-icon">
                        <i class="fa-solid fa-layer-group"></i>
                        <input type="number"
                               name="available"
                               min="1"
                               placeholder="Enter quantity"
                               required>
                    </div>
                </div>

                <button type="submit" class="profile-submit-btn">
                    <i class="fa-solid fa-plus"></i>
                    Add Book
                </button>

            </form>

        </div>
    </div>

</main>

</body>
</html>