<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    HttpSession userSession = request.getSession(false);

    if (userSession == null || userSession.getAttribute("student_id") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    int studentId = (Integer) userSession.getAttribute("student_id");
    String studentName = (String) userSession.getAttribute("name");

    String studentEmail = "";
    int booksIssued = 0;
    int pendingReturns = 0;
    String memberStatus = "Active";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/library",
                "root",
                "root"
        );

        // 🔹 Get Email
        PreparedStatement ps1 = conn.prepareStatement(
                "SELECT email FROM registration WHERE student_id=?"
        );
        ps1.setInt(1, studentId);
        ResultSet rs1 = ps1.executeQuery();
        if (rs1.next()) {
            studentEmail = rs1.getString("email");
        }

        // 🔹 Total Issued Books
        PreparedStatement ps2 = conn.prepareStatement(
                "SELECT COUNT(*) FROM issue_books WHERE student_id=?"
        );
        ps2.setInt(1, studentId);
        ResultSet rs2 = ps2.executeQuery();
        if (rs2.next()) {
            booksIssued = rs2.getInt(1);
        }

        // 🔹 Pending Returns
        PreparedStatement ps3 = conn.prepareStatement(
                "SELECT COUNT(*) FROM issue_books WHERE student_id=? AND status='Issued'"
        );
        ps3.setInt(1, studentId);
        ResultSet rs3 = ps3.executeQuery();
        if (rs3.next()) {
            pendingReturns = rs3.getInt(1);
        }

        conn.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal | Welcome</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<!-- ── Top Navigation ─────────────────────────────────────── -->
<nav class="top-nav">
    <div class="nav-brand">Library Portal</div>
    <div class="user-info">
        <span>Welcome, <strong><%= studentName %></strong></span>
        <a href="logout" class="logout-btn">Logout</a>
    </div>
</nav>

<!-- ── Dashboard Content ──────────────────────────────────── -->
<div class="dashboard-wrapper">

    <!-- Page greeting -->
    <div class="page-greeting">
        <p class="greeting-date" id="liveDate"></p>
        <h2 class="greeting-title">Good to see you, <%= studentName.split(" ")[0] %> 👋</h2>
    </div>

    <!-- ── Stats Row ──────────────────────────────────────── -->
    <div class="stats-row">
        <div class="stat-card">
            <span class="stat-label">Books Issued</span>
            <span class="stat-value"><%= booksIssued %></span>
            <span class="stat-trend">Currently borrowed</span>
        </div>
        <div class="stat-card">
            <span class="stat-label">Pending Returns</span>
            <span class="stat-value warning"><%= pendingReturns %></span>
            <span class="stat-trend">Due this week</span>
        </div>
        <div class="stat-card">
            <span class="stat-label">Member Status</span>
            <span class="stat-value success"><%= memberStatus %></span>
            <span class="stat-trend">All privileges active</span>
        </div>
        <div class="stat-card">
            <span class="stat-label">Registered Email</span>
            <span class="stat-value-sm"><%= studentEmail != null ? studentEmail : "—" %></span>
            <span class="stat-trend">Account identifier</span>
        </div>
    </div>

    <div class="portal-card landscape-wide">
        <h1>Student Control Center</h1>
        <p>Track your library history and discover new resources.</p>

        <div class="role-grid">

            <!-- My Profile -->
            <div class="action-box">
                <div class="icon-container">
                    <i class="fa-solid fa-id-card"></i>
                </div>
                <h3>My Profile</h3>
                <p>Update your personal information and security keys.</p>
                <button class="action-link-btn" onclick="window.location.href='StudentProfile.jsp'">
                    View Profile
                </button>
            </div>

            <div class="action-box">
                <div class="icon-container">
                    <i class="fa-solid fa-chart-pie"></i>
                </div>
                <h3>Book Reports</h3>
                <p>Check your borrowing history and due dates.</p>
                <button class="action-link-btn" onclick="window.location.href='StudentReport.jsp'">
                    Open Reports
                </button>
            </div>

            <div class="action-box">
                <div class="icon-container highlight-icon">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>
                <h3>Explore Library</h3>
                <p>Search thousands of titles and request new books.</p>
                <button class="action-link-btn primary" onclick="window.location.href='StudentSearch.jsp'">
                    Search Now
                </button>
            </div>

        </div>
    </div>


</div>


<script>

    const dateEl = document.getElementById('liveDate');
    const now = new Date();
    dateEl.textContent = now.toLocaleDateString('en-IN', {
        weekday: 'long', year: 'numeric', month: 'long', day: 'numeric'
    });
</script>
</body>
</html>
