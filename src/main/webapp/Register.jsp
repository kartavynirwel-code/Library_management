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

                <!-- Account Type -->
                <div class="input-field">
                    <label>Account Type</label>
                    <select name="role" required style="width: 100%; padding: 12px;">
                        <option value="student">Student</option>
                        <option value="librarian">Librarian</option>
                    </select>
                </div>

                <!-- Full Name -->
                <div class="input-field">
                    <label>Full Name</label>
                    <input type="text" name="fullname" placeholder="John Doe" required>
                </div>

                <!-- Email -->
                <div class="input-field">
                    <label>Email Address</label>
                    <input type="email" name="email" placeholder="name@example.com" required>
                </div>

                <!-- Password -->
                <div class="input-field">
                    <label>Create Password</label>
                    <input type="password" name="password" required>
                </div>

                <!-- Confirm Password -->
                <div class="input-field">
                    <label>Confirm Password</label>
                    <input type="password" name="confirm_password" required>
                </div>

                <!-- Mobile -->
                <div class="input-field">
                    <label>Mobile</label>
                    <input type="text" name="mobile" required>
                </div>

                <!-- Address -->
                <div class="input-field">
                    <label>Address</label>
                    <input type="text" name="address" required>
                </div>

                <!-- Branch -->
                <div class="input-field">
                    <label>Branch</label>
                    <input type="text" name="branch" required>
                </div>

                <!-- Year -->
                <div class="input-field">
                    <label>Year</label>
                    <input type="number" name="year" min="1" max="5" required>
                </div>

                <!-- Course -->
                <div class="input-field">
                    <label>Course</label>
                    <input type="text" name="course" required>
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