<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessionVar = request.getSession(false);
    if (sessionVar != null) {
        sessionVar.removeAttribute("username"); // Remove only user session
    }

    // Redirect to login page
    response.sendRedirect("login.html");
%>
