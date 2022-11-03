package com.blog.entidades;

public class Comentario {
    private int idComentario;
    private String comentario;
    private int verificado = 0;
    private int idUsuario;
    private int idPostagem;

    public Comentario() {
    }

    public Comentario(int idComentario, String comentario, int verificado, int idUsuario, int idPostagem) {
        this.idComentario = idComentario;
        this.comentario = comentario;
        this.verificado = verificado;
        this.idUsuario = idUsuario;
        this.idPostagem = idPostagem;
    }

    public int getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(int idComentario) {
        this.idComentario = idComentario;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getVerificado() {
        return verificado;
    }

    public void setVerificado(int verificado) {
        this.verificado = verificado;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdPostagem() {
        return idPostagem;
    }

    public void setIdPostagem(int idPostagem) {
        this.idPostagem = idPostagem;
    }
}
