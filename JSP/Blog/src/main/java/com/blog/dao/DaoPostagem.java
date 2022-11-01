package com.blog.dao;

import com.blog.entidades.Postagem;
import utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoPostagem {

    public static List<Postagem> Postagens = new ArrayList<Postagem>();

    public  static List<Postagem> consultarPostagens(){
        List<Postagem> lista = new ArrayList<Postagem>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm = con.prepareStatement("select * from postagem;");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Postagem p = new Postagem();
                    p.setIdPostagem(rs.getInt("idPostagem"));
                    p.setTexto(rs.getString("texto"));
                    p.setIdUsuario(rs.getInt("idUsuario"));
                    lista.add(p);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }
}
