/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package juego;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Enrique
 */
public class Server extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String op = request.getParameter("operacion");
        String url ="/inicio.jsp";
        HttpSession session = request.getSession();
        
        if(op.equals("login")){
            //revisar si el usuario ha cambiado su password
            int exists = DBHandler.logIn(request.getParameter("user"), request.getParameter("pass"));
            if(exists == 1){
                url="/menu.jsp";
                session.setAttribute("usuario", request.getParameter("user"));
                request.setAttribute("error", ""); 
            }
            else if (exists == 2){
                url="/cambio.jsp";
                session.setAttribute("usuario", request.getParameter("user"));
                request.setAttribute("error", ""); 
            }
            else {
                url="/login.jsp";
                request.setAttribute("error", "Usuario o password incorrecto");
            }
        } 
        else if(op.equals("ControlPanel")) {
            url="/controlpanel.jsp";
        } 
        else if (op.equals("cambioPass")){
            String passVieja = request.getParameter("passV");
            String passNueva = request.getParameter("passN");
            String passNueva2 = request.getParameter("passN2");
            //revisar que las passwords nuevas concuerden
            if(!passNueva.equals(passNueva2)){
                url="/cambio.jsp";
                request.setAttribute("error", "Passwords no concuerdan");
            }
            else{
                DBHandler.cambio((String)session.getAttribute("usuario"), passNueva);
                url="/menu.jsp";
                request.setAttribute("error", ""); 
            }
        }
        else if(op.equals("logout")) {
            session.invalidate(); 
            url="/login.jsp";
        }
        ServletContext sc = this.getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher(url);
        rd.forward(request, response);
        
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
        processRequest(request, response);
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
