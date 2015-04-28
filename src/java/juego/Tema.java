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
public class Tema {
    ArrayList categorias;
    String nombre;

    public Tema() {
        categorias = new ArrayList();
    }
    
    public void agregarCategoria(Categoria cat){
        categorias.add(cat);
    }

    public ArrayList getCategorias() {
        return categorias;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
