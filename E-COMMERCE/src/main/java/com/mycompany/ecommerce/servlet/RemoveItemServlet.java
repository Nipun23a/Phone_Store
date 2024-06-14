package com.mycompany.ecommerce.servlet;
import com.mycompany.ecommerce.dao.AdminDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RemoveItemServlet")
public class RemoveItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        AdminDAO adminDAO = new AdminDAO();
        adminDAO.removeItem(itemId);
        response.sendRedirect("itemResult.jsp");
    }
}

