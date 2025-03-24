<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessionVar = request.getSession(true);
    ArrayList<String[]> assets = (ArrayList<String[]>) sessionVar.getAttribute("assets");
    if (assets == null) {
        assets = new ArrayList<>();
    }

    // Handling delete request
    String deleteIndexStr = request.getParameter("deleteIndex");
    if (deleteIndexStr != null) {
        int deleteIndex = Integer.parseInt(deleteIndexStr);
        if (deleteIndex >= 0 && deleteIndex < assets.size()) {
            assets.remove(deleteIndex);
            sessionVar.setAttribute("assets", assets);
            response.sendRedirect("viewAsset.jsp?message=deleted");
            return;
        }
    }

    // Success message handling
    String message = request.getParameter("message");
    String alertClass = "d-none";
    String alertMessage = "";

    if ("success".equals(message)) {
        alertClass = "alert alert-success text-center";
        alertMessage = "✅ Asset added successfully!";
    } else if ("updated".equals(message)) {
        alertClass = "alert alert-info text-center";
        alertMessage = "🔄 Asset updated successfully!";
    } else if ("deleted".equals(message)) {
        alertClass = "alert alert-danger text-center";
        alertMessage = "❌ Asset deleted successfully!";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Assets - Asset Management System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; }
        header { background: #007bff; color: white; padding: 15px; text-align: center; }
        .nav-links { text-align: center; margin-top: 10px; }
        .nav-links a { color: white; font-weight: bold; text-decoration: none; padding: 10px 15px; margin: 5px; border-radius: 5px; }
        .nav-links a:hover { background: rgba(255, 255, 255, 0.2); }
        .container { max-width: 800px; margin-top: 30px; background: white; padding: 30px; border-radius: 10px; }
        .btn-submit { background-color: #007bff; color: white; font-weight: bold; }
        .btn-danger, .btn-warning { font-size: 14px; padding: 5px 10px; }
        footer { background: #343a40; color: white; text-align: center; padding: 15px; position: fixed; bottom: 0; width: 100%; }
    </style>
</head>
<body>

<header>
    <h1>Asset Management System</h1>
    <div class="nav-links">
        <a href="home.jsp"><i class="bi bi-house-door"></i> Home</a>
        <a href="addAsset.jsp"><i class="bi bi-plus-circle"></i> Add Asset</a>
        <a href="logout.jsp" class="btn btn-danger"><i class="bi bi-box-arrow-right"></i> Logout</a>
    </div>
</header>

<div class="container">
    <h3 class="text-center">📋 Asset List</h3>

    <!-- Success Message -->
    <div class="<%= alertClass %>"><%= alertMessage %></div>

    <!-- Table -->
    <table class="table table-hover mt-3">
        <thead class="table-dark">
            <tr>
                <th>Asset Name</th>
                <th>Description</th>
                <th>Value (₹)</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (!assets.isEmpty()) {
                    for (int i = 0; i < assets.size(); i++) {
                        String[] asset = assets.get(i);
            %>
                        <tr>
                            <td><%= asset[0] %></td>
                            <td><%= asset[1] %></td>
                            <td>₹Rs.<%= asset[2] %> /-</td>
                            <td>
                                <a href="updateAsset.jsp?index=<%= i %>&name=<%= asset[0] %>&desc=<%= asset[1] %>&value=<%= asset[2] %>" class="btn btn-warning btn-sm">Edit</a>
                                <a href="viewAsset.jsp?deleteIndex=<%= i %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this asset?');">Delete</a>
                            </td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="4" class="text-center text-muted">No assets available</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<footer>
    <p>&copy; <%= java.time.Year.now() %> Asset Management System. All rights reserved.</p>
</footer>

</body>
</html>
