<%-- 
    Document   : product
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
        <title>${product.name}</title>
    </head>
    <body>
        <div class="container">
        <nav>
            <ul>
                <li><a href="/WebShop/index"><strong>HOME</strong></a></li>
                <li><a class="active" href="/WebShop/products">Products</a></li>
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
        <h1><c:out value="${product.name}"></c:out><br/><c:out value="price: ${product.price}"/></h1><br/>
        <div class="col-lg-6">
        <c:choose>    
        <c:when test="${product.image==''}">
            <img class="img-rounded product-image-display" src="/WebShop/img/shopping-cart.png"  alt="Product">
        </c:when>
        <c:otherwise>
            <img class="img-rounded product-image-display" src="/WebShop/${product.image}"  alt="Product image"/>
        </c:otherwise>
        </c:choose>
        </div>
        <div class="col-lg-4">
            <c:out value="${product.description}"/><br/><br/>
            <strong>In stock: </strong>${product.quantity}<br/><br/>
            <a class="btn btn-default" href="/WebShop/removeproduct/${product.id}">remove this product</a>
            <a class="btn btn-default" href="/WebShop/editproduct/${product.id}">edit this product</a>
            <c:if test="${(product.quantity <= 0) or (sessionScope.username == 'guest')}">
                 <a class="btn btn-default disabled" href="/WebShop/buyproduct/${product.id}">buy now</a>
            </c:if>
            <c:if test="${(product.quantity > 0) and (sessionScope.username != 'guest')}">
                 <a class="btn btn-default" href="/WebShop/buyproduct/${product.id}">buy now</a>
            </c:if>
            
        </div>
        </div>
    </body>
</html>
