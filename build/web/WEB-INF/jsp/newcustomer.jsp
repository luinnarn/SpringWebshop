<%-- 
    Document   : newcustomer
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
        <title>Add new user</title>
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
        <h1>Enter customer data:</h1>
        <form:form action ="/WebShop/addnewcustomer" commandName="customer" method = "post">
            <div style="width:20%">
            <div class="form-group">
                <form:label path="username">Username: </form:label>
                <form:input path="username" type="text" class="form-control" name ="username" id="username" placeholder="Username" />
                <form:errors path="username" cssClass="error"></form:errors>
            </div>
            <div class="form-group">
                <form:label path="password">Password: </form:label>
                <form:input path="password" type="password" class="form-control" name ="password" id="password" placeholder="Pass" />
                <form:errors path="password" cssClass="error"></form:errors>
            </div>
            <div class="form-group">
                <form:label path="firstname">Firstname: </form:label>
                <form:input path="firstname" type="text" class="form-control" name ="firstname" id="firstname" placeholder="Firstname" />
                <form:errors path="firstname" cssClass="error"></form:errors>
            </div>
            <div class="form-group">
                <form:label path="lastname">Lastname: </form:label>
                <form:input path="lastname" type="text" class="form-control" name ="lastname" id="lastname" placeholder="Lastname" />
                <form:errors path="lastname" cssClass="error"></form:errors>
            </div>
            <div class="form-group">
                <form:label path="address">Address: </form:label>
                <form:input path="address" type="text" class="form-control" name ="address" id="adress" placeholder="Address" />
            </div>
            <input type="submit" class="btn btn-default" value="Add customer"/>
            </div>
        </form:form>
        </div>   
    </body>
</html>
