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
            <h2>Consulta de Usuários</h2>
            <form action="/usuario/consulta" method="get">
                <div class="form-group">
                    <label for="email">E-mail:</label>
                    <input type="email" id="email" name="email" class="form-control">
                </div>
                <button type="submit" class="btn btn-default">Buscar</button>
            </form>

            <c:if test="${not empty imagem}">
                <img id="profileImage" src="data:image/png;base64, ${imagem}" alt="Imagem do usuário" width="100" height="200">
            </c:if>

            <c:if test="${not empty usuario}">
                <div class="container">
                    <form action="/usuario/alterar" method="post" enctype = "multipart/form-data">
                        <div class="form-group">
                            <label for="imagem">Imagem:</label>
                            <input type="file" id="imagem" name="imagem" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="id">Id:</label>
                            <input type="text" id="id" name="usuario.id" class="form-control"  value="${usuario.id}" disabled>
                        </div>
                        <div class="form-group">
                            <label for="nome">Nome:</label>
                            <input type="text" id="nome" name="nome" class="form-control" placeholder="Entre com o seu nome" value="${usuario.nome}">
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail:</label>
                            <input type="email" id="email" name="email" class="form-control" placeholder="Entre com o seu e-mail" value="${usuario.email}">
                        </div>
                        <div class="form-group">
                            <label for="telefone">Telefone:</label>
                            <input type="text" id="telefone" name="telefone" class="form-control" placeholder="Entre com o seu telefone" value="${usuario.telefone}">
                        </div>
                        <div class="form-group">
                            <label for="enderecoId">Endereço ID:</label>
                            <input type="text" id="enderecoId" name="endereco.id" class="form-control"
                                   value="${usuario.endereco.id}"
                            >
                        </div>
                        <div class="form-group">
                            <label for="cep">CEP (a partir dele buscaremos as informações relevantes):</label>
                            <input type="text" id="cep" name="endereco.cep" class="form-control"
                                   value="${usuario.endereco.cep}"
                            >
                        </div>
                        <div class="form-group">
                            <label for="logradouro">Logradouro:</label>
                            <input type="text" id="logradouro" name="endereco.logradouro" class="form-control"
                                   value="${usuario.endereco.logradouro}" disabled
                            >
                        </div>
                        <div class="form-group">
                            <label for="numero">Número</label>
                            <input type="text" id="numero" name="endereco.numero" class="form-control" value="${usuario.endereco.numero}">
                        </div>
                        <div class="form-group">
                            <label for="complemento">Complemento:</label>
                            <input type="text" id="complemento" name="endereco.complemento" class="form-control" value="${usuario.endereco.complemento}">
                        </div>
                        <div class="form-group">
                            <label for="cidade">Cidade:</label>
                            <input type="text" id="cidade" name="endereco.localidade" class="form-control" value="${usuario.endereco.localidade}" disabled>
                        </div>
                        <div class="form-group">
                            <label for="uf">UF:</label>
                            <input type="text" id="uf" name="endereco.uf" class="form-control" value="${usuario.endereco.uf}" disabled>
                        </div>

                        <button type="submit" class="btn btn-default">Alterar</button>
                    </form>
                </div>

            </c:if>
        </div>
    </body>
</html>