<%-- 
    Document   : products
    Author     : Nikola Dragić
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/WebShop/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/WebShop/css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
    </head>
    <body>
        <div class="container">
        <nav>
            <ul>
                <li><a href="/WebShop/index"><strong>HOME</strong></a></li>
                <li><a class="active" href="/WebShop/products/">Products</a></li>
                <li><a href="/WebShop/customers">Customers</a></li>
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
        <h1>Products page</h1>
        <div style="width: 100%">
        <a class="btn btn-primary" href ="/WebShop/newproduct">Add product</a>
        </div>
        <c:forEach items="${products}" var="product">
            <div class="col-sm-6" style="width: 340px; margin: 5%; padding: 10px; border : 1px solid lightgray; border-radius: 10px">   
                <div>
                    <c:choose>
                    <c:when test="${product.image==''}">
                        <img class="img-rounded product-image" src="/WebShop/img/shopping-cart.png"  alt="Product">     
                    </c:when>
                    <c:otherwise>
                    <img class="img-rounded product-image" src="/WebShop/${product.image}" alt="Product image"> 
                    </c:otherwise>
                    </c:choose>
                </div>
                <div> 
                    <div>
                        <h3>${product.name}</h3>
                    </div>
                    <div>
                        ${product.description}
                    </div>
                    <div>
                        <h3>Price: ${product.price} &euro;</h3>
                    </div>
                    <div>
                        <a class="btn btn-default" href="/WebShop/product/${product.id}"><c:out value="details"/></a>
                    </div>
                </div>
            </div>  
        </c:forEach>
        </div>
    </body>
</html>
