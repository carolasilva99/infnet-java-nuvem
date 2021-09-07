<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>TP3</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-inverse">
    <c:if test="${not empty mensagem}">
        <div class="alert alert-danger">
            <strong>Problema!</strong> ${mensagem}
        </div>
    </c:if>
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">TP3</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/usuario"><span class="glyphicon glyphicon-user"></span> Cadastrar</a></li>
            <li><a href="/consulta"><span class="glyphicon glyphicon-search"></span> Consultar</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <h3>Java Nuvem</h3>
    <h4>TP3</h4>

    <p> <a href="https://github.com/carolasilva99/infnet-java-web">GITHUB</a> </p>
</div>

</body>
</html>