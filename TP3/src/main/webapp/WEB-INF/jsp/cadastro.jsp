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
            <h2>Cadastramento de Usuários</h2>
            <form action="/usuario" method="post" enctype = "multipart/form-data">
                <div class="form-group">
                    <label for="imagem">Imagem:</label>
                    <input type="file" id="imagem" name="imagem" class="form-control">
                </div>
                <div class="form-group">
                    <label for="nome">Nome:</label>
                    <input type="text" id="nome" name="nome" class="form-control" placeholder="Entre com o seu nome">
                </div>
                <div class="form-group">
                    <label for="email">E-mail:</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Entre com o seu e-mail">
                </div>
                <div class="form-group">
                    <label for="senha">Senha:</label>
                    <input type="password" id="senha" name="senha" class="form-control" placeholder="Entre com a sua senha">
                </div>
                <div class="form-group">
                    <label for="telefone">Telefone:</label>
                    <input type="text" id="telefone" name="telefone" class="form-control" placeholder="Entre com o seu telefone">
                </div>
                <div class="form-group">
                    <label for="cep">CEP (a partir dele buscaremos as informações relevantes):</label>
                    <input type="text" id="cep" name="endereco.cep" class="form-control" placeholder="Entre com o seu cep"
                        onblur=""
                    >
                </div>
                <div class="form-group">
                    <label for="numero">Número</label>
                    <input type="text" id="numero" name="endereco.numero" class="form-control">
                </div>
                <div class="form-group">
                    <label for="complemento">Complemento:</label>
                    <input type="text" id="complemento" name="endereco.complemento" class="form-control">
                </div>
                <button type="submit" class="btn btn-default">Cadastrar</button>
            </form>
        </div>
    </body>
</html>