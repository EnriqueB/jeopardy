/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package juego;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Fernando
 */
@WebServlet(name = "ServerPanel", urlPatterns = {"/ServerPanel"})
public class ServerPanel extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String op = request.getParameter("op");
        PrintWriter out = response.getWriter();
        String respuesta = "";
        if(op.equals("temas")) {
            ArrayList temas = DBHandler.getTemas();
            for(int i=0; i<temas.size(); i++) {
                respuesta+="<option value='"+temas.get(i)+"'>"+temas.get(i)+"</option>";
            }
            out.println(respuesta);
        }
        else if(op.equals("categoria")) {
            String tema = request.getParameter("value");
            ArrayList categorias = DBHandler.getCategorias(tema);
            for(int i=0; i<categorias.size(); i++) {
                respuesta+="<option value='"+categorias.get(i)+"'>"+categorias.get(i)+"</option>";
            }
            out.println(respuesta);
        }
        else if(op.equals("pistas")) {
            String categoria = request.getParameter("value");
            String tema = request.getParameter("tema");
            ArrayList pistas = DBHandler.getPistas(categoria, tema);
            for(int i=0; i<pistas.size(); i++) {
                respuesta+="<option value='"+pistas.get(i)+"'>"+pistas.get(i)+"</option>";
            }
            out.println(respuesta);
        }
        else if(op.equals("agregarTema")) {
            String tema = request.getParameter("value");
            DBHandler.agregarTema(tema);
            out.println(respuesta);
        }
        else if(op.equals("agregarCategoria")) {
            String categoria = request.getParameter("value");
            String tema = request.getParameter("tema");
            DBHandler.agregarCategoria(tema, categoria);
            out.println(respuesta);
        }
//        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
