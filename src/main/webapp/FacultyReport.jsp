<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Faculty Portal | Allocations</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        /* Table Styling specific to Reports */
        table { width: 100%; border-collapse: collapse; margin-top: 20px; color: #1e293b; }
        th, td { padding: 15px; border-bottom: 1px solid #e2e8f0; text-align: left; font-size: 0.95rem; }
        th { background: #f8fafc; color: #64748b; text-transform: uppercase; font-size: 0.75rem; letter-spacing: 1px; }
        tr:hover { background-color: #f8fafc; }
        .status-active { color: #2563eb; font-weight: bold; background: #eff6ff; padding: 5px 10px; border-radius: 4px; font-size: 0.8rem; }
        .status-overdue { color: #e11d48; font-weight: bold; background: #ffe4e6; padding: 5px 10px; border-radius: 4px; font-size: 0.8rem; }
    </style>
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
    <section class="portal-card landscape-wide">
        <div class="header-area">
            <h1>Allocation History</h1>
            <p>Resources currently issued to you for academic purposes.</p>
        </div>

        <table>
            <thead>
            <tr>
                <th>Resource Title</th>
                <th>Accession ID</th>
                <th>Allocated Date</th>
                <th>Return Due</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><strong>Distributed Systems: Concepts and Design</strong><br><span style="font-size:0.8rem; color:#64748b;">Coulouris, Dollimore</span></td>
                <td>BK-2024-889</td>
                <td>2026-02-01</td>
                <td>2026-05-01</td>
                <td><span class="status-active">Active Allocation</span></td>
            </tr>
            <tr>
                <td><strong>Clean Architecture</strong><br><span style="font-size:0.8rem; color:#64748b;">Robert C. Martin</span></td>
                <td>BK-2023-112</td>
                <td>2025-12-10</td>
                <td>2026-01-10</td>
                <td><span class="status-overdue">Return Overdue</span></td>
            </tr>
            <tr>
                <td><strong>Modern Operating Systems</strong><br><span style="font-size:0.8rem; color:#64748b;">Andrew S. Tanenbaum</span></td>
                <td>BK-2023-005</td>
                <td>2025-11-01</td>
                <td>2025-12-01</td>
                <td><span style="color: #059669; font-weight: bold; font-size: 0.8rem;">Returned</span></td>
            </tr>
            </tbody>
        </table>

        <div class="action-footer">
            <button class="back-link" onclick="window.location.href='Faculty.jsp'">← Back to Dashboard</button>
        </div>
    </section>
</main>

</body>
</html>