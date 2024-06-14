<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
<div class="sidebar">
    <a href="admin-dashboard.jsp">
        <h4 class="text-white text-center">Mobile Store</h4>
    </a>
    <a href="itemAdding.jsp">Add Item</a>
    <a href="itemResult.jsp">View All Item</a>
    <a href="viewInvoice.jsp">View Invoice</a>
    <a href="add-admin.jsp">Register New Admin</a>
    <a href="logout">Log Out</a>
</div>
</body>
</html>
