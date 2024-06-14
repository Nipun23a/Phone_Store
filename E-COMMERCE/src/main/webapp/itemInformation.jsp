<%@ page import="com.mycompany.ecommerce.dao.IndexDAO" %>
<%@ page import="com.mycompany.ecommerce.model.Item" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String itemId = request.getParameter("id");
    int itemIdInt = Integer.parseInt(itemId);
    IndexDAO indexDAO = new IndexDAO();
    Item item = indexDAO.getItemInfo(itemIdInt);
%>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Item Information</title>
    <style>
        .main-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px;
        }
        .item-information {
            display: flex;
            margin: 20px;
            background-color: #f0f0f0;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .item-container-image {
            margin-right: 20px;
        }
        .item-container-image img {
            border-radius: 10px;
        }
        .item-container-information {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .item-specification {
            margin-top: 20px;
            padding: 20px;
            background-color: #f0f0f0;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            text-align: center;
        }
    </style>
</head>
<body>
<jsp:include page="navigationBar.jsp"/>
<div class="main-content">
    <div class="item-information">
        <div class="item-container-image">
            <img src="data:image/jpg;base64,<%=Base64.getEncoder().encodeToString(item.getItem_image())%>" alt="<%=item.getItem_name()%>" width="300px" height="400px">
        </div>
        <div class="item-container-information">
            <p>Item Name:<%=item.getItem_name()%></p>
            <p>Item Brand:<%=item.getItem_brand()%></p>
            <p>Item Category:<%=item.getItem_name()%></p>
            <a class="btn-primary" href="add-to-cart?id=<%=item.getItem_id()%>">Add to Cart</a>
        </div>
    </div>
    <div class="item-specification">
        <h1>Item Specification</h1>
        <p><%=item.getItem_description()%></p>
    </div>
</div>
</body>
</html>
