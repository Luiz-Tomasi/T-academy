package com.blog.dao;

import com.blog.entidades.Comentario;
import com.blog.entidades.Postagem;
import com.blog.entidades.Usuario;
import utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoComentario {

    public static List<Comentario> comentarios = new ArrayList<Comentario>();

    public  static List<Comentario> consultarComentarios(int id){
        List<Comentario> lista = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm = con.prepareStatement("select * from Comentario where idPostagem =" +id+" and verificado = 1;");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Comentario c = new Comentario();
                    c.setIdComentario(rs.getInt("idComentario"));
                    c.setIdPostagem(rs.getInt("idPostagem"));
                    c.setComentario(rs.getString("comentario"));
                    c.setVerificado(rs.getInt("verificado"));
                    c.setIdUsuario(rs.getInt("idUsuario"));
                    lista.add(c);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }

}
