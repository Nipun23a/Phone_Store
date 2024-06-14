<%@ page import="com.mycompany.ecommerce.dao.IndexDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.ecommerce.model.Item" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%

        String itemId = request.getParameter("id");
        int itemIdInt = Integer.parseInt(itemId);
        IndexDAO indexDAO = new IndexDAO();
        Item item = indexDAO.getItemInfo(itemIdInt);
%>

<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Update Item</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <jsp:include page="sidePanel.jsp"/>
        </div>
    </div>
</div>
<div class="col-md-9 main-content">
    <h2 class="mb-4">Update Item</h2>
    <form action="UpdateTheServlet" method="post" >
        <div class="form-group">
            <label for="itemName">Item Name</label>
            <input type="text" class="form-control" id="itemName" name="itemName" value="<%=item.getItem_name()%>"
                   readonly>
        </div>
        <div class="form-group">
            <label for="categoryId">Category</label>
            <input type="text" class="form-control" id="categoryId" name="categoryId"
                   value="<%=item.getItem_category()%>" readonly>
        </div>
        <div class="form-group">
            <label for="brandId">Brand</label>
            <input type="text" class="form-control" id="brandId" name="brandId" value="<%=item.getItem_brand()%>"
                   readonly>
        </div>
        <div class="form-group">
            <label for="itemId">Item ID</label>
            <input type="text" class="form-control" id="itemId" name="itemId" value="<%=itemId%>">
        </div>
        <div class="form-group">
            <label for="itemQuantity">Quantity</label>
            <input type="number" class="form-control" id="itemQuantity" name="itemQuantity"
                   value="<%=item.getItem_quantity()%>" min="1" required>
        </div>
        <div class="form-group">
            <label for="itemPrice">Price</label>
            <input type="number" step="0.01" class="form-control" id="itemPrice" name="itemPrice"
                   value="<%=item.getPrice()%>" min="0.01" required>
        </div>
        <div class="form-group">
            <label for="phoneDescription">Phone Description</label>
            <textarea class="form-control" id="phoneDescription" name="phoneDescription" rows="4"
                      placeholder="Enter phone description" required><%=item.getItem_description()%></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Update Item</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


