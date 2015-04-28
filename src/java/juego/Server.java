/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package juego;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
        else if(op.equals("Agregar")){
            //Obtener lista de jugadores en la base de datos
            ArrayList jugadores = DBHandler.listaJugadores();
            session.setAttribute("jugadoresLista", jugadores);
            url="/agregarJugadores.jsp";
        }
        else if(op.equals("agregarJugador")){
            String nombre = request.getParameter("jugador");
            if(nombre.equals("")){
                url="/menu.jsp";
            }
            else{
                DBHandler.agregaJugador(nombre);
                url="/menu.jsp";
            }
        }
        else if(op.equals("Jugar")){
            url="/elegirJugadores.jsp";
            ArrayList jugadores = DBHandler.listaJugadores();
            session.setAttribute("jugadoresLista", jugadores);
        }
        else if(op.equals("empezarJuego")){
            String jugador1 = request.getParameter("jugador1");
            String jugador2 = request.getParameter("jugador2");
            String jugador3 = request.getParameter("jugador3");
            String jugador4 = request.getParameter("jugador4");
            if(jugador1.equals("") && jugador2.equals("") && jugador3.equals("") && jugador4.equals("")){
                request.setAttribute("error", "Por favor seleccione al menos un jugador");
                url = "/elegirJugadores.jsp";
            }
            else{
                //almacenar en la sesion los jugadores que si existen
                ArrayList jugadores = new ArrayList();
                int cantJugadores=0;
                if(!jugador1.equals("")){
                    cantJugadores++;
                    Jugador jug1 = new Jugador(jugador1, 0, 0);
                    jugadores.add(jug1);
                }
                if(!jugador2.equals("")){
                    cantJugadores++;
                    Jugador jug2 = new Jugador(jugador2, 0, 0);
                    jugadores.add(jug2);
                }
                if(!jugador3.equals("")){
                    cantJugadores++;
                    Jugador jug3 = new Jugador(jugador3, 0, 0);
                    jugadores.add(jug3);
                }
                if(!jugador4.equals("")){
                    cantJugadores++;
                    Jugador jug4 = new Jugador(jugador4, 0, 0);
                    jugadores.add(jug4);
                }
                session.setAttribute("jugadores", jugadores);
                session.setAttribute("cantidad", cantJugadores);
                session.setAttribute("turno", 0);
                url="/elegirTemas.jsp";
            }
        }
        else if(op.equals("revisarRespuesta")){
            String respUsuario = request.getParameter("resp");
            String respCorrecta = request.getParameter("respCorrecta");
            if(respUsuario.equalsIgnoreCase(respCorrecta)){
                //El usuario respondio de manera correcta
                //Actualizar puntaje
                ArrayList jugadores = (ArrayList)session.getAttribute("jugadores");
                int turno = (int)session.getAttribute("turno")%(int)session.getAttribute("cantidad");
                ((Jugador)jugadores.get(turno)).setPuntuacion(((Jugador)jugadores.get(turno)).getPuntuacion()+Integer.parseInt(request.getParameter("valor")));
                session.setAttribute("turno", (int)session.getAttribute("turno")+1);
                request.setAttribute("resultado", "Felicidades! La respuesta es correcta");
                url="/juego.jsp";
            }
            else{
                session.setAttribute("turno", (int)session.getAttribute("turno")+1);
                request.setAttribute("resultado", "Lo siento, la respuesta es incorrecta");
                url="/juego.jsp";
                
            }
        }
        else if(op.equals("Terminar")){
            //juego termino
            url="/terminar.jsp";
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
