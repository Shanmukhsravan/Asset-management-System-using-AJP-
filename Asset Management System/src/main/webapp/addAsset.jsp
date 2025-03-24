<%@ page import="java.io.*, java.util.*, java.time.Year" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%@ page import="java.io.*, java.util.*, java.time.Year, java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessionVar = request.getSession(true);
    String username = (String) sessionVar.getAttribute("username");
    if (username == null) {
        username = "User";
    }

    // Retrieve stored assets list from session
    ArrayList<String[]> assets = (ArrayList<String[]>) sessionVar.getAttribute("assets");
    if (assets == null) {
        assets = new ArrayList<>();
    }

    // Get form data
    String assetName = request.getParameter("assetName");
    String description = request.getParameter("description");
    String value = request.getParameter("value");

    String message = "";
    String messageClass = "d-none";

    if (assetName != null && description != null && value != null) {
        try {
            double assetValue = Double.parseDouble(value);
            // Save new asset
            String[] newAsset = {assetName, description, value};
            assets.add(newAsset);
            sessionVar.setAttribute("assets", assets); // Store in session
            
            // Redirect to prevent resubmission
            response.sendRedirect("viewAsset.jsp?message=success");
            return;
        } catch (NumberFormatException e) {
            message = "❌ Invalid value entered!";
            messageClass = "alert alert-danger text-center";
        }
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Asset - Asset Management System</title>

    <!-- Bootstrap & Icons -->
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
        .nav-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 10px;
        }
        .nav-links a {
            color: white;
            font-weight: bold;
            text-decoration: none;
            padding: 10px 15px;
            transition: background 0.3s ease-in-out;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.2);
        }
        .nav-links a:hover {
            background: rgba(255, 255, 255, 0.4);
        }

        /* Main Section */
        .container {
            max-width: 600px;
            margin-top: 30px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .header-title {
            text-align: center;
            font-weight: bold;
            font-size: 24px;
            margin-bottom: 20px;
            color: #007bff;
        }
        
        .form-label {
            font-weight: bold;
        }
        .btn-submit {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
        .btn-submit:hover {
            background-color: #0056b3;
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
    </style>
</head>
<body>

<!-- Header -->
<header>
    <h1>Asset Management System</h1>
    <div class="nav-links">
        <a href="home.jsp"><i class="bi bi-house-door"></i> Home</a>
        <a href="viewAsset.jsp"><i class="bi bi-folder"></i> View Assets</a>
        <a href="logout.jsp" class="btn btn-danger"><i class="bi bi-box-arrow-right"></i> Logout</a>
    </div>
</header>

<!-- Main Content -->
<div class="container">
    <h3 class="header-title"><i class="bi bi-plus-circle"></i> Add Asset</h3>

    <!-- Display success or error message -->
    <div class="<%= messageClass %>">
        <%= message %>
    </div>

    <form action="addAsset.jsp" method="POST">
        <!-- Asset Name -->
        <div class="mb-3">
            <label class="form-label">Asset Name:</label>
            <input type="text" name="assetName" class="form-control" required>
        </div>

        <!-- Description -->
        <div class="mb-3">
            <label class="form-label">Description:</label>
            <textarea name="description" class="form-control" rows="3" required></textarea>
        </div>

        <!-- Asset Value -->
        <div class="mb-3">
            <label class="form-label">Value ($):</label>
            <input type="number" name="value" class="form-control" required>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-submit w-100"><i class="bi bi-check-lg"></i> Submit</button>
    </form>
</div>

<!-- Footer -->
<footer>
    <p>&copy; <%= Year.now() %> Asset Management System. All rights reserved.</p>
</footer>

<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
