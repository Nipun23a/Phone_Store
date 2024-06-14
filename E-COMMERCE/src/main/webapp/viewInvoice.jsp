<%@ page import="com.mycompany.ecommerce.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.ecommerce.dao.OrderDAO" %>
<%@ page import="com.mycompany.ecommerce.service.UserService" %>
<%@ page import="com.mycompany.ecommerce.model.Users" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Invoices</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            padding: 15px 8px 15px 16px;
            text-decoration: none;
            font-size: 18px;
            color: #ffffff;
            display: block;
        }
        .sidebar a:hover {
            color: #f1f1f1;
        }
        .main-content {
            margin-left: 250px; /* Adjust this value according to the sidebar width */
            padding: 20px;
        }
    </style>
</head>
<body>
<%@ include file="sidePanel.jsp" %>
<div class="main-content">
    <h2>Invoices</h2>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Invoice ID</th>
            <th scope="col">Customer Name</th>
            <th scope="col">Item Information</th>
            <th scope="col">Invoice Total</th>
        </tr>
        </thead>
        <tbody>
        <%
            OrderDAO indexDAO = new OrderDAO();
            UserService userService = new UserService();
            List<Order> itemList = indexDAO.getAllOrder();
            if (!itemList.isEmpty()){
                for (Order invoice : itemList){
                    Users user = userService.getUserById(invoice.getUser());
        %>
        <tr>
            <td><%= invoice.getOrderId() %></td>
            <td><%= user.getName()%></td>
            <td><%= invoice.getItemInformation() %></td>
            <td><%= invoice.getOrderAmount() %></td>
        </tr>
            <%
                }
                }


            %>
        </tbody>
    </table>
</div>
</body>
</html>

