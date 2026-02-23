<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal | Create Account</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<main class="viewport-wrapper">
    <div class="content-container">

        <section class="portal-card">
            <div class="header-area">
                <h1>Create New Account</h1>
                <p>Register to access the Library Management System</p>
            </div>

            <form action="register" method="POST" class="auth-form">

                <div class="input-field">
                    <label>Account Type</label>
                    <select name="role" required style="width: 100%; padding: 12px; border: 1px solid #e2e8f0; border-radius: 4px;">
                        <option value="Student">Student</option>
                        <option value="Faculty">Faculty</option>
                        <option value="Librarian">Librarian</option>
                    </select>
                </div>

                <div class="input-field">
                    <label>Full Name</label>
                    <input type="text" name="fullname" placeholder="John Doe" required>
                </div>

                <div class="input-field">
                    <label>Email Address</label>
                    <input type="email" name="email" placeholder="name@example.com" required>
                </div>

                <div class="input-field">
                    <label>Create Password</label>
                    <input type="password" name="password" required>
                </div>

                <div class="input-field">
                    <label>Confirm Password</label>
                    <input type="password" name="confirm_password" required>
                </div>
                <button type="submit" class="submit-btn">Register Account</button>
            </form>

            <div class="action-footer">
                <p style="font-size: 0.85rem; color: #64748b;">Already have an account?</p>
                <a href="index.jsp" class="link-btn" style="text-decoration: none;">Back to Login</a>
            </div>
        </section>

    </div>
</main>

</body>
</html>