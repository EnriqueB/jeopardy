<%-- 
    Document   : controlpanel
    Created on : Apr 27, 2015, 6:23:00 PM
    Author     : Fernando
--%>

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
        <h1>Panel de Control</h1>
        <form method="post" action="">
            <h3>Materias</h3>
            Buscar:<input type="text" name="materia"/>
            <br/>
            <br/>
            <select name="materia" size="3">
                <option>Física</option>
                <option>Geografía</option>
                <option>Historia</option>
                <option>Matemáticas</option>
                <option>Redes</option>
            </select>
            <button type="button" onclick=""></button>
        </form>
    </body>
</html>
