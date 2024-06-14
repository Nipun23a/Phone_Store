<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.ecommerce.dao.AdminDAO" %>
<%@ page import="java.io.IOException" %>
<%@ page import="jakarta.servlet.ServletException" %>
<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .main-content {
            margin-left: 250px; /* Adjust this value according to the sidebar width */
            padding: 20px;
        }
        .card {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <%
    AdminDAO adminDAO = new AdminDAO();
    int numberOfProducts = adminDAO.getNumberOfProducts();
    int numberOfCustomers = adminDAO.getNumberOfCustomers();
    int numberOfOrders = adminDAO.getNumberOfOrders();
%>

<jsp:include page="sidePanel.jsp"/>
    <div class="main-content">
        <h2 class="text-center">Admin Dashboard</h2>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <div class="card text-white bg-primary">
                        <div class="card-header">Number of Products</div>
                        <div class="card-body">
                            <h5 class="card-title"><%= numberOfProducts %></h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card text-white bg-success">
                        <div class="card-header">Number of Customers</div>
                        <div class="card-body">
                            <h5 class="card-title"><%= numberOfCustomers %></h5>
                        </div>
                    </div>
                </div>
            </div><div class="row">
                <div class="col-md-6">
                    <div class="card text-white bg-warning">
                        <div class="card-header">Number of Orders</div>
                        <div class="card-body">
                            <h5 class="card-title"><%= numberOfOrders %></h5>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>
</html>