<%-- 
    Document   : customers
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
        <title>Customer list</title>
    </head>
    <body>
        <div class="container">
        <nav>
            <ul>
                <li><a href="/WebShop/index"><strong>HOME</strong></a></li>
                <li><a href="/WebShop/products">Products</a></li>
                <li><a class="active" href="/WebShop/customers">Customers</a></li>
                <li><a href="/WebShop/sales">Sales</a></li>
                
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
        <h1>List of all registered users</h1>
        <div style="width: 100%; padding-bottom: 10px;">
        <a class="btn btn-primary" href="newcustomer" method="get">Add user</a>
        </div>
        <table class="table table-hover">
            <tr>
                <th>Username</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Address</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach items="${customers}" var="customer">
                <tr>
                    <td>${customer.username}</td>
                    <td>${customer.firstname}</td>
                    <td>${customer.lastname}</td>
                    <td>${customer.address}</td>
                    <td><a href="/WebShop/editcustomer/${customer.id}">Edit customer</a></td>
                    <td><a href="/WebShop/removecustomer/${customer.id}">  Delete customer</a></td>
                </tr>
            </c:forEach>
        </table>
        </div>
    </body>
</html>
