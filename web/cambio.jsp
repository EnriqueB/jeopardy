<%-- 
    Document   : cambio
    Created on : Apr 27, 2015, 6:10:16 PM
    Author     : Enrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambio de password</title>
    </head>
    <body>
        <h1>Cambio de password</h1>
        <% String error = (String)request.getAttribute("error");
           if(error!=null){
        %>
        <%= error %>
        <%}%>
        <p>Antes de continuar, por favor cambie su password</p>
        <form action="Server" method="POST">
            <input type="hidden" name ="operacion" value ="cambioPass">
            Password nueva:
            <input type="password" name="passN">
            Repetir password nueva:
            <input type="password" name="passN2">
            <input type="submit" value ="cambiar">
        </form>
    </body>
</html>
