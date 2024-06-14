


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:c="http://java.sun.com/jsf/facelets">
<head>
    <meta charset="UTF-8">
    <title>Add Item</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <jsp:include page="sidePanel.jsp" />
        </div>
    </div>
</div>
<div class="col-md-9 main-content">
    <h2 class="mb-4">Add a New Item</h2>
    <form action="item" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="itemName">Item Name</label>
            <input type="text" class="form-control" id="itemName" name="itemName" required>
        </div>
        <div class="form-group">
            <label for="categoryId">Category</label>
            <select class="form-control" id="categoryId" name="categoryId" required>
                <option value="">Select a category</option>
                <option value="Mobile Phones">Mobile Phones</option>
                <option value="Accessories">Accessories</option>
            </select>
        </div>

        <div class="form-group">
            <label for="brandId">Brand</label>
            <select class="form-control" id="brandId" name="brandId" required>
                <option value="">Select a brand</option>
                <option value="Apple">Apple</option>
                <option value="Samsung">Samsung</option>
                <option value="OnePlus">OnePlus</option>
                <option value="Xiaomi">Xiaomi</option>
                <option value="Unknown">Unknown</option>
            </select>
        </div>
        <div class="form-group">
            <label for="itemQuantity">Quantity</label>
            <input type="number" class="form-control" id="itemQuantity" name="itemQuantity" required>
        </div>
        <div class="form-group">
            <label for="itemPrice">Price</label>
            <input type="number" step="0.01" class="form-control" id="itemPrice" name="itemPrice" required>
        </div>
        <div class="form-group">
            <label for="phoneDescription">Phone Description</label>
            <textarea class="form-control" id="phoneDescription" name="phoneDescription" rows="4" placeholder="Enter phone description" required></textarea>
        </div>
        <div class="form-group">
            <label for="itemImage">Upload Image</label>
            <input type="file" class="form-control-file" id="itemImage" name="itemImage" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Item</button>
    </form>
</div>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
