<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Librarian | Circulation Desk</title>
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
    <div class="header-area" style="text-align: center; margin-bottom: 30px;">
        <h1 style="color: white;">Circulation Desk</h1>
        <p style="color: #94a3b8;">Process student requests and returns.</p>
    </div>

    <div class="role-grid" style="grid-template-columns: 1fr 1fr; gap: 40px;">

        <section class="portal-card">
            <div class="header-area">
                <h2 style="color: #2563eb;"><i class="fa-solid fa-arrow-right-from-bracket"></i> Issue Book</h2>
                <p>Allocate a book to a student.</p>
            </div>
            <form action="IssueBookServlet" method="POST" class="auth-form">
                <div class="input-field">
                    <label>Student ID</label>
                    <input type="text" name="student_id" placeholder="STU-2026-XX" required>
                </div>
                <div class="input-field">
                    <label>Book ID / ISBN</label>
                    <input type="text" name="book_id" placeholder="BK-XXXX" required>
                </div>
                <button type="submit" class="submit-btn" style="background-color: #2563eb;">Issue Book</button>
            </form>
        </section>

        <section class="portal-card">
            <div class="header-area">
                <h2 style="color: #16a34a;"><i class="fa-solid fa-arrow-right-to-bracket"></i> Return Book</h2>
                <p>Accept a book return.</p>
            </div>
            <form action="ReturnBookServlet" method="POST" class="auth-form">
                <div class="input-field">
                    <label>Book ID</label>
                    <input type="text" name="book_id" placeholder="BK-XXXX" required>
                </div>
                <div class="input-field">
                    <label>Student ID</label>
                    <input type="text" name="student_id" placeholder="STU-2026-XX" required>
                </div>
                <button type="submit" class="submit-btn" style="background-color: #16a34a;">Process Return</button>
            </form>
        </section>

    </div>

    <div style="text-align: center; margin-top: 30px;">
        <button class="back-link" style="color: #cbd5e1;" onclick="window.location.href='Librarian.jsp'">← Back to Dashboard</button>
    </div>
</main>

</body>
</html>