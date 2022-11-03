package com.blog.dao;

import com.blog.entidades.Usuario;
import utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DaoUsuario {
    public static List<Usuario> usuarios = new ArrayList<Usuario>();

    public  static List<Usuario> consultarUsuarios(){
        List<Usuario> lista = new ArrayList<Usuario>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm = con.prepareStatement("select * from usuario;");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Usuario u = new Usuario();
                    u.setIdUsuario(rs.getInt("idUsuario"));
                    u.setEmail(rs.getString("email"));
                    u.setSenha(rs.getString("senha"));
                    u.setModerador(rs.getInt("moderador"));
                    lista.add(u);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }

    public static Usuario autenticarLogin(String email, String senha){
        Connection con = Conexao.conectar();
        Usuario u = new Usuario();
        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from usuario where email = ? and senha = ?");
                stm.setString(1,email);
                stm.setString(2,senha);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                    u.setIdUsuario(rs.getInt("idUsuario"));
                    u.setEmail(rs.getString("email"));
                    u.setSenha(rs.getString("senha"));
                    u.setModerador(rs.getInt("moderador"));
                }
            } catch (SQLException e) {
                return u;
            }
        }
        return u;
    }


}
