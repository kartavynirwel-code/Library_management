<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Portal | Reports</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        table { width: 100%; border-collapse: collapse; margin-top: 20px; color: var(--text-main); }
        th, td { padding: 12px; border: 1px solid var(--border); text-align: left; font-size: 0.9rem; }
        th { background: #f8fafc; color: var(--text-muted); text-transform: uppercase; font-size: 0.75rem; }
        .status-pending { color: #e11d48; font-weight: bold; }
        .status-returned { color: #16a34a; font-weight: bold; }
    </style>
</head>
<body>
<main class="viewport-wrapper">
    <div class="content-container">
        <section class="portal-card" style="max-width: 900px;">
            <div class="header-area">
                <h1>Library Reports</h1>
                <p>Summary of issued and pending books</p>
            </div>

            <table>
                <thead>
                <tr>
                    <th>Book Title</th>
                    <th>Issue Date</th>
                    <th>Due Date</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Core Java Programming</td>
                    <td>2026-01-10</td>
                    <td>2026-01-25</td>
                    <td class="status-returned">Returned</td>
                </tr>
                <tr>
                    <td>Advanced Database Systems</td>
                    <td>2026-02-05</td>
                    <td>2026-02-20</td>
                    <td class="status-pending">Pending</td>
                </tr>
                </tbody>
            </table>

            <div class="action-footer">
                <button class="back-link" onclick="window.location.href='Welcome.jsp'">← Back to Dashboard</button>
            </div>
        </section>
    </div>
</main>
</body>
</html>