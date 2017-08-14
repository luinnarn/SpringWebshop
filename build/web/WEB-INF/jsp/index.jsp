<%-- 
    Document   : index
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
        <title>WebShop</title>
    </head>
    <body>
        <div class="container">
        <nav>
            <ul>
                <li><a class="active" href="/WebShop/index"><strong>HOME</strong></a></li>
                <li><a href="/WebShop/products">Products</a></li>
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
        <div class="row" style="margin-top: 5%">
            <div class="col-lg-6">
            <img src ="/WebShop/img/shopping-cart.png" alt="WebShop"/>
            </div>
        
            <div class="col-lg-6">
            <h2>Welcome to the online shop <strong>WebShop! </strong><br/>The best place for all your shopping needs!</h2>
            <h3>To see the list of all available products, go <a href="/WebShop/products">here</a>.</h3>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dignissim neque pellentesque, ultrices nisl lacinia, bibendum lacus. Duis pellentesque augue consectetur augue convallis condimentum. Curabitur quis ipsum quis nisl eleifend accumsan. Sed ac velit quis quam sagittis porttitor. Phasellus iaculis quis lectus at pretium. Vestibulum ac imperdiet metus. Sed at vestibulum turpis. Integer vel metus vitae turpis iaculis fermentum ac sit amet mauris. Nullam sodales, odio et vehicula imperdiet, justo velit placerat magna, eget congue nisl ipsum vel libero. Maecenas eget dolor mauris. Proin sagittis nibh non velit finibus cursus. Nullam ultrices elit in condimentum auctor. Quisque blandit nisi nec sollicitudin malesuada.
            </p>
            </div>
        </div>
        </div>
    </body>
</html>
