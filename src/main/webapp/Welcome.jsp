<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal | Welcome</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>

<nav class="top-nav">
    <div class="nav-brand">LIBRARY PORTAL</div>
    <div class="user-info">
        <span>Welcome, <strong>Kartavya Nirwel</strong></span>
        <button class="logout-btn" onclick="window.location.href='index.jsp'">Logout</button>
    </div>
</nav>

<main class="dashboard-wrapper">
    <div class="stats-row">
        <div class="stat-card">
            <span class="stat-label">Books Issued</span>
            <span class="stat-value">02</span>
        </div>
        <div class="stat-card">
            <span class="stat-label">Pending Returns</span>
            <span class="stat-value warning">01</span>
        </div>
        <div class="stat-card">
            <span class="stat-label">Account Status</span>
            <span class="stat-value success">Active</span>
        </div>
    </div>

    <section class="portal-card landscape-wide">
        <div class="header-area">
            <h1>Student Control Center</h1>
            <p>Track your library history and discover new resources.</p>
        </div>

        <div class="role-grid">

            <div class="action-box">
                <div class="icon-container">
                    <i class="fa-solid fa-id-card"></i>
                </div>
                <h3>My Profile</h3>
                <p>Update your personal information and security keys.</p>
                <button class="action-link-btn" onclick="window.location.href='StudentProfile.jsp'">View Profile</button>
            </div>

            <div class="action-box">
                <div class="icon-container">
                    <i class="fa-solid fa-chart-pie"></i>
                </div>
                <h3>Book Reports</h3>
                <p>Check your borrowing history and due dates.</p>
                <button class="action-link-btn" onclick="window.location.href='StudentReport.jsp'">Open Reports</button>
            </div>

            <div class="action-box highlight">
                <div class="icon-container highlight-icon">
                    <i class="fa-solid fa-magnifying-glass-plus"></i>
                </div>
                <h3>Explore Library</h3>
                <p>Search thousands of titles and request new books.</p>
                <button class="action-link-btn primary" onclick="window.location.href='StudentSearch.jsp'">Search Now</button>
            </div>
        </div>
    </section>
</main>

</body>
</html>