<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("student_id") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    int studentId = (Integer) sessionObj.getAttribute("student_id");
    String studentName = (String) sessionObj.getAttribute("name");

    String keyword = request.getParameter("keyword");
    String success = request.getParameter("success");

    if (keyword == null) {
        keyword = "";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Portal | Search Library</title>
    <link rel="stylesheet" href="css/dashboard.css">

    <style>
        .role-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 22px;
            margin-top: 25px;
        }

        .choice-btn {
            display: flex;
            gap: 18px;
            background: #ffffff;
            padding: 20px;
            border-radius: 14px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.08);
            align-items: center;
            transition: 0.25s ease;
        }

        .choice-btn:hover {
            transform: translateY(-6px);
        }

        .book-img {
            width: 90px;
            height: 130px;
            object-fit: cover;
            border-radius: 8px;
            background: #f1f5f9;
        }

        .book-info { flex: 1; }

        .book-info h3 {
            margin: 0 0 6px 0;
            font-size: 18px;
        }

        .book-info p {
            margin: 4px 0;
            font-size: 14px;
            color: #475569;
        }

        .request-btn {
            margin-top: 8px;
            padding: 7px 14px;
            border-radius: 8px;
            border: none;
            background: #16a34a;
            color: white;
            font-weight: 600;
            cursor: pointer;
            font-size: 13px;
        }

        .request-btn:hover { background: #15803d; }

        .unavailable {
            margin-top: 8px;
            padding: 7px 14px;
            border-radius: 8px;
            border: none;
            background: #94a3b8;
            color: white;
            font-weight: 600;
        }

        .search-inline {
            display:flex;
            gap:10px;
            margin-bottom:20px;
        }

        .search-inline input {
            flex:3;
            padding:10px;
            border-radius:8px;
            border:1px solid #ddd;
        }

        .search-inline button {
            flex:1;
            background:#1d4ed8;
            color:white;
            border:none;
            border-radius:8px;
            font-weight:600;
        }

        .search-inline button:hover {
            background:#1e40af;
        }

        .success-box {
            background:#dcfce7;
            color:#166534;
            padding:10px;
            border-radius:8px;
            margin-bottom:15px;
            font-weight:600;
        }
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
        Welcome, <strong><%= studentName %></strong>
        <button class="logout-btn" onclick="window.location.href='logout'">
            Logout
        </button>
    </div>
</nav>

<main class="dashboard-wrapper">
    <div class="report-card">

        <h1>Search Library Catalog</h1>
        <p>Browse all books or search by title / author.</p>

        <% if (success != null) { %>
        <div class="success-box">
            Book request sent successfully!
        </div>
        <% } %>

        <!-- SEARCH -->
        <form method="GET" action="StudentSearch.jsp" class="search-inline">
            <input type="text"
                   name="keyword"
                   placeholder="Enter Book Name or Author..."
                   value="<%= keyword %>">
            <button type="submit">Search</button>
        </form>

        <div class="role-grid">

            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    try (
                            Connection conn = DriverManager.getConnection(
                                    "jdbc:mysql://localhost:3306/library", "root", "root");

                            PreparedStatement ps = conn.prepareStatement(
                                    "SELECT * FROM books WHERE book_title LIKE ? OR author LIKE ? ORDER BY book_title ASC"
                            )
                    ) {

                        ps.setString(1, "%" + keyword + "%");
                        ps.setString(2, "%" + keyword + "%");

                        ResultSet rs = ps.executeQuery();
                        boolean found = false;

                        while (rs.next()) {
                            found = true;

                            int bookId = rs.getInt("book_id");
                            String title = rs.getString("book_title");
                            String author = rs.getString("author");
                            int available = rs.getInt("available");
                            String imageUrl = rs.getString("image_url");
            %>

            <div class="choice-btn">

                <img class="book-img"
                     src="<%= imageUrl != null ? imageUrl : "https://via.placeholder.com/90x130?text=Book" %>">

                <div class="book-info">
                    <h3><%= title %></h3>
                    <p><strong>Author:</strong> <%= author %></p>
                    <p><strong>Available:</strong> <%= available %></p>

                    <% if (available > 0) { %>
                    <form method="POST" action="RequestBook">
                        <input type="hidden" name="book_id" value="<%= bookId %>">
                        <button type="submit" class="request-btn">
                            Request Book
                        </button>
                    </form>
                    <% } else { %>
                    <button class="unavailable" disabled>
                        Out of Stock
                    </button>
                    <% } %>
                </div>
            </div>

            <%
                }

                if (!found) {
            %>
            <div style="grid-column:1/-1; text-align:center;">
                No books found.
            </div>
            <%
                    }

                    rs.close();
                }

            } catch (Exception e) {
            %>
            <div style="color:red;">Error loading books.</div>
            <%
                }
            %>

        </div>

    </div>
    <div class="back-btn-wrapper">
        <a href="Welcome.jsp" class="back-btn">
            ← Back to Dashboard
        </a>
    </div>
</main>

</body>
</html>