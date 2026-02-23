<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Management System | Secure Portal</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<main class="viewport-wrapper">
    <div class="content-container">

        <section id="roleSelection" class="portal-card">
            <div class="header-area">
                <h1>Library Portal</h1>
                <p>Select your Role</p>
            </div>
            <div class="role-grid">
                <button class="choice-btn" onclick="openLogin('Student')">Student</button>
                <button class="choice-btn" onclick="openLogin('Faculty')">Faculty</button>
                <button class="choice-btn" onclick="openLogin('Librarian')">Librarian</button>
            </div>
        </section>

        <section id="loginSection" class="portal-card hidden">
            <div class="header-area">
                <h1 id="loginTitle">Login</h1>
                <p>Enter your credentials below</p>
            </div>

            <form id="loginForm" class="auth-form" method="POST">
                <div class="input-field">
                    <label>EMAIL ADDRESS</label>
                    <input type="email" placeholder="name@example.com" name="id" required>
                </div>
                <div class="input-field">
                    <label>PASSWORD</label>
                    <input type="password" placeholder="••••••••" name="pass" required>
                </div>
                <button type="submit" class="submit-btn">Log In</button>
            </form>

            <div class="action-footer">
                <button class="link-btn" onclick="window.location.href='Register.jsp'">New User? Register here</button>
                <button class="back-link" onclick="goBack()">← Change Designation</button>
            </div>
        </section>

    </div>
</main>

<script>
    let selectedRole = "";

    function openLogin(role) {
        selectedRole = role;
        document.getElementById('roleSelection').classList.add('hidden');
        document.getElementById('loginSection').classList.remove('hidden');
        document.getElementById('loginTitle').innerText = role + " Authentication";

        document.getElementById('loginForm').action = "verify?role=" + role;
    }

    function goBack() {
        document.getElementById('loginSection').classList.add('hidden');
        document.getElementById('roleSelection').classList.remove('hidden');
    }
</script>
</body>
</html>