<%-- 
    Document   : menu
    Created on : Apr 27, 2015, 4:37:55 PM
    Author     : Enrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
    </head>
    <body>
        <% String user = (String) session.getAttribute("usuario");
            if (user == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <h1>Hello World!</h1>
        <ul>
            <li><a href ="Server?operacion=Jugar">Jugar</a></li>
            <li><a href ="Server?operacion=Agregar">Agregar jugadores</a></li>
            <li><a href ="Server?operacion=Preguntas">Agregar y modificar preguntas</a></li>  
        </ul>
        <a href="Server?operacion=logout">
            Logout
        </a>
    </body>
</html>
