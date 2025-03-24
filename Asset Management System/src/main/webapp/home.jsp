<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.Year" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ include file="header.jsp" %>

<%
    // Get the existing session, don't create a new one
    HttpSession sessionVar = request.getSession(false);

    if (sessionVar == null || sessionVar.getAttribute("username") == null) {
        response.sendRedirect("login.html?error=Session expired, please login again");
        return;
    }

    // Get the username (stored in session after login)
    String username = (String) sessionVar.getAttribute("username");

    // Get login count from session
    Integer loginCount = (Integer) sessionVar.getAttribute("loginCount");
    if (loginCount == null) {
        loginCount = 1; // First login
        sessionVar.setAttribute("loginCount", loginCount);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Asset Management System</title>

    <!-- Bootstrap & Custom Styles -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <style>
        /* General Styling */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            animation: fadeIn 1s ease-in-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Header */
        header {
            background: #007bff;
            color: white;
            padding: 15px 0;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Welcome Section */
        .welcome-section {
            text-align: center;
            margin-top: 30px;
            font-size: 22px;
            font-weight: bold;
            color: #007bff;
        }
        .login-info {
            text-align: center;
            font-size: 18px;
            margin-top: 10px;
        }

        /* Navigation */
        .navigation {
            text-align: center;
            margin-top: 20px;
        }
        .navigation ul {
            list-style-type: none;
            padding: 0;
        }
        .navigation ul li {
            display: inline-block;
            margin: 10px;
        }
        .navigation ul li a {
            text-decoration: none;
            font-size: 18px;
            color: #007bff;
            font-weight: 600;
            padding: 10px 15px;
            transition: all 0.3s;
            border-radius: 5px;
            background: white;
            border: 2px solid #007bff;
        }
        .navigation ul li a:hover {
            color: white;
            background: #007bff;
        }

        /* Add Button */
        .add-btn {
            display: inline-block;
            background: #28a745;
            color: white;
            padding: 12px 20px;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s ease-in-out;
        }
        .add-btn:hover {
            background: #218838;
        }

        /* Footer */
        footer {
            background: #343a40;
            color: white;
            text-align: center;
            padding: 15px;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 14px;
        }

        /* Logout Modal */
        .modal-footer button {
            width: 100px;
        }
    </style>
</head>
<body>

<!-- Header -->
<header>
    <h1>Asset Management System</h1>
</header>

<!-- Welcome Section -->
<div class="container mt-4 text-center">
    <h2 class="welcome-section">Welcome, <%= username %>! <i class="bi bi-person-circle"></i></h2>
    <p class="login-info">You have logged in <strong><%= loginCount %></strong> times.</p>
</div>

<!-- Navigation -->
<div class="navigation">
    <ul>
        <li><a href="viewAsset.jsp"><i class="bi bi-folder"></i> View Assets</a></li>
        <li><a href="addAsset.jsp" class="add-btn"><i class="bi bi-plus-lg"></i> Add New Asset</a></li>
        <li><a href="#" data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
    </ul>
</div>

<!-- Logout Confirmation Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="logoutModalLabel"><i class="bi bi-exclamation-circle"></i> Confirm Logout</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to logout?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <a href="logout.jsp" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>&copy; <%= Year.now() %> Asset Management System. All rights reserved.</p>
</footer>

<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
