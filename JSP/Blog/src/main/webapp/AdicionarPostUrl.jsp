<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.blog.entidades.Usuario" %>
<%@ page import="com.blog.dao.DaoUsuario" %>
<%@ page import="com.blog.entidades.Postagem" %>
<%@ page import="com.blog.dao.DaoPostagem" %>
<%@ page import="com.blog.dao.DaoComentario" %>
<%@ page import="com.blog.entidades.Comentario" %>
<%@ page import="java.util.List" %>
<%
    String titulo = request.getParameter("titulo");
    String texto = request.getParameter("texto");

    Postagem post = new Postagem();

    post.setTitulo(titulo);
    out.write("<script>console.log('"+titulo+"');</script>");
    post.setTexto(texto);
    out.write("<script>console.log('"+texto+"');</script>");
    DaoPostagem.salvar(post);
%>