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

}
