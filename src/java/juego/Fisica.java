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
public class Fisica {
    String pista, categoria, respuesta;
    int valor;

    public Fisica() {
    }

    public Fisica(String pista, String categoria, String respuesta, int valor) {
        this.pista = pista;
        this.valor = valor;
    }

    public String getPista() {
        return pista;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
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

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

}
