<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Librarian Portal | Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>

<nav class="top-nav">
    <div class="nav-brand">LIBRARY ADMIN</div>
    <div class="user-info">
        <span>Logged in as <strong>Head Librarian</strong></span>
        <button class="logout-btn" onclick="window.location.href='index.jsp'">Logout</button>
    </div>
</nav>

<main class="dashboard-wrapper">

    <div class="stats-row">
        <div class="stat-card">
            <span class="stat-label">Total Books</span>
            <span class="stat-value">1,240</span>
        </div>
        <div class="stat-card">
            <span class="stat-label">Issued Today</span>
            <span class="stat-value" style="color: #2563eb;">15</span>
        </div>
        <div class="stat-card">
            <span class="stat-label">Overdue Returns</span>
            <span class="stat-value warning">08</span>
        </div>
    </div>

    <section class="portal-card landscape-wide">
        <div class="header-area">
            <h1>Administration Center</h1>
            <p>Manage inventory, circulation, and student records.</p>
        </div>

        <div class="role-grid">

            <div class="action-box">
                <div class="icon-container">
                    <i class="fa-solid fa-swatchbook"></i>
                </div>
                <h3>Manage Books</h3>
                <p>Add new books to the catalog or update existing stock.</p>
                <button class="action-link-btn" onclick="window.location.href='LibrarianManageBooks.jsp'">Inventory</button>
            </div>

            <div class="action-box highlight">
                <div class="icon-container highlight-icon">
                    <i class="fa-solid fa-hand-holding-hand"></i>
                </div>
                <h3>Issue & Return</h3>
                <p>Process book allocations and returns for students/faculty.</p>
                <button class="action-link-btn primary" onclick="window.location.href='LibrarianIssue.jsp'">Circulation Desk</button>
            </div>

            <div class="action-box">
                <div class="icon-container">
                    <i class="fa-solid fa-users-viewfinder"></i>
                </div>
                <h3>Defaulter List</h3>
                <p>View students with overdue books and pending fines.</p>
                <button class="action-link-btn" onclick="window.location.href='LibrarianReports.jsp'">View Defaulters</button>
            </div>

        </div>
    </section>
</main>

</body>
</html>