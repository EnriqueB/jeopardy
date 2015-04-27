/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package juego;

/**
 *
 * @author Enrique
 */
public class Historia {
   String pista;
    int valor;

    public Historia() {
    }

    public Historia(String pista, int valor) {
        this.pista = pista;
        this.valor = valor;
    }

    public String getPista() {
        return pista;
    }

    public void setPista(String pista) {
        this.pista = pista;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
 
}
