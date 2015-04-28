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

    public Tema() {
        categorias = new ArrayList();
    }
    
    public void agregarCategoria(Categoria cat){
        categorias.add(cat);
    }

    public ArrayList getCategorias() {
        return categorias;
    }
    
}
