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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Toastify-js dependences -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
     <!-- CSS import -->
    <link rel="stylesheet" href="assets/stylePostagem/style.css">
     <!-- Js import -->
    <script src="assets/index.js"></script>

    <title>Blog</title>
</head>
<body>
    <div class="container">
        <div class="menu">
            <div class="login">
                <a href="LoginCadastro.jsp"><button>Login</button></a>
            </div>
        </div>

        <div class="grid-postagem">
            <%
                String idPostagem = request.getParameter("id");
                Postagem postagem = DaoPostagem.consultarPorId(Integer.parseInt(idPostagem));

                out.write("<h1>"+postagem.getTitulo()+"</h1>");
                out.write("<div class='containerP'><p>"+postagem.getTexto()+"</p></div>");
            %>
            <hr class="hr">
            <form <%out.write("action='EditarPostURL.jsp?id="+idPostagem+"'<idPostagem");%> method="POST" id="enviarComentario">
                <input type="text" name="comentario" id = "comentario">
                <button type="button" id="enviarButton" onclick="verificaUsuario()">Editar Postagem</button>
            </form>
            </div>
    </div>

    <!-- Toastify-js notifications -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</body>
</html>