package com.blog.dao;

import com.blog.entidades.Comentario;
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

    public static String salvar(Postagem post){
        Connection con = Conexao.conectar();
        if(con != null){

            String sql = "insert into postagem(titulo, verificado, texto)" +
                    "values(?,?,?)";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1,post.getTitulo());
                stm.setInt(2,0);
                stm.setString(3,post.getTexto());

                stm.execute();

            } catch (SQLException e) {
                return  "Erro: " + e.getMessage();
            }
            return "Registro inserido com sucesso";
        }
        return "erro de conexão";
    }

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

    public static String editarPostagem(int id, String novoTexto){
        Connection con = Conexao.conectar();
        String sql = "update postagem set texto = ? where idPostagem = ?";
        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1,novoTexto);
                stm.setInt(2, id);
                stm.execute();
            } catch (SQLException e) {
                return "Deu erro";
            }
            return "Executado";
        }
        return "Finalizado";
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

    public static String deletaPostagem(int id){
        Connection con = Conexao.conectar();
        String sql = "delete from postagem where idPostagem = ?;";
        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1,id);
                stm.execute();
            } catch (SQLException e) {
                return "Deu erro";
            }
            return "Executado";
        }
        return "Finalizado";
    }
}
