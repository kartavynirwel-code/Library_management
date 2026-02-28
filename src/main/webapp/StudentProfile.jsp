<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    HttpSession userSession = request.getSession(false);

    if (userSession == null || userSession.getAttribute("student_id") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    int studentId = (Integer) userSession.getAttribute("student_id");
    String studentName = (String) userSession.getAttribute("name");
    String role = (String) userSession.getAttribute("role");

    if(!"student".equalsIgnoreCase(role)){
        response.sendRedirect("index.jsp");
        return;
    }

    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal | My Profile</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>

<!-- ── Top Navigation ─────────────────────────────────── -->
<nav class="top-nav">
    <div class="nav-brand">Library Portal</div>
    <div class="user-info">
        <span>Welcome, <strong><%= studentName %></strong></span>
        <button class="logout-btn" onclick="window.location.href='logout'">Logout</button>
    </div>
</nav>

<!-- ── Main Content ───────────────────────────────────── -->
<main class="dashboard-wrapper">

    <div class="profile-page-wrap">

        <!-- Back link -->
        <a href="Welcome.jsp" class="back-nav">
            <i class="fa-solid fa-arrow-left"></i>
            Back to Dashboard
        </a>

        <!-- Profile Card -->
        <div class="profile-card">

            <!-- Header -->
            <div class="profile-header">
                <div class="profile-avatar">
                    <i class="fa-solid fa-user"></i>
                </div>
                <h1>Student Profile</h1>
                <p>View and manage your account details.</p>
            </div>

            <!-- Divider -->
            <div class="profile-divider">
                <span>Account Information</span>
            </div>

            <!-- Read-only info grid -->
            <div class="profile-info-grid">
                <div class="info-field">
                    <span class="info-label"><i class="fa-solid fa-fingerprint"></i> Student ID</span>
                    <span class="info-value"><%= studentId %></span>
                </div>
                <div class="info-field">
                    <span class="info-label"><i class="fa-solid fa-shield-halved"></i> Account Role</span>
                    <span class="info-value role-badge"><%= role %></span>
                </div>
                <div class="info-field full-width">
                    <span class="info-label"><i class="fa-solid fa-circle-user"></i> Full Name</span>
                    <span class="info-value"><%= studentName %></span>
                </div>
            </div>

            <!-- Divider -->
            <div class="profile-divider">
                <span>Security</span>
            </div>

            <!-- Update Password Form -->
            <form class="profile-form" action="UpdateStudentProfileServlet" method="POST">
                <div class="input-field">
                    <label>New Password</label>
                    <div class="input-with-icon">
                        <i class="fa-solid fa-lock"></i>
                        <input type="password" name="new_password" placeholder="Enter new password">
                    </div>
                </div>

                <div class="input-field">
                    <label>Confirm New Password</label>
                    <div class="input-with-icon">
                        <i class="fa-solid fa-lock-open"></i>
                        <input type="password" name="confirm_password" placeholder="Re-enter new password">
                    </div>
                </div>

                <button type="submit" class="profile-submit-btn">
                    <i class="fa-solid fa-floppy-disk"></i>
                    Update Password
                </button>
            </form>

        </div>
        <!-- end profile-card -->

    </div>

</main>

</body>
</html>
