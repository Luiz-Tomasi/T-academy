package com.blog.entidades;

public class Postagem {
    private int idPostagem;
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
