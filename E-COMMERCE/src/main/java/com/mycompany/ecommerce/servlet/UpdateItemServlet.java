package com.mycompany.ecommerce.servlet;

import com.mycompany.ecommerce.model.Item;
import com.mycompany.ecommerce.service.ItemService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@jakarta.servlet.annotation.WebServlet(name = "UpdateTheServlet", urlPatterns = "/UpdateTheServlet")
public class UpdateItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ItemService itemService = new ItemService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        String itemName = request.getParameter("itemName");
        String categoryId = request.getParameter("categoryId");
        String brandId = request.getParameter("brandId");
        int itemQuantity = Integer.parseInt(request.getParameter("itemQuantity"));
        double itemPrice = Double.parseDouble(request.getParameter("itemPrice"));
        String phoneDescription = request.getParameter("phoneDescription");

        Item item = itemService.getItemById(itemId);
        if (item != null) {
            item.setItem_name(itemName);
            item.setItem_category(categoryId);
            item.setItem_brand(brandId);
            item.setItem_quantity(itemQuantity);
            item.setPrice(itemPrice);
            item.setItem_description(phoneDescription);

            itemService.updateItem(item);

            // Redirect to the admin dashboard or a success page
            response.sendRedirect("admin-dashboard.jsp");
        } else {
            // Handle the case where the item is not found
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Item not found");
        }
    }
}