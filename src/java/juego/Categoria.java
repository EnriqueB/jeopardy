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
public class Categoria {
    ArrayList preguntas;
    
    public Categoria() {
        preguntas = new ArrayList();
    }
    
    public void agregarPreguntas(Pregunta preg){
        preguntas.add(preg);
    }

    public ArrayList getPreguntas() {
        return preguntas;
    }
   
    
}
