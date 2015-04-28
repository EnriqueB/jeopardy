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
        <h1>Hello World!</h1>
        <% ArrayList lista = (ArrayList)session.getAttribute("jugadores");
               for(int i=0; i<lista.size(); ++i){ 
               Jugador jug = (Jugador)lista.get(i);%>
               <%=jug.getNombre()%>, <%=jug.getPuntuacion()%>
               <br>
            <%}
            %>
    </body>
</html>