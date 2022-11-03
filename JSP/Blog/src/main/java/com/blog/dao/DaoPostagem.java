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

    public  static List<Postagem> consultarUltimasPostagens(){
        List<Postagem> lista = new ArrayList<Postagem>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm = con.prepareStatement("select * from postagem order by idPostagem desc limit 10");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Postagem p = new Postagem();
                    p.setIdPostagem(rs.getInt("idPostagem"));
                    p.setTitulo(rs.getString("titulo"));
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

    public static Postagem consultarPorId(int id){
        Connection con = Conexao.conectar();
        Postagem p = new Postagem();
        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from postagem where idPostagem = ?");
                stm.setInt(1,id);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                    p.setTitulo(rs.getString("titulo"));
                    p.setIdPostagem(rs.getInt("idPostagem"));
                    p.setTexto(rs.getString("texto"));
                    p.setIdUsuario(rs.getInt("idUsuario"));
                }
            } catch (SQLException e) {
                return p;
            }
        }
        return p;
    }
}
