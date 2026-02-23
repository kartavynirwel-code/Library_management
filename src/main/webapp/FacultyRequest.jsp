<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Faculty Portal | Request Resource</title>
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
            <div class="icon-container highlight-icon" style="margin-bottom: 15px;">
                <i class="fa-solid fa-book-journal-whills"></i>
            </div>
            <h1>Resource Purchase Request</h1>
            <p>Recommend new books or journals for the department library.</p>
        </div>

        <form class="auth-form" action="BookRequestServlet" method="POST">
            <div class="input-field">
                <label>Book / Journal Title</label>
                <input type="text" name="title" placeholder="e.g. Artificial Intelligence: A Modern Approach" required>
            </div>

            <div class="input-field">
                <label>Author / Publisher</label>
                <input type="text" name="author" placeholder="e.g. Stuart Russell / Pearson" required>
            </div>

            <div class="input-field">
                <label>ISBN (Optional)</label>
                <input type="text" name="isbn" placeholder="978-3-16-148410-0">
            </div>

            <div class="input-field">
                <label>Priority Level</label>
                <select name="priority" style="width: 100%; padding: 12px; border: 1px solid #e2e8f0; border-radius: 4px; background: #f8fafc;">
                    <option value="Standard">Standard Recommendation</option>
                    <option value="High">High - Urgent for Coursework</option>
                    <option value="Research">Research Requirement</option>
                </select>
            </div>

            <div class="input-field">
                <label>Additional Notes</label>
                <input type="text" name="notes" placeholder="e.g. Required for CS-602 Syllabus">
            </div>

            <button type="submit" class="submit-btn">Submit Requisition</button>
        </form>

        <div class="action-footer">
            <button class="back-link" onclick="window.location.href='Faculty.jsp'">← Cancel & Return</button>
        </div>
    </section>
</main>

</body>
</html>