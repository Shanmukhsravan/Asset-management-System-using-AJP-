package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Debugging: Print received parameters
        System.out.println("Received parameters:");
        System.out.println("rollNumber: " + request.getParameter("rollNumber"));
        System.out.println("password: " + request.getParameter("password"));

        // Retrieve parameters safely
        String rollNumber = request.getParameter("rollNumber");
        String password = request.getParameter("password");

        // Handle missing or empty values
        if (rollNumber == null || password == null || rollNumber.trim().isEmpty() || password.trim().isEmpty()) {
            response.getWriter().println("Error: Missing roll number or password.");
            return;
        }

        // Simple validation: username = password
        if (rollNumber.equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", rollNumber);

            // Retrieve login count from session
            Integer loginCount = (Integer) session.getAttribute("loginCount");
            if (loginCount == null) {
                loginCount = 0;
            }
            loginCount++; // Increment count
            session.setAttribute("loginCount", loginCount);

            // Store login count in cookies
            Cookie loginCountCookie = new Cookie("loginCount", loginCount.toString());
            loginCountCookie.setMaxAge(60 * 60 * 24 * 30); // Store for 30 days
            response.addCookie(loginCountCookie);

            response.sendRedirect("home.jsp"); // Redirect to home page
        } else {
            response.getWriter().println("Invalid Credentials! Try again.");
        }
    }
}
