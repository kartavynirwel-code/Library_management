<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Librarian | Defaulter Reports</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        /* Table Styling */
        table { width: 100%; border-collapse: collapse; margin-top: 20px; color: #1e293b; }
        th, td { padding: 15px; border-bottom: 1px solid #e2e8f0; text-align: left; vertical-align: middle; }
        th { background: #f8fafc; color: #64748b; text-transform: uppercase; font-size: 0.75rem; letter-spacing: 1px; font-weight: 700; }
        tr:hover { background-color: #f1f5f9; }

        /* Status Badges */
        .badge { padding: 6px 12px; border-radius: 20px; font-size: 0.75rem; font-weight: 700; text-transform: uppercase; }
        .badge-overdue { background: #fee2e2; color: #991b1b; } /* Red */
        .badge-active { background: #dbeafe; color: #1e40af; }   /* Blue */

        /* Action Button in Table */
        .btn-sm { padding: 6px 12px; font-size: 0.8rem; border-radius: 4px; border: none; cursor: pointer; transition: 0.2s; }
        .btn-notify { background: #fff; border: 1px solid #cbd5e1; color: #475569; }
        .btn-notify:hover { background: #1e293b; color: white; border-color: #1e293b; }
    </style>
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
    <section class="portal-card landscape-wide">

        <div class="header-area" style="display: flex; justify-content: space-between; align-items: end;">
            <div>
                <div class="icon-container" style="width: 50px; height: 50px; font-size: 1.2rem; margin: 0 0 15px 0;">
                    <i class="fa-solid fa-users-viewfinder"></i>
                </div>
                <h1>Circulation & Defaulter Report</h1>
                <p>Track overdue books and student fine status.</p>
            </div>

            <div style="text-align: right;">
                <input type="text" placeholder="Search Student ID..." style="padding: 10px; border: 1px solid #cbd5e1; border-radius: 6px; width: 250px;">
                <button class="submit-btn" style="width: auto; padding: 10px 20px; display: inline-block; margin: 0;">Search</button>
            </div>
        </div>

        <table>
            <thead>
            <tr>
                <th>Student Details</th>
                <th>Book Title / ISBN</th>
                <th>Issued Date</th>
                <th>Due Date</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <strong>Kartavya Nirwel</strong><br>
                    <span style="font-size: 0.8rem; color: #64748b;">STU-2026-01</span>
                </td>
                <td>
                    Database System Concepts<br>
                    <span style="font-size: 0.8rem; color: #64748b;">978-0073523323</span>
                </td>
                <td>2026-01-10</td>
                <td style="color: #dc2626; font-weight: bold;">2026-01-25</td>
                <td><span class="badge badge-overdue">Overdue (24 Days)</span></td>
                <td><button class="btn-sm btn-notify"><i class="fa-regular fa-bell"></i> Send Reminder</button></td>
            </tr>

            <tr>
                <td>
                    <strong>Rahul Sharma</strong><br>
                    <span style="font-size: 0.8rem; color: #64748b;">STU-2026-45</span>
                </td>
                <td>
                    Head First Java<br>
                    <span style="font-size: 0.8rem; color: #64748b;">978-0596009205</span>
                </td>
                <td>2026-02-15</td>
                <td>2026-03-01</td>
                <td><span class="badge badge-active">Active</span></td>
                <td><button class="btn-sm btn-notify" disabled style="opacity: 0.5;">No Action</button></td>
            </tr>

            <tr>
                <td>
                    <strong>Priya Verma</strong><br>
                    <span style="font-size: 0.8rem; color: #64748b;">STU-2026-12</span>
                </td>
                <td>
                    Operating System Principles<br>
                    <span style="font-size: 0.8rem; color: #64748b;">978-1118063330</span>
                </td>
                <td>2026-01-05</td>
                <td style="color: #dc2626; font-weight: bold;">2026-01-20</td>
                <td><span class="badge badge-overdue">Overdue (29 Days)</span></td>
                <td><button class="btn-sm btn-notify"><i class="fa-regular fa-bell"></i> Send Reminder</button></td>
            </tr>
            </tbody>
        </table>

        <div class="action-footer" style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px;">
            <span style="font-size: 0.85rem; color: #64748b;">Showing 3 of 15 records</span>
            <button class="back-link" onclick="window.location.href='Librarian.jsp'">← Back to Dashboard</button>
        </div>
    </section>
</main>

</body>
</html>