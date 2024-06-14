package com.mycompany.ecommerce.servlet;

import com.mycompany.ecommerce.dao.IndexDAO;
import com.mycompany.ecommerce.model.Item;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {

    private final IndexDAO indexDAO = new IndexDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Item> phones = indexDAO.getMobilePhones();
        request.setAttribute("phones", phones);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
