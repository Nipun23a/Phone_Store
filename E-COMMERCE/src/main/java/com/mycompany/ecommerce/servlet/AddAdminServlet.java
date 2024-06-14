package com.mycompany.ecommerce.servlet;

import com.mycompany.ecommerce.model.Users;
import com.mycompany.ecommerce.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/add-admin")
public class AddAdminServlet extends HttpServlet {
    private UserService userService = new UserService();

    public AddAdminServlet() {
        this.userService = new UserService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");


        Users user = new Users();
        user.setName(name);
        user.setUsername(username);
        user.setPassword(password);
        user.setRole("ADMIN");

        userService.register(user);
        response.sendRedirect("admin-dashboard.jsp");
    }
}