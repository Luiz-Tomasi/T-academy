<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.blog.entidades.Usuario" %>
<%@ page import="com.blog.dao.DaoUsuario" %>
<%@ page import="com.blog.entidades.Postagem" %>
<%@ page import="com.blog.dao.DaoPostagem" %>
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
    <link rel="stylesheet" href="assets/style.css">
     <!-- Js import -->
    <script src="assets/index.js"></script>

    <title>Blog</title>
</head>
<body>
    <div class="container">
        <div class="menu">
            <a href="AceitarComentario.jsp"><button style="visibility: hidden;" id="verificarComentarios">Verificar Comentarios</button></a>
        </div>

        <div class="grid-addPostagem" style="grid-column-start: 2;
                                                 grid-column-end: 4;
                                                 grid-row-start: 3;
                                                 grid-row-end: 4;
                                                 height: 50px;
                                                 width: 150px;
                                                 background-color: red;
                                                 display: flex;
                                                 justify-content: center;
                                                 justify-item:center;">
            <% out.write("<a href='AdicionarPost.jsp'> <button id='adicionar'>Adicionar</button> </a>");%>
        </div>
        <div class="listaPostagens">
                <tbody>
                    <%
                        List<Postagem> lista = DaoPostagem.consultarUltimasPostagens();
                        for(Postagem postagem : lista){
                                String textoLimitado = postagem.getTexto();
                                if(textoLimitado.length() > 15) {
                                textoLimitado = textoLimitado.substring(0,15);
                                }
                                out.write("<div class='card'>");
                                out.write("<tr>");
                                out.write("<td>"+"<h1>"+postagem.getTitulo()+"</h1>"+"</td>");
                                out.write("<td><p>"+textoLimitado+"</p></td>");
                                out.write("<td><a class='me-2' href='Postagem.jsp?id="+postagem.getIdPostagem()+"'>Abrir</a></td>");
                                out.write("</tr>");
                                out.write("</div>");
                        }
                    %>
                </tbody>
        </div>
    </div>

<script>
    console.log(sessionStorage.getItem("Moderador"))
    if(sessionStorage.getItem("Moderador") == 0 || sessionStorage.getItem("Moderador") == Null){
        document.getElementById("verificarComentarios").style.visibility = "hidden";
    } else {
        document.getElementById("verificarComentarios").style.visibility = "visible";
    }
</script>

    <!-- Toastify-js notifications -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <!-- Bootstrap dependences -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>