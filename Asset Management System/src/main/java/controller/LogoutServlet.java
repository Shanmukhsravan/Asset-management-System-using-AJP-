package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        Integer loginCount = 0;

        if (session != null) {
            loginCount = (Integer) session.getAttribute("loginCount");
            session.invalidate(); // Destroy session
        }

        // Store login count in cookies to persist even after logout
        Cookie loginCountCookie = new Cookie("loginCount", loginCount.toString());
        loginCountCookie.setMaxAge(60 * 60 * 24 * 30); // Store for 30 days
        response.addCookie(loginCountCookie);

        response.sendRedirect("login.html"); // Redirect to login page
    }
}
