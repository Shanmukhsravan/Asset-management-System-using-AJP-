<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    if (id != null) {
        String jdbcURL = "jdbc:mysql://localhost:3306/AssetDB";
        String dbUser = "root";
        String dbPassword = "123456789";

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        String sql = "DELETE FROM assets WHERE id=?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, id);
        statement.executeUpdate();

        statement.close();
        conn.close();
    }
    response.sendRedirect("viewAsset.jsp?message=Asset deleted successfully!");
%>
