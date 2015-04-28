<%-- 
    Document   : agregarJugadores
    Created on : Apr 27, 2015, 7:11:05 PM
    Author     : Enrique
--%>

<%@page import="juego.Jugador"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jugadores</title>
    </head>
    <body>
        <% String user = (String) session.getAttribute("usuario");
            if (user == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <h1>Lista de jugadores actuales</h1>
        <ol>
            <% ArrayList lista = (ArrayList)session.getAttribute("jugadoresLista");
               for(int i=0; i<lista.size(); ++i){ 
               Jugador jug = (Jugador)lista.get(i);%>
               <li>Jugador: <%=jug.getNombre()%>, Puntuacion: <%=jug.getPuntuacion()%></li>  
               <%}
            %>
        </ol>
        <br>
        Para agregar jugadores, favor de llenar la siguiente forma:
         <form action="Server" method="POST">
            <input type="hidden" name ="operacion" value ="agregarJugador">
            Nombre:
            <input type="text" name="jugador">
            <input type="submit" value ="Agregar">
        </form>
    </body>
</html>
