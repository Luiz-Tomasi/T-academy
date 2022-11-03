<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.blog.entidades.Usuario" %>
<%@ page import="com.blog.dao.DaoUsuario" %>
<%@ page import="com.blog.entidades.Postagem" %>
<%@ page import="com.blog.dao.DaoPostagem" %>
<%@ page import="com.blog.dao.DaoComentario" %>
<%@ page import="com.blog.entidades.Comentario" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <!-- Bootstrap Css import -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/styleLoginCadastro/style.css">
    <script src="assets/index.js"></script>

    <title>Login Page</title>
</head>
<body
>


    <div class="container">
        <div class="loginArea">
            <div class="row mt-5">
                <div id="signIn" class="col d-flex justify-content-center">Sign in</div>
            </div>
            <form action="LoginCadastro.jsp">
                <div class="row mt-2 justify-content-md-center">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="E-mail" name="email" id = "e-mail">
                    </div>
                </div>
                <div class="row mt-2 justify-content-md-center">
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Password" name="senha" id = "senha">
                    </div>
                </div>

                <div class="row mt-2 justify-content-md-center"></div>
                    <div class="form-group">
                    <button  class="form-control bg-primary" id="submitLogin" onclick="">Logar</button>
                </div>
            </form>
                <button type="button" class="bg-primary" id="cadastrar">Cadastrar</button>
        </div>
        
    </div>

    <%
        String emailAtual = request.getParameter("email");
        String senhaAtual = request.getParameter("senha");
        Usuario usuarioAtual = DaoUsuario.autenticarLogin(emailAtual, senhaAtual);
        if(emailAtual.equals(usuarioAtual.getEmail()) && senhaAtual.equals(usuarioAtual.getSenha())){
            out.write("<script>sessionStorage.setItem('email', '"+emailAtual+"')</script>");
            out.write("<script>sessionStorage.setItem('senha', '"+senhaAtual+"')</script>");
        }
    %>
    
    <!-- Toastify-js notifications -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <!-- Bootstrap JavaScript dependences -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>