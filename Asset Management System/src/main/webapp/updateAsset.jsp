<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessionVar = request.getSession(true);
    ArrayList<String[]> assets = (ArrayList<String[]>) sessionVar.getAttribute("assets");

    // Retrieve asset details from the query parameters
    int index = Integer.parseInt(request.getParameter("index"));
    String name = request.getParameter("name");
    String desc = request.getParameter("desc");
    String value = request.getParameter("value");

    if (request.getMethod().equals("POST")) {
        // Get updated values from the form
        String updatedName = request.getParameter("assetName");
        String updatedDesc = request.getParameter("assetDesc");
        String updatedValue = request.getParameter("assetValue");

        // Update the asset in the session list
        assets.set(index, new String[]{updatedName, updatedDesc, updatedValue});
        sessionVar.setAttribute("assets", assets);

        // Redirect back to viewAsset.jsp with success message
        response.sendRedirect("viewAsset.jsp?message=updated");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Asset</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">✏️ Edit Asset</h2>

    <form method="post">
        <div class="mb-3">
            <label class="form-label">Asset Name</label>
            <input type="text" name="assetName" class="form-control" value="<%= name %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Description</label>
            <input type="text" name="assetDesc" class="form-control" value="<%= desc %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Value ($)</label>
            <input type="number" name="assetValue" class="form-control" value="<%= value %>" required>
        </div>
        <button type="submit" class="btn btn-primary">Save Changes</button>
        <a href="viewAsset.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
