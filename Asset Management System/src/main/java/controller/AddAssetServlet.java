package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Asset;
import model.AssetDAO;

@WebServlet("/AddAssetServlet")
public class AddAssetServlet extends HttpServlet {
    /**package controller;

import model.Asset;
import model.AssetDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddAssetServlet")
public class AddAssetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form data
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String valueStr = request.getParameter("value");

        try {
            double value = Double.parseDouble(valueStr); // Convert value to double

            // Create Asset object
            Asset asset = new Asset(0, name, description, value);
            AssetDAO assetDAO = new AssetDAO();
            assetDAO.addAsset(asset);

            System.out.println("✅ Asset added successfully!");

            // Redirect to view page after adding
            response.sendRedirect("viewAsset.jsp");

        } catch (NumberFormatException e) {
            System.out.println("❌ Invalid value format: " + e.getMessage());
            response.sendRedirect("addAsset.jsp?error=Invalid%20Value%20Format");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addAsset.jsp?error=Database%20Error");
        }
    }
}

	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double value = Double.parseDouble(request.getParameter("value"));

        Asset asset = new Asset(0, name, description, value);
        AssetDAO assetDAO = new AssetDAO();
        
        try {
            assetDAO.addAsset(asset);
            response.sendRedirect("viewAsset.jsp"); // Redirect to view assets
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
