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

    public static String salvar(Comentario comen, int idPostagem){
        Connection con = Conexao.conectar();
        //Usuario usuario = new Usuario();
        if(con != null){

            //try {
              //  PreparedStatement stm = con.prepareStatement("select * from postagem where email = ?");
                //stm.setString(1,email);
                //ResultSet rs = stm.executeQuery();
                //if(rs.next()){
                 //   usuario.setIdUsuario(rs.getInt("idUsuario"));
                   // usuario.setEmail(rs.getString("email"));
                    //usuario.setSenha(rs.getString("senha"));
                    //usuario.setModerador(rs.getInt("moderador"));
                //}
            //} catch (SQLException e) {

            //}

            String sql = "insert into comentario(comentario, verificado, idPostagem)" +
                    "values(?,?,?)";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1,comen.getComentario());
                stm.setInt(2,0);
                stm.setInt(3,idPostagem);

                stm.execute();

            } catch (SQLException e) {
                return  "Erro: " + e.getMessage();
            }
            return "Registro inserido com sucesso";
        }
        return "erro de conexão";
    }

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

    public  static List<Comentario> consultarComentarioPendente(){
        List<Comentario> lista = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm = con.prepareStatement("select * from comentario where verificado = 0;");
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

    public static String aceitarComentario(int id){
        Connection con = Conexao.conectar();
        String sql = "update comentario set verificado = '1' where idComentario = ?;";
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

    public static String deletaComentario(int id){
        Connection con = Conexao.conectar();
        String sql = "delete from comentario where idComentario = ?;";
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
