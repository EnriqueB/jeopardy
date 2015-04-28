/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package juego;

import java.util.ArrayList;

/**
 *
 * @author Enrique
 */
public class Perfil {
    ArrayList temas;

    public Perfil() {
        temas = new ArrayList();
    }
    
    public void agregarTema(Tema tema){
        temas.add(tema);
    }
    
    public ArrayList getTemas() {
        return temas;
    }
    
    public void borrarTema(String tema){
        for(int i=0; i<temas.size(); ++i){
            Tema t = (Tema)temas.get(i);
            if(t.nombre.equals(tema)){
                temas.remove(i);
                break;
            }
        }
    }

}
