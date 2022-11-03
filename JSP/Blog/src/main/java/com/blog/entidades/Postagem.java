package com.blog.entidades;

public class Postagem {
    private int idPostagem;
    private String titulo;
    private String texto;
    private int idUsuario;

    public Postagem() {
    }
    
    public Postagem(String texto, int idUsuario) {
        this.texto = texto;
        this.idUsuario = idUsuario;
    }

    public int getIdPostagem() {
        return idPostagem;
    }

    public void setIdPostagem(int idPostagem) {
        this.idPostagem = idPostagem;
    }

    public String getTexto() {
        return texto;
    }

    public Postagem(String titulo, String texto, int idUsuario) {
        this.titulo = titulo;
        this.texto = texto;
        this.idUsuario = idUsuario;
    }

    public Postagem(int idPostagem, String titulo, String texto, int idUsuario) {
        this.idPostagem = idPostagem;
        this.titulo = titulo;
        this.texto = texto;
        this.idUsuario = idUsuario;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
}
