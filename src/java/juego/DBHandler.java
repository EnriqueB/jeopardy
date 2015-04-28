/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package juego;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rperez
 */
public class DBHandler {

    private static Connection connection;

    public DBHandler() {
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost/jeopardy", "root", "");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    public static void storeMessage(Mensaje mensaje) {
//        try {
//            Statement statement = connection.createStatement();
//            String de = mensaje.getDe();
//            String para = mensaje.getPara();
//            String contenido = mensaje.getContenido();
//            String query = "insert into mensajes (de, para, contenido) values ('" + de + "','" + para + "','" + contenido + "')";
//            statement.executeUpdate(query);
//            statement.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//    }

//    public static ArrayList getMessages(String para) {
//        ArrayList list = new ArrayList();
//        try {            
//            Statement statement = connection.createStatement();
//            ResultSet results = statement.executeQuery("SELECT de, contenido, contenido FROM mensajes where para='"+para+"'");
//            while (results.next()) {
//                String de=results.getString(1);
//                String contenido=results.getString(2);
//                Mensaje mensaje = new Mensaje(de, para, contenido);
//                list.add(mensaje);
//            }
//            statement.close();
//            
//        } catch (SQLException ex) {
//            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }

    public static int logIn(String user, String pass){
        try{
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT usuario, password, cambioPass FROM usuarios where usuario= '"+user+"'");
            results.next();
                String usr=results.getString(1);
                String password=results.getString(2);
                int cambio = results.getInt(3);
                if(usr.equals(user) && pass.equals(password)){
                    if(cambio == 0){
                        //no ha cambiado su password
                        return 2;
                    }
                    else //ya cambio su password
                        return 1;
                }
                else{
                    //no se encontro
                    return 0;
                }
        }
        catch (SQLException ex){
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    public static void cambio(String user, String pass){
        try{
            Statement statement = connection.createStatement();
            statement.executeUpdate("UPDATE usuarios SET password = '"+pass+"', cambioPass = "+1+" WHERE usuario = '"+user+"'");
        }
        catch (SQLException ex){
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static ArrayList listaJugadores(){
        ArrayList list = new ArrayList();
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT id, nombre, puntuacion FROM jugadores");
            while (results.next()) {
                int id = results.getInt(1);
                String nombre=results.getString(2);
                int puntuacion =results.getInt(3);
                Jugador jugador = new Jugador(nombre, id, puntuacion);
                list.add(jugador);
            }
            statement.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static void agregaJugador(String nombre){
        try{
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO jugadores (nombre, puntuacion) VALUES ('"+nombre+"', 0)");
            statement.close();
        }
        catch (SQLException ex){
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static ArrayList getTemas() {
        ArrayList temas = new ArrayList();
        try {
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT DISTINCT tema FROM temas");
            while(results.next()){
                String tema = results.getString(1);
                temas.add(tema);
            }
            statement.close();
        }
        catch (SQLException ex){
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return temas;
    }
    
    public static ArrayList getCategorias(String tema) {
        ArrayList categorias = new ArrayList();
        try {
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT DISTINCT categoria FROM categorias WHERE tema = '"+tema+"'");
            while(results.next()){
                String categoria = results.getString(1);
                categorias.add(categoria);
            }
            statement.close();
        }
        catch (SQLException ex){
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categorias;
    }
    
    
    public static ArrayList getPistas(String categoria, String tema) {
        ArrayList categorias = new ArrayList();
        try {
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT DISTINCT pista FROM preguntas WHERE categoria = '"+categoria+"' AND tema='"+tema+"'");
            while(results.next()){
                String pista = results.getString(1);
                categorias.add(pista);
            }
            statement.close();
        }
        catch (SQLException ex){
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categorias;
    }

}
