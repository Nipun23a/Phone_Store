package com.mycompany.ecommerce.security;


import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/admin-dashboard.jsp")
public class AdminAccessFilter extends HttpFilter implements Filter {
    private static final long serialVersionUID = 1L;

    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            System.out.println("Session or user_id attribute is null");
            response.sendRedirect("login.jsp");
        } else {
            String userRole = (String) session.getAttribute("role");
            System.out.println(userRole);
            if ("ADMIN".equals(userRole)) {
                System.out.println("User is not an admin1");
                chain.doFilter(request, response);
            } else {
                System.out.println("User is not an admin");
                response.sendRedirect("login.jsp");
            }
        }
    }

    public void init(FilterConfig fConfig) throws ServletException {
        // Initialization code, if needed
    }

    public void destroy() {
        // Cleanup code, if needed
    }
}


