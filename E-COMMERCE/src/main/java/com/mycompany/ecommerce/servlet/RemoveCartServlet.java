package com.mycompany.ecommerce.servlet;

import com.mycompany.ecommerce.model.CartItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/remove-from-cart")
public class RemoveCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemId = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        ArrayList<CartItem> cartList = (ArrayList<CartItem>) session.getAttribute("cart-list");

        if (cartList != null) {
            for (CartItem item : cartList) {
                if (item.getItem_id() == itemId) {
                    cartList.remove(item);
                    break;
                }
            }
            session.setAttribute("cart-list", cartList);
        }

        response.sendRedirect("viewCart.jsp");
    }
}