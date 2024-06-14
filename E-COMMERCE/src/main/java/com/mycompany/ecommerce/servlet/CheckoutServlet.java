package com.mycompany.ecommerce.servlet;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.mycompany.ecommerce.dao.OrderDAO;
import com.mycompany.ecommerce.model.CartItem;

@jakarta.servlet.annotation.WebServlet(name = "CheckoutServlet", urlPatterns = "/cart-check-out")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        ArrayList<CartItem> cart_list = (ArrayList<CartItem>) session.getAttribute("cart-list");
        for (CartItem i : cart_list){
            System.out.println(i.getItem_name());
            System.out.println(i.getItem_id());
            System.out.println(i.getItem_category());
            System.out.println(i.getPrice());

        }

        if (!cart_list.isEmpty()) {
            OrderDAO orderDAO = new OrderDAO();
            boolean isOrderPlaced = orderDAO.placeOrder(cart_list, userId);

            if (isOrderPlaced) {
                session.removeAttribute("cart-list");
                response.sendRedirect("order-confirmation.jsp");
            } else {
                response.sendRedirect("viewCart.jsp?error=Order could not be placed");
            }
        } else {
            response.sendRedirect("viewCart.jsp?error=Your cart is empty");
        }
    }
}

