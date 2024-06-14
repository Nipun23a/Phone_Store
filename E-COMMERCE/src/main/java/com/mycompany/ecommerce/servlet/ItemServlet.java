package com.mycompany.ecommerce.servlet;

import com.mycompany.ecommerce.model.Item;
import com.mycompany.ecommerce.service.ItemService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

@WebServlet("/item")
@MultipartConfig
public class ItemServlet extends HttpServlet {

    private ItemService itemService = new ItemService();

    public ItemServlet() {
        this.itemService = new ItemService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemName = request.getParameter("itemName");
        String itemCategory = request.getParameter("categoryId");
        String itemBrand = request.getParameter("brandId");
        int itemQuantity = Integer.parseInt(request.getParameter("itemQuantity"));
        double itemPrice = Double.parseDouble(request.getParameter("itemPrice"));
        String itemDescription = request.getParameter("phoneDescription");
        Part filePart = request.getPart("itemImage");
        byte[] itemImage = null;

        if (filePart != null && filePart.getSize() > 0) {
            InputStream fileContent = filePart.getInputStream();
            itemImage = fileContent.readAllBytes();
        }


        // Add item with permanent file path
        Item newItem = new Item(itemName, itemCategory, itemBrand, itemQuantity, itemPrice, itemDescription, itemImage);
        itemService.addItem(newItem);
        response.sendRedirect("itemAdding.jsp");
    }
}
