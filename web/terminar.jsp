<%-- 
    Document   : terminar
    Created on : Apr 27, 2015, 11:56:51 PM
    Author     : Enrique
--%>

<%@page import="juego.Jugador"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fin</title>
    </head>
    <body>
        <h1>Puntuaciones finales</h1><br>
        <%  ArrayList jugadores = (ArrayList)session.getAttribute("jugadores");
            int max=0;
            int maxI=0;
            for(int i=0; i<jugadores.size(); ++i){
                Jugador jug = (Jugador)jugadores.get(i);
                if (jug.getPuntuacion()>=max){
                    max=jug.getPuntuacion();
                    maxI=i;
                }
                %>
                Jugador <%=i+1%>: <%=jug.getNombre()%>, Puntuacion: <%=jug.getPuntuacion()%> <br>
        <%
            }
        %>
        <br>
        El ganador es:<br>
        <h2><%=((Jugador)jugadores.get(maxI)).getNombre()%>!!!!!</h2>
    </body>
</html>
