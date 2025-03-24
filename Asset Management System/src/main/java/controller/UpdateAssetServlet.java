package controller;

import model.Asset;
import model.AssetDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateAssetServlet")
public class UpdateAssetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int assetId = Integer.parseInt(request.getParameter("asset_id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double value = Double.parseDouble(request.getParameter("value"));

        try {
            Asset asset = new Asset(assetId, name, description, value);
            AssetDAO assetDAO = new AssetDAO();
            assetDAO.updateAsset(asset);

            response.sendRedirect("viewAsset.jsp"); // Redirect to view page
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating asset: " + e.getMessage());
        }
    }
}
	