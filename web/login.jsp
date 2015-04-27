<%-- 
    Document   : login
    Created on : Mar 22, 2015, 8:20:34 PM
    Author     : Enrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <jsp:useBean id = "datos" scope= "session"
   class = "juego.DBHandler" />
        <h1>Favor de ingresar sus datos</h1>
        <% String error = (String)request.getAttribute("error");
           if(error!=null){
        %>
        <%= error %>
        <%}%>
        <form action="server" method="POST">
            <input type="hidden" name ="operacion" value ="login">
            Usuario:
            <input type="text" name="user"> <br><br>
            Password:
            <input type="password" name="pass">
            <input type="submit" value ="entrar">
        </form>
    </body>
</html>
