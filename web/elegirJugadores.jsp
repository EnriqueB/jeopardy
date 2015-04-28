<%-- 
    Document   : elegirJugadores
    Created on : Apr 27, 2015, 8:54:53 PM
    Author     : Enrique
--%>

<%@page import="juego.Jugador"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Elegir jugadores</title>
    </head>
    <body>
        <% String user = (String) session.getAttribute("usuario");
            if (user == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <h1>Elija hasta cuatro jugadores</h1>
        <% String error = (String)request.getAttribute("error");
           if(error!=null){
        %>
        <%= error %>
        <%}%>
        <form action="Server" method="POST">
            Jugador 1: <br>
            <input type="hidden" name ="operacion" value ="empezarJuego">
            <select name="jugador1">
                <option></option>
            <% ArrayList lista = (ArrayList)session.getAttribute("jugadoresLista");
               for(int i=0; i<lista.size(); ++i){ 
               Jugador jug = (Jugador)lista.get(i);%>
               <option>Jugador: <%=jug.getNombre()%>, Puntuacion: <%=jug.getPuntuacion()%></option>  
               <%}
            %>
            </select>
            <br>
            <br>
            Jugador 2:<br>
            <select name="jugador2">
                <option></option>
            <% 
               for(int i=0; i<lista.size(); ++i){ 
               Jugador jug = (Jugador)lista.get(i);%>
               <option><%=jug.getNombre()%></option>  
               <%}
            %>
            </select>
            <br>
            <br>
            Jugador 3:<br>
            <select name="jugador3">
                <option></option>
            <% 
               for(int i=0; i<lista.size(); ++i){ 
               Jugador jug = (Jugador)lista.get(i);%>
               <option>Jugador: <%=jug.getNombre()%>, Puntuacion: <%=jug.getPuntuacion()%></option>  
               <%}
            %>
            </select>
            <br>
            <br>
            Jugador 4:<br>
            <select name="jugador4">
                <option></option>
            <% 
               for(int i=0; i<lista.size(); ++i){ 
               Jugador jug = (Jugador)lista.get(i);%>
               <option>Jugador: <%=jug.getNombre()%>, Puntuacion: <%=jug.getPuntuacion()%></option>  
               <%}
            %>
            </select>
            <br>
            <input type="submit" value ="Jugar">
        </form>
    </body>
</html>
