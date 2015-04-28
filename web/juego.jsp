<%-- 
    Document   : juego
    Created on : Apr 27, 2015, 9:28:02 PM
    Author     : Enrique
--%>

<%@page import="juego.Pregunta"%>
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
        <br>
        <%  ArrayList listaCategorias = (ArrayList)session.getAttribute("perfil");
            ArrayList categoria1 = (ArrayList)listaCategorias.get(0);
            ArrayList categoria2 = (ArrayList)listaCategorias.get(1);
            ArrayList categoria3 = (ArrayList)listaCategorias.get(2);
            ArrayList categoria4 = (ArrayList)listaCategorias.get(3);
            String cat1 = ((Pregunta)categoria1.get(0)).getCategoria();
            String cat2 = ((Pregunta)categoria2.get(1)).getCategoria();
            String cat3 = ((Pregunta)categoria3.get(2)).getCategoria();
            String cat4 = ((Pregunta)categoria4.get(3)).getCategoria();

        %>
        <script type="text/javascript">
        function submitFormWithValue(val){
          document.getElementById('command').value = val;
          document.forms["juego"].submit();
        }
        </script>
        <form id="juego" action="Server" method="POST">
            <input type="hidden" name ="operacion" value ="eleccionPregunta">
            <input type="hidden" id="command" name="pista" value="">
            
            <table  border="1">
                <tr>
                    <th><%=cat1%></th>
                    <th><%=cat2%></th>
                    <th><%=cat3%></th>
                    <th><%=cat4%></th>
                </tr>
                <tr>
                    <% Pregunta preg1 = (Pregunta)categoria1.get(0);
                       Pregunta preg2 = (Pregunta)categoria2.get(0);
                       Pregunta preg3 = (Pregunta)categoria3.get(0);
                       Pregunta preg4 = (Pregunta)categoria4.get(0);
                    %>
                    <td><a href="javascript:submitFormWithValue('<%=preg1.getPista()%>')"><%=preg1.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg2.getPista()%>')"><%=preg2.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg3.getPista()%>')"><%=preg3.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg4.getPista()%>')"><%=preg4.getValor()%></a></td>
                </tr>
                <tr>
                    <% preg1 = (Pregunta)categoria1.get(1);
                       preg2 = (Pregunta)categoria2.get(1);
                       preg3 = (Pregunta)categoria3.get(1);
                       preg4 = (Pregunta)categoria4.get(1);
                    %>
                    <td><a href="javascript:submitFormWithValue('<%=preg1.getPista()%>')"><%=preg1.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg2.getPista()%>')"><%=preg2.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg3.getPista()%>')"><%=preg3.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg4.getPista()%>')"><%=preg4.getValor()%></a></td>
                </tr>
                <tr>
                    <% preg1 = (Pregunta)categoria1.get(2);
                       preg2 = (Pregunta)categoria2.get(2);
                       preg3 = (Pregunta)categoria3.get(2);
                       preg4 = (Pregunta)categoria4.get(2);
                    %>
                    <td><a href="javascript:submitFormWithValue('<%=preg1.getPista()%>')"><%=preg1.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg2.getPista()%>')"><%=preg2.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg3.getPista()%>')"><%=preg3.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg4.getPista()%>')"><%=preg4.getValor()%></a></td>
                </tr>
                <tr>
                    <% preg1 = (Pregunta)categoria1.get(3);
                       preg2 = (Pregunta)categoria2.get(3);
                       preg3 = (Pregunta)categoria3.get(3);
                       preg4 = (Pregunta)categoria4.get(3);
                    %>
                    <td><a href="javascript:submitFormWithValue('<%=preg1.getPista()%>')"><%=preg1.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg2.getPista()%>')"><%=preg2.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg3.getPista()%>')"><%=preg3.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg4.getPista()%>')"><%=preg4.getValor()%></a></td>
                </tr>
                <tr>
                    <% preg1 = (Pregunta)categoria1.get(4);
                       preg2 = (Pregunta)categoria2.get(4);
                       preg3 = (Pregunta)categoria3.get(4);
                       preg4 = (Pregunta)categoria4.get(4);
                    %>
                    <td><a href="javascript:submitFormWithValue('<%=preg1.getPista()%>')"><%=preg1.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg2.getPista()%>')"><%=preg2.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg3.getPista()%>')"><%=preg3.getValor()%></a></td>
                    <td><a href="javascript:submitFormWithValue('<%=preg4.getPista()%>')"><%=preg4.getValor()%></a></td>
                </tr>
            </table>
        </form>
        <form action="Server" method="POST">
            <input type="hidden" name ="operacion" value ="Terminar">
            <input type="submit" name="Terminar" value = "Terminar">
        </form>
    </body>
</html>