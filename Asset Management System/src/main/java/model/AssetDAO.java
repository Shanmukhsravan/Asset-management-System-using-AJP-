package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AssetDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/AssetDB";
    private static final String USER = "root";
    private static final String PASSWORD = "123456789";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Add Asset
    public void addAsset(Asset asset) throws SQLException {
        String sql = "INSERT INTO Asset (name, description, value) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
        
            stmt.setString(1, asset.getName());
            stmt.setString(2, asset.getDescription());
            stmt.setDouble(3, asset.getValue());
            stmt.executeUpdate();
        }
    }

    // Retrieve All Assets
    public List<Asset> getAllAssets() throws SQLException {
        List<Asset> assets = new ArrayList<>();
        String sql = "SELECT * FROM Asset";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                assets.add(new Asset(
                    rs.getInt("asset_id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getDouble("value")
                ));
            }
        }
        return assets;
    }

    // Fetch Asset by ID
    public Asset getAssetById(int assetId) throws SQLException {
        String sql = "SELECT * FROM Asset WHERE asset_id=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, assetId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Asset(
                    rs.getInt("asset_id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getDouble("value")
                );
            }
        }
        return null; // Return null if no asset is found
    }

    // Update Asset
    public void updateAsset(Asset asset) throws SQLException {
        String sql = "UPDATE Asset SET name=?, description=?, value=? WHERE asset_id=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, asset.getName());
            stmt.setString(2, asset.getDescription());
            stmt.setDouble(3, asset.getValue());
            stmt.setInt(4, asset.getAssetId());
            stmt.executeUpdate();
        }
    }

    // Delete Asset
    public void deleteAsset(int assetId) throws SQLException {
        String sql = "DELETE FROM Asset WHERE asset_id=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, assetId);
            stmt.executeUpdate();
        }
    }
}
