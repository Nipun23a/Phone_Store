<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Phone Aqua</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <style>
        .main-content {
            margin-left: 250px; /* Adjust this value based on the width of your sidebar */
        }


        a:hover {
            color: #000;
        }
        #main-title{
            font-family: "Montserrat", sans-serif;
            font-size: 35px;
            text-decoration: none;
            color: black;
            margin-left: 25px;
            font-weight: 900;
        }
        a{
            font-family: "Montserrat", sans-serif;
            font-size: 20px;
            text-decoration: none;
            color: black;
            margin-left: 30px;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
   <div class="container-fluid">
        <div class="d-flex w-100">
            <a class="navbar-brand me-auto" href="index.jsp" id="main-title">Phone Store</a>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active"  href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="viewCart.jsp">Cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
