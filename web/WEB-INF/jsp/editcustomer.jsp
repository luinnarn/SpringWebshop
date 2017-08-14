<%-- 
    Document   : editcustomer
    Author     : Nikola Dragić
--%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/WebShop/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/WebShop/css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change ${customer.username}'s data</title>
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
        <h1>Change ${customer.username}'s data:</h1>
        <form class="form-horizontal" action ="/WebShop/editcustomerapply" method = "post">
            <input type="hidden" name ="id" value="${customer.id}">
            <div class="form-group">
                <label class="col-sm-2 control-label" for="username">Username:</label>
                <div class="col-sm-10">
                    <input class="form-control" style="width: 20%" type="text" name ="username" id="username" value="${customer.username}">
                </div>
            </div>
                
             <div class="form-group">
                <label class="col-sm-2 control-label" for="password">Password:</label>
                <div class="col-sm-10">
                    <input class="form-control" style="width: 20%" type="password" name ="password" id="password" value="${customer.password}">
                </div>
             </div>
                
             <div class="form-group">
                <label class="col-sm-2 control-label" for="firstname">Firstname:</label>
                <div class="col-sm-10">
                    <input class="form-control" style="width: 20%" type="text" name ="firstname" id="firstname" value="${customer.firstname}">
                </div>

             </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="lastname">Lastname:</label>
                <div class="col-sm-10">
                    <input class="form-control" style="width: 20%" type="text" name ="lastname" id="lastname" value="${customer.lastname}">
                </div>
              </div>
                
               <div class="form-group">
                <label class="col-sm-2 control-label" for="address">Address:</label>
                <div class="col-sm-10">
                    <input class="form-control" style="width: 20%" type="text" name ="address" id="adress" value="${customer.address}">
                </div>
               </div>
                <div>
                    <input class="btn btn-default" type="submit" value="Apply changes"/>
                </div>
                
        </form>
        </div>
    </body>
</html>
