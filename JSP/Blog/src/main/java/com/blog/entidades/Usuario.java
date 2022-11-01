package com.blog.entidades;

public class Usuario {
    private int idUsuario;
    private String email;
    private String senha;
    private int moderador = 0;

    public Usuario() {
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Usuario(String email, String senha, int moderador) {
        this.email = email;
        this.senha = senha;
        this.moderador = moderador;
    }

    public Usuario(String email, String senha) {
        this.email = email;
        this.senha = senha;
    }

    public Usuario(int idUsuario, String email, String senha, int moderador) {
        this.idUsuario = idUsuario;
        this.email = email;
        this.senha = senha;
        this.moderador = moderador;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getModerador() {
        return moderador;
    }

    public void setModerador(int moderador) {
        this.moderador = moderador;
    }
}
