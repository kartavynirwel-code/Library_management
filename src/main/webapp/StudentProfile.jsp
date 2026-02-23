<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal | My Profile</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>

        .profile-card {
            max-width: 650px;
            margin: 40px auto;
            padding: 40px 50px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        .profile-icon {
            width: 80px;
            height: 80px;
            background: #eff6ff;
            color: #2563eb;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 2.5rem;
            margin: 0 auto 20px;
        }
        .readonly-input {
            background-color: #f8fafc;
            color: #475569;
            cursor: not-allowed;
            border: 1px solid #e2e8f0;
        }
    </style>
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
    <div class="profile-card">

        <div class="header-area" style="text-align: center; margin-bottom: 35px;">
            <div class="profile-icon">
                <i class="fa-solid fa-address-card"></i>
            </div>
            <h1 style="font-size: 1.8rem; color: #1e293b; margin-bottom: 8px;">Student Profile</h1>
            <p style="color: #64748b; font-size: 0.95rem;">View your academic details and manage security.</p>
        </div>

        <form class="auth-form" action="Update" method="POST" style="max-width: 100%;">

            <div style="display: flex; gap: 20px; margin-bottom: 15px;">
                <div class="input-field" style="flex: 1; margin-bottom: 0;">
                    <label>Student ID (System Generated)</label>
                    <input type="text" value="<%= request.getAttribute("id") %>" readonly class="readonly-input">
                </div>
                <div class="input-field" style="flex: 1; margin-bottom: 0;">
                    <label>Account Role</label>
                    <input type="text" value="<%= request.getAttribute("role") %><%= request.getAttribute("fullname") %>" readonly class="readonly-input">
                </div>
            </div>

            <div class="input-field">
                <label>Full Name</label>
                <input type="text"
                       value="<%= request.getAttribute("fullname") %>"
                       readonly class="readonly-input">

            </div>

            <div class="input-field">
                <label>Registered Email Address</label>
                <input type="text"
                       value="<%= request.getAttribute("email") %>"
                       readonly class="readonly-input">

            </div>

            <hr style="border: 0; border-top: 1px solid #e2e8f0; margin: 25px 0;">

            <div class="input-field">
                <label style="color: #2563eb;">Update Security Key (New Password)</label>
                <input type="password" name="new_password" placeholder="Enter new password to update" required style="border-color: #cbd5e1;">
            </div>

            <button type="submit" class="submit-btn" style="margin-top: 20px;">Update Password</button>
        </form>

        <div class="action-footer" style="margin-top: 30px; text-align: center; border-top: none; padding-top: 0;">
            <button class="back-link" style="display: inline-block; font-size: 0.95rem;" onclick="window.location.href='Welcome.jsp'">← Back to Dashboard</button>
        </div>

    </div>
</main>

</body>
</html>