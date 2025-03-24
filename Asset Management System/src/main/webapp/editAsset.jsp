<%@ include file="header.jsp" %>
<%@ page import="model.Asset, model.AssetDAO" %>

<%
    int assetId = Integer.parseInt(request.getParameter("asset_id"));
    AssetDAO assetDAO = new AssetDAO();
    Asset asset = assetDAO.getAssetById(assetId);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Asset</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!-- Bootstrap JS (Optional for components like modals, tooltips, etc.) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

    <h2>Edit Asset</h2>

    <form action="UpdateAssetServlet" method="post">
        <input type="hidden" name="asset_id" value="<%= asset.getAssetId() %>">

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= asset.getName() %>" required><br>

        <label for="description">Description:</label>
        <textarea id="description" name="description" required><%= asset.getDescription() %></textarea><br>

        <label for="value">Value:</label>
        <input type="number" id="value" name="value" step="0.01" value="<%= asset.getValue() %>" required><br>

        <button type="submit">Update Asset</button>
    </form>

    <p><a href="viewAsset.jsp">Back to Asset List</a></p>

</body>
</html>

<%@ include file="footer.jsp" %>
