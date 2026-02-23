<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Portal | Search</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<main class="viewport-wrapper">
    <div class="content-container">
        <section class="portal-card">
            <div class="header-area">
                <h1>Search Library Catalog</h1>
                <p>Find your next read and request it from the librarian</p>
            </div>

            <form class="auth-form" style="max-width: 100%; display: flex; gap: 10px; margin-bottom: 30px;">
                <input type="text" placeholder="Enter Book Name, Author or ISBN..." style="flex: 3;">
                <button type="button" class="submit-btn" style="flex: 1; margin-top: 0;">Search</button>
            </form>

            <div class="role-grid">
                <div class="choice-btn" style="text-align: left; cursor: default;">
                    <h4 style="margin:0;">Effective Java</h4>
                    <p style="font-size: 0.8rem; color: #64748b;">Author: Joshua Bloch</p>
                    <button class="submit-btn" style="padding: 8px; font-size: 0.8rem; background: var(--accent);" onclick="alert('Request sent to Librarian!')">Request Book</button>
                </div>
                <div class="choice-btn" style="text-align: left; cursor: default;">
                    <h4 style="margin:0;">Clean Code</h4>
                    <p style="font-size: 0.8rem; color: #64748b;">Author: Robert C. Martin</p>
                    <button class="submit-btn" style="padding: 8px; font-size: 0.8rem; background: var(--accent);" onclick="alert('Request sent to Librarian!')">Request Book</button>
                </div>
            </div>

            <div class="action-footer">
                <button class="back-link" onclick="window.location.href='Welcome.jsp'">← Back to Dashboard</button>
            </div>
        </section>
    </div>
</main>
</body>
</html>