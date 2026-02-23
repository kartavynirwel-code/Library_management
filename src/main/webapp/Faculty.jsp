<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Portal | Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>

<nav class="top-nav">
    <div class="nav-brand">LIBRARY PORTAL</div>
    <div class="user-info">
        <span>Welcome, <strong>Prof. Kartavya Nirwel</strong></span>
        <button class="logout-btn" onclick="window.location.href='index.jsp'">Logout</button>
    </div>
</nav>

<main class="dashboard-wrapper">

    <div class="stats-row">
        <div class="stat-card">
            <span class="stat-label">Active Allocations</span>
            <span class="stat-value">05</span>
        </div>
        <div class="stat-card">
            <span class="stat-label">Pending Requests</span>
            <span class="stat-value warning">02</span>
        </div>
        <div class="stat-card">
            <span class="stat-label">Account Status</span>
            <span class="stat-value success">Privileged</span>
        </div>
    </div>

    <section class="portal-card landscape-wide">
        <div class="header-area">
            <h1>Faculty Control Center</h1>
            <p>Manage your course resources and library recommendations.</p>
        </div>

        <div class="role-grid">

            <div class="action-box">
                <div class="icon-container">
                    <i class="fa-solid fa-user-tie"></i>
                </div>
                <h3>My Profile</h3>
                <p>Manage personal details and department preferences.</p>
                <button class="action-link-btn" onclick="window.location.href='FacultyProfile.jsp'">View Profile</button>
            </div>

            <div class="action-box">
                <div class="icon-container">
                    <i class="fa-solid fa-clipboard-list"></i>
                </div>
                <h3>Allocation History</h3>
                <p>View books currently allocated to you or your department.</p>
                <button class="action-link-btn" onclick="window.location.href='FacultyReport.jsp'">View Allocations</button>
            </div>

            <div class="action-box highlight">
                <div class="icon-container highlight-icon">
                    <i class="fa-solid fa-book-journal-whills"></i>
                </div>
                <h3>Request Resources</h3>
                <p>Recommend new books or journals for the library to purchase.</p>
                <button class="action-link-btn primary" onclick="window.location.href='FacultyRequest.jsp'">New Request</button>
            </div>

        </div>
    </section>
</main>

</body>
</html>