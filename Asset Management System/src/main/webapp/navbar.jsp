<nav>
    <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="addAsset.jsp">Add Asset</a></li>
        <li><a href="viewAsset.jsp">View Assets</a></li>
        <li>Welcome, <%= session.getAttribute("username") %></li>
        <li><a href="LogoutServlet">Logout</a></li>
    </ul>
</nav>
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!-- Bootstrap JS (Optional for components like modals, tooltips, etc.) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>