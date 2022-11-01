package com.blog.Entidades;

public class Usuario {
    private int id;
    private String email;
    private String senha;
    private int moderador = 0;

    public Usuario() {
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

    public Usuario(int id, String email, String senha, int moderador) {
        this.id = id;
        this.email = email;
        this.senha = senha;
        this.moderador = moderador;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
