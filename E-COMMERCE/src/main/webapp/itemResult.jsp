<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="com.mycompany.ecommerce.dao.AdminDAO" %>
<%@ page import="com.mycompany.ecommerce.model.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Item Result</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    .main-content {
      margin-left: 250px; /* Adjust this value according to the sidebar width */
      padding: 20px;
    }
  </style>
</head>
<body>
<jsp:include page="sidePanel.jsp"/>

<div class="main-content">
  <div class="container mt-5">
    <h2>${message}</h2>
    <h3>All Items:</h3>
    <div class="row">
      <%
        AdminDAO indexDAO = new AdminDAO();
        List<Item> itemList = indexDAO.getAllProducts();
        if (!itemList.isEmpty()){
          int count = 0;
          for (Item i : itemList){
      %>
      <div class="col-md-4 mb-4">
        <div class="card">
          <img class="card-img-top" src="data:image/jpg;base64,<%=Base64.getEncoder().encodeToString(i.getItem_image())%>" alt="<%=i.getItem_name()%>">
          <div class="card-body">
            <h5 class="card-title"><%=i.getItem_name()%></h5>
            <p class="card-text"><%=i.getItem_category()%></p>
            <p class="card-text">Quantity: <%=i.getItem_quantity()%></p>
            <p class="card-text">Price: <%=i.getPrice()%></p>

            <div class="mt-3 d-flex justify-content-between">
            <form action="RemoveItemServlet" method="post">
              <input type="hidden" name="itemId" value="<%=i.getItem_id()%>">
              <button type="submit" class="btn btn-danger">Remove</button>
            </form>
              <a class="btn btn-dark" href="update-item.jsp?id=<%=i.getItem_id()%>">Update Item</a>
            </div>
          </div>
        </div>
      </div>
      <%
        count++;
        if (count % 3 == 0) {
      %>
    </div><div class="row">
    <%
        }
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
    <a href="itemAdding.jsp" class="btn btn-primary mt-3">Add Another Item</a>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
