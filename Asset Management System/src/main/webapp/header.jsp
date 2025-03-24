<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    
    <style>
        /* Navbar Styling */
        .navbar {
            background-color: #007bff; /* Primary Blue */
            padding: 15px;
        }
        .navbar-brand {
            font-weight: bold;
            color: white !important;
            font-size: 22px;
        }
        .navbar-nav .nav-link {
            color: white !important;
            font-weight: bold;
            margin-right: 10px;
        }
        .navbar-nav .nav-link:hover {
            text-decoration: underline;
        }
        .logout-btn {
            background-color: #dc3545;
            border: none;
            padding: 8px 15px;
        }
        .logout-btn:hover {
            background-color: #c82333;
        }
        /* Page Styling */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="home.jsp">
            <i class="bi bi-layers"></i> Asset Management System
        </a>

        <!-- Mobile Toggle Button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar Links -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="home.jsp"><i class="bi bi-house-door"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="viewAsset.jsp"><i class="bi bi-eye"></i> View Assets</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addAsset.jsp"><i class="bi bi-plus-circle"></i> Add Asset</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-danger logout-btn" href="LogoutServlet">
                        <i class="bi bi-box-arrow-right"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

</body>
</html>
