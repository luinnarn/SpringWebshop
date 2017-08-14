<%-- 
    Document   : newproduct
    Author     : Nikola Dragić
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/WebShop/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/WebShop/css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new product</title>
    </head>
    <body>
        <div class="container">
        <nav>
            <ul>
                <li><a href="/WebShop/index"><strong>HOME</strong></a></li>
                <li><a class="active" href="/WebShop/products">Products</a></li>
                <li><a  href="/WebShop/customers">Customers</a></li>
                <li><a href="/WebShop/sales">Sales</a></li>
                
                <li style="float:right"><a href="/WebShop/logout">Logout</a>
                <li style="float:right"><a href="/WebShop/login">Login</a>
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
        <h1>New product details: </h1>
        <form:form class="form-horizontal" action="/WebShop/addnewproduct" commandName="product" method="post">
            <div class="form-group">
                <form:label path="name" class="col-sm-2 control-label">Product name:</form:label>
                <div class="col-sm-10">
                    <form:input path="name" class="form-control" style="width: 20%" type ="text" name ="name" placeholder="Product name" id="name"/>
                    <form:errors path="name" cssClass="error"></form:errors>
                </div>
            </div>
            <div class="form-group">
                <form:label path="price" class="col-sm-2 control-label">Product price:</form:label>
                <div class="col-sm-10">
                     <form:input path="price" class="form-control" style="width: 20%" type ="text" name ="price" placeholder="Product price" id="price"/>
                     <form:errors path="price" cssClass="error"></form:errors>
                </div>
            </div>
                <div class="form-group">
                <form:label path="description" class="col-sm-2 control-label">Product description:</form:label>
                <div class="col-sm-10">
                     <form:input path="description" class="form-control" style="width: 20%" type ="text" name ="description" placeholder="Product description" id="description"/>
                     <form:errors path="description" cssClass="error"></form:errors>
                </div>
            </div> 
            <div class="form-group">
                <form:label path="image" class="col-sm-2 control-label">Product image:</form:label>
                <div class="col-sm-10">
                     <form:input path="image" class="form-control" style="width: 20%" type ="text" name ="image" placeholder="Product image" id="image"/>
                </div>
            </div>    
            <div class="form-group">
                <form:label path="quantity" class="col-sm-2 control-label">Product quantity:</form:label>
                <div class="col-sm-10">
                     <form:input path="quantity" class="form-control" style="width: 20%" type ="text" name ="quantity" placeholder="Available quantity" id="quantity"/>
                     <form:errors path="quantity" cssClass="error"></form:errors>
                </div>
            </div>  
            
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-default" value="Add product"/> 
                </div>
            </div>
        </form:form>
        </div>
    </body>
</html>
