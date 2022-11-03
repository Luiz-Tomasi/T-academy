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
        
        </div>

        <div class="listaPostagens">
                <tbody>
                    <%
                        List<Postagem> lista = DaoPostagem.consultarUltimasPostagens();
                        for(Postagem postagem : lista){
                                String textoLimitado = postagem.getTexto();
                                textoLimitado = textoLimitado.substring(0,15);
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