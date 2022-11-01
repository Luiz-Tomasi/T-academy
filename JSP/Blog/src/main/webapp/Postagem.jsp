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
    <link rel="stylesheet" href="assets/stylePostagem/style.css">
     <!-- Js import -->
    <script src="assets/index.js"></script>

    <title>Blog</title>
</head>
<body>
    <div class="container">
        <div class="menu">
        </div>

        <div class="listaPostagens">
            <table class="table">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Texto</th>
                        <th>IdUsuario</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String idPostagem = request.getParameter("id");
                        Postagem postagem = DaoPostagem.consultarPorId(Integer.parseInt(idPostagem));
                        out.write("<tr>");
                        out.write("<td>"+postagem.getIdPostagem()+"</td>");
                        out.write("<td>"+postagem.getTexto()+"</td>");
                        out.write("<td>"+postagem.getIdUsuario()+"</td>");
                        out.write("</tr>");
                    %>
                </tbody>
            </table>
        </div>
    </div>



    <!-- Toastify-js notifications -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</body>
</html>