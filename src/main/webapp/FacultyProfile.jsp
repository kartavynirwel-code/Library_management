<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Portal | Profile</title>
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
    <section class="portal-card" style="max-width: 800px; margin: 0 auto;">
        <div class="header-area">
            <div class="icon-container" style="margin-bottom: 15px;">
                <i class="fa-solid fa-user-tie"></i>
            </div>
            <h1>Faculty Profile</h1>
            <p>View your departmental details and update security settings.</p>
        </div>

        <form class="auth-form" action="UpdateProfileServlet" method="POST">
            <div class="input-field">
                <label>Full Name</label>
                <input type="text" value="Kartavya Nirwel" readonly style="background-color: #f1f5f9; cursor: not-allowed;">
            </div>

            <div class="input-field">
                <label>Department</label>
                <input type="text" value="Computer Science & Engineering" readonly style="background-color: #f1f5f9; cursor: not-allowed;">
            </div>

            <div class="input-field">
                <label>Email Address</label>
                <input type="email" value="faculty@example.com" readonly style="background-color: #f1f5f9; cursor: not-allowed;">
            </div>

            <div class="input-field">
                <label>Update Security Key (Password)</label>
                <input type="password" placeholder="Enter new password to update" name="new_password">
            </div>

            <button type="submit" class="submit-btn">Save Changes</button>
        </form>

        <div class="action-footer">
            <button class="back-link" onclick="window.location.href='Faculty.jsp'">← Back to Dashboard</button>
        </div>
    </section>
</main>

</body>
</html>