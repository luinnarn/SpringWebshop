<%-- 
    Document   : sales
    Author     : Nikola Dragić
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/WebShop/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/WebShop/css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of all sales</title>
    </head>
    <body>
        <div class="container">
        <nav>
            <ul>
                <li><a href="/WebShop/index"><strong>HOME</strong></a></li>
                <li><a href="/WebShop/products">Products</a></li>
                <li><a href="/WebShop/customers">Customers</a></li>
                <li><a class="active" href="/WebShop/sales">Sales</a></li>
                
                <li style="float:right"><a href="/WebShop/logout" >Logout</a>
                <li style="float:right"><a href="/WebShop/login" >Login</a>
                <li class="navbar-logged-text">
                     <c:if test="${sessionScope.username!= null}">
                        Logged in as: ${sessionScope.username}
                         </c:if>
                    <c:if test="${sessionScope.username== null}">
                        Logged in as: Guest
                    </c:if>
                </li>
            </ul>
        </nav>
        <h1>List of all sales</h1>
        <table class="table table-hover">
            <tr>
                <th>Buyer username</th>
                <th>Product</th>
                <th>Date of purchase</th>
            </tr>
            <c:forEach items="${salesData}" var="salesData">
                <tr>
                    <td>${salesData.customer}</td>
                    <td>${salesData.product}</td>
                    <td>${salesData.date}</td>
                </tr>
            </c:forEach>
        </table>
        </div>
    </body>
</html>
