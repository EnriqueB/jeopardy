<%-- 
    Document   : pregunta
    Created on : Apr 27, 2015, 10:38:45 PM
    Author     : Enrique
--%>

<%@page import="juego.Pregunta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pregunta</title>
    </head>
    <body>
        <% String user = (String) session.getAttribute("usuario");
            if (user == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <h1>Pista</h1>
        <%Pregunta preg = (Pregunta)session.getAttribute("Pregunta");%>
        <h3>Categoria: <%=preg.getCategoria()%></h3>
        <br>
        Pista: <%=preg.getPista()%> <br>
        <form action="Server" method="POST">
            <input type="hidden" name ="operacion" value ="revisarRespuesta">
            <input type="hidden" name ="respCorrecta" value ="<%=preg.getRespuesta()%>">
            <input type="hidden" name ="valor" value ="<%=preg.getValor()%>">
            Respuesta: <input type="text" name ="resp">
            <br>
            <input type="submit" value ="responder">        
        </form>
    </body>
</html>
