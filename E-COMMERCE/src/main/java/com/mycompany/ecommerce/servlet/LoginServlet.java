package com.mycompany.ecommerce.servlet;

import com.mycompany.ecommerce.model.Users;
import com.mycompany.ecommerce.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;



public class LoginServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Users user = userService.authenticate(username,password);
        if (user !=null){
            HttpSession session = req.getSession();
            session.setAttribute("user_id", user.getId());
            session.setAttribute("role",user.getRole());
            if (user.getRole().equals("USER")){
                resp.sendRedirect("index.jsp");
            } else if ((user.getRole().equals("ADMIN"))) {
                resp.sendRedirect("admin-dashboard.jsp");
            }
        }else {
            resp.sendRedirect("login.jsp?error=Invalid username or password");
        }
    }
}
