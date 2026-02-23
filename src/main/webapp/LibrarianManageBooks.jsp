<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Librarian | Manage Inventory</title>
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
    <section class="portal-card" style="max-width: 800px; margin: 0 auto;">
        <div class="header-area">
            <div class="icon-container" style="margin-bottom: 15px;">
                <i class="fa-solid fa-plus"></i>
            </div>
            <h1>Add New Book</h1>
            <p>Enter details to register new physical assets in the system.</p>
        </div>

        <form class="auth-form" action="AddBookServlet" method="POST">
            <div class="input-field">
                <label>Book Title</label>
                <input type="text" name="title" placeholder="e.g. Introduction to Algorithms" required>
            </div>

            <div class="input-field">
                <label>Author Name</label>
                <input type="text" name="author" placeholder="e.g. Thomas H. Cormen" required>
            </div>

            <div class="input-field" style="display: flex; gap: 20px;">
                <div style="flex: 1;">
                    <label>ISBN Number</label>
                    <input type="text" name="isbn" placeholder="978-0262033848" required>
                </div>
                <div style="flex: 1;">
                    <label>Quantity</label>
                    <input type="number" name="quantity" placeholder="10" min="1" required>
                </div>
            </div>

            <div class="input-field">
                <label>Category / Genre</label>
                <select name="category" style="width: 100%; padding: 12px; border: 1px solid #e2e8f0; border-radius: 4px; background: #f8fafc;">
                    <option value="CS">Computer Science</option>
                    <option value="ECE">Electronics (ECE)</option>
                    <option value="ME">Mechanical</option>
                    <option value="MGT">Management</option>
                </select>
            </div>

            <button type="submit" class="submit-btn">Add Book to Inventory</button>
        </form>

        <div class="action-footer">
            <button class="back-link" onclick="window.location.href='Librarian.jsp'">← Back to Dashboard</button>
        </div>
    </section>
</main>

</body>
</html>