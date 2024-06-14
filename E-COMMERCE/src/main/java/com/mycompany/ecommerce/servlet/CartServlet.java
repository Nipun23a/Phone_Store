package com.mycompany.ecommerce.servlet;


import com.mycompany.ecommerce.model.CartItem;
import com.mycompany.ecommerce.model.Item;
import com.mycompany.ecommerce.model.ShoppingCart;
import com.mycompany.ecommerce.service.ItemService;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


@jakarta.servlet.annotation.WebServlet(name = "AddToCartServlet", urlPatterns = "/add-to-cart")
public class CartServlet extends jakarta.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");
        if (userId == null) {
            response.sendRedirect("login.jsp");
        } else {
            try (PrintWriter out = response.getWriter()) {
                ArrayList<CartItem> cartList = new ArrayList<>();
                int id = Integer.parseInt(request.getParameter("id"));
                CartItem cm = new CartItem();
                cm.setItem_id(id);
                ArrayList<CartItem> cart_list = (ArrayList<CartItem>) session.getAttribute("cart-list");
                if (cart_list == null) {
                    cartList.add(cm);
                    session.setAttribute("cart-list", cartList);
                    response.sendRedirect("index.jsp");
                } else {
                    cartList = cart_list;

                    boolean exist = false;
                    for (CartItem c : cart_list) {
                        if (c.getItem_id() == id) {
                            exist = true;
                            out.println("<h3 style='color:crimson; text-align: center'>Item Already in Cart. <a href='viewCart.jsp'>GO to Cart Page</a></h3>");
                        }
                    }

                    if (!exist) {
                        cartList.add(cm);
                        response.sendRedirect("index.jsp");
                    }
                }
            }
        }
    }
}
