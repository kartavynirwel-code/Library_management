<%@ page import="java.util.*, org.kartavya.Book" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null ||
            !"librarian".equals(sessionObj.getAttribute("role"))) {
        response.sendRedirect("index.jsp");
        return;
    }

    List<Book> books = (List<Book>) request.getAttribute("books");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Books</title>
    <link rel="stylesheet" href="css/dashboard.css">
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

    <h2>All Books</h2>

    <div class="table-wrap">
        <table class="report-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Available</th>
            </tr>
            </thead>
            <tbody>

            <%
                if (books != null && !books.isEmpty()) {
                    for (Book b : books) {
            %>

            <tr>
                <td><%= b.getBookId() %></td>
                <td><%= b.getTitle() %></td>
                <td><%= b.getAuthor() %></td>
                <td><%= b.getAvailable() %></td>
            </tr>

            <%
                }
            } else {
            %>

            <tr>
                <td colspan="4" class="table-empty">
                    No books found.
                </td>
            </tr>

            <%
                }
            %>

            </tbody>
        </table>
    </div>

</main>

</body>
</html>