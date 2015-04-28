<%-- 
    Document   : juego
    Created on : Apr 27, 2015, 9:28:02 PM
    Author     : Enrique
--%>

<%@page import="juego.Jugador"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String user = (String) session.getAttribute("usuario");
            if (user == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <h1>Jeopardy!</h1>
        <br>
        <% String mensaje = (String)request.getAttribute("resultado");
           if(mensaje!=null){
        %>
        <%= mensaje %>
        <%}%>
        <br>
        <%  ArrayList jugadores = (ArrayList)session.getAttribute("jugadores");
            int turno = (int)session.getAttribute("turno")%(int)session.getAttribute("cantidad");
           %>
        <h3>Ahora es el turno de: <%=((Jugador)jugadores.get(turno)).getNombre()%></h3>
    </body>
</html>