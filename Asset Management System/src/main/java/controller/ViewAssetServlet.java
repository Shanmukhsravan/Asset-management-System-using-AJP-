package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import model.Asset;
import model.AssetDAO;

@WebServlet("/ViewAssetServlet")
public class ViewAssetServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AssetDAO assetDAO = new AssetDAO();
        try {
            List<Asset> assets = assetDAO.getAllAssets();
            request.setAttribute("assets", assets);
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewAsset.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
