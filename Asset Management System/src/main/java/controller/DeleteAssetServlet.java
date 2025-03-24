package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AssetDAO;

@WebServlet("/DeleteAssetServlet")
public class DeleteAssetServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int assetId = Integer.parseInt(request.getParameter("asset_id"));
        AssetDAO assetDAO = new AssetDAO();

        try {
            assetDAO.deleteAsset(assetId);
            response.sendRedirect("ViewAssetServlet");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
