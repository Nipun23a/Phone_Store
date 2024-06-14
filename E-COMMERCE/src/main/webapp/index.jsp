<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.mycompany.ecommerce.dao.IndexDAO" %>
<%@ page import="com.mycompany.ecommerce.model.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.ecommerce.model.CartItem" %>
<%@ page import="com.mycompany.ecommerce.servlet.CartServlet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%
    IndexDAO indexDAO = new IndexDAO();
    List<Item> phones = indexDAO.getMobilePhones();
    request.setAttribute("phones", phones);
    List<Item> accessories = indexDAO.getAccessories();
    request.setAttribute("accessories",accessories);

    ArrayList<CartItem> cart_list = (ArrayList<CartItem>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <style>
        body{
            font-family: "Poppins", sans-serif;
            font-style: normal;
            font-weight: 200;
        }
        .item-container {
            width: 100%;
            padding: 15px;
            border: 1px solid #ccc;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .item-container img {
            max-width: 300px;
            height: 300px;
        }
        .item-container p {
            margin: 10px 0;
        }
        .btn-container {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        .see-more {
            text-align: center;
            margin-top: 20px;
        }
        h2{
                font-family: "Montserrat", sans-serif;
                font-size: 35px;
                text-decoration: none;
                color: black;
                margin-left: 25px;
                font-weight: 900;
        }
        .card-title{
            font-family: "Poppins", sans-serif;
            text-align: center;
            font-weight: bold;
        }
        .price{
            text-align: center;
            font-weight: bold;
            color: red;
        }
        .container{
            margin-top: 25px;
        }
    </style>
</head>
<body>

<jsp:include page="navigationBar.jsp" />

<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="images/1.jpg" alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="images/2.jpg" alt="Second slide">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="container">
        <div class="mobile-container">
            <h2 class="mobileTitle">Mobile Phones</h2>
            <div class="container">
                <div class="row">
                    <%
                        if (!phones.isEmpty()) {
                            int count = 0;
                            for (Item i : phones) {
                                if (count > 0 && count % 3 == 0) {
                    %>
                </div>
                <div class="row">
                    <%
                        }
                    %>
                    <div class="col-md-4">
                        <div class="card w-100">
                            <img class="card-img-top" src="data:image/jpg;base64,<%=Base64.getEncoder().encodeToString(i.getItem_image())%>" alt="<%=i.getItem_name()%> " width="100px" height="300px">
                            <div class="card-body">
                                <h5 class="card-title"><%=i.getItem_name() %></h5>
                                <h6 class="price">Price: Rs<%=i.getPrice() %></h6>
                                <div class="mt-3 d-flex justify-content-between">
                                    <a class="btn btn-dark" href="add-to-cart?id=<%=i.getItem_id()%>">Add to Cart</a>
                                    <a class="btn btn-primary" href="itemInformation.jsp?id=<%=i.getItem_id()%>">View</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                            count++;
                        }
                    } else {
                    %>
                    <div class="col-12">
                        <p class="text-center">No products found</p>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        <div class="see-more">
            <a class="btn btn-info" href="#">See More</a>
        </div>
    </div>


    <div class="mobile-container">
        <h2 class="mobileTitle">Accessories</h2>
        <div class="container">
            <div class="row">
                <%
                    if (!accessories.isEmpty()) {
                        int count = 0;
                        for (Item i : accessories) {
                            if (count > 0 && count % 3 == 0) {
                %>
            </div>
            <div class="row">
                <%
                    }
                %>
                <div class="col-md-4">
                    <div class="card w-100">
                        <img class="card-img-top" src="data:image/jpg;base64,<%=Base64.getEncoder().encodeToString(i.getItem_image())%>" alt="<%=i.getItem_name()%>">
                        <div class="card-body">
                            <h5 class="card-title"><%=i.getItem_name() %></h5>
                            <h6 class="price">Price: Rs<%=i.getPrice() %></h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a class="btn btn-dark" href="add-to-cart?id=<%=i.getItem_id()%>">Add to Cart</a>
                                <a class="btn btn-primary" href="itemInformation.jsp?id=<%=i.getItem_id()%>">View</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        count++;
                    }
                } else {
                %>
                <div class="col-12">
                    <p class="text-center">No products found</p>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <div class="see-more">
            <a class="btn btn-info" href="#">See More</a>
        </div>
    </div>
</div>
</body>
</html>
