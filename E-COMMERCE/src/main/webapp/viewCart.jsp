<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.ecommerce.model.CartItem" %>
<%@ page import="com.mycompany.ecommerce.model.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.mycompany.ecommerce.dao.ProductDAO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  DecimalFormat dcf = new DecimalFormat("#.##");
  request.setAttribute("dcf", dcf);
  ArrayList<CartItem> cart_list = (ArrayList<CartItem>) session.getAttribute("cart-list");
  List<CartItem> cartProduct = null;
  if (cart_list != null) {
    ProductDAO pDao = new ProductDAO();
    cartProduct = pDao.getCartProducts(cart_list);
    double total = pDao.getTotalCartPrice(cart_list);
    request.setAttribute("total", total);
    request.setAttribute("cart_list", cart_list);
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Cart</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
    .table tbody td {
      vertical-align: middle;
    }

  </style>
</head>
<body>
<jsp:include page="navigationBar.jsp"/>
<div class="container my-3">
  <div class="d-flex py-3"><h3>Total Price: Rs ${(total>0)?dcf.format(total):0} </h3>
    <form action="cart-check-out" method="post">
      <button type="submit" class="mx-3 btn btn-primary">Check Out</button>
    </form>
  </div>
  <table class="table table-light">
    <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Price</th>
      <th scope="col">Cancel</th>
    </tr>
    </thead>
    <tbody>
    <%
      if (cart_list != null) {
        for (CartItem c : cartProduct) {
    %>
    <tr>
      <td><%=c.getItem_name()%></td>
      <td><%= dcf.format(c.getPrice())%></td>
      <td>
        <form action="remove-from-cart" method="post">
          <input type="hidden" name="id" value="<%= c.getItem_id()%>">
          <button type="submit" class="btn btn-sm btn-danger">Remove</button>
        </form>
      </td>
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