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
            <form <%out.write("action='Postagem.jsp?id="+idPostagem+"'<idPostagem");%> method="POST" id="enviarComentario">
                <input type="text" name="comentario" id = "comentario">
                <button type="button" id="enviarButton" onclick="verificaUsuario()">Enviar</button>
            </form>
            <% out.write("<a href='DeletarPostURL.jsp?id="+idPostagem+"'");%><button id="deletar" >Deletar</button><% out.write("</a>");%>
            <% out.write("<a href='EditarPost.jsp?id="+idPostagem+"'");%><button id="editar" >Editar</button><% out.write("</a>");%>
        </div>
        <div class="grid-comentarios">
            <%
                String idPostagem2 = request.getParameter("id");
                List<Comentario> lista = DaoComentario.consultarComentarios(Integer.parseInt(idPostagem2));
                for(Comentario comentario : lista){
                String ultimoComentario = comentario.getComentario();
                out.write("<p class='comentarios'>"+comentario.getComentario()+"</p>");
                }
            %>
        </div>
    </div>


    <%
        String text = request.getParameter("comentario");
        if(text != null){
        Comentario comentario = new Comentario();
        comentario.setComentario(text);
        comentario.setVerificado(0);

        DaoComentario.salvar(comentario, Integer.parseInt(request.getParameter("id")));
        }
    %>

    <script>
        if(sessionStorage.getItem("email") != null || sessionStorage.getItem("senha") != null){
            
        } else {
            document.getElementById("comentario").value = "Para comentar é necessário efetuar o login, clique aqu";
            document.getElementById("comentario").readOnly = true;
        }   
    </script>
    <script>
        console.log(sessionStorage.getItem("Moderador"))
            if(sessionStorage.getItem("Moderador") == 1) {  
                document.getElementById("deletar").style.visibility = "visible";
                document.getElementById("editar").style.visibility = "visible";
            } else {
                document.getElementById("deletar").style.visibility = "hidden";
                document.getElementById("editar").style.visibility = "hidden";
            }
    </script>


    <!-- Toastify-js notifications -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</body>
</html>