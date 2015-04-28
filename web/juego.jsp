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
            String cat2 = ((Pregunta)categoria1.get(1)).getCategoria();
            String cat3 = ((Pregunta)categoria1.get(2)).getCategoria();
            String cat4 = ((Pregunta)categoria1.get(3)).getCategoria();

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
            
            <table>
                <tr>
                    <th><%=cat1%></th>
                    <th><%=cat2%></th>
                    <th><%=cat3%></th>
                    <th><%=cat4%></th>
                </tr>
                <tr>
                    <%
                        for(int i=0; i<categoria1.size(); ++i){
                            Pregunta preg = (Pregunta)categoria1.get(i);
                            %>
                    <a href="javascript:submitFormWithValue('<%=preg.getPista()%>')"><%=preg.getValor()%></a>
                    <%
                        }
                    %>
                </tr>
                <tr>
                    <%
                        for(int i=0; i<categoria2.size(); ++i){
                            Pregunta preg = (Pregunta)categoria1.get(i);
                            %>
                    <a href="javascript:submitFormWithValue('<%=preg.getPista()%>')"><%=preg.getValor()%></a>
                    <%
                        }
                    %>
                </tr>
                <tr>
                    <%
                        for(int i=0; i<categoria3.size(); ++i){
                            Pregunta preg = (Pregunta)categoria1.get(i);
                            %>
                    <a href="javascript:submitFormWithValue('<%=preg.getPista()%>')"><%=preg.getValor()%></a>
                    <%
                        }
                    %>
                </tr>
                <tr>
                    <%
                        for(int i=0; i<categoria4.size(); ++i){
                            Pregunta preg = (Pregunta)categoria1.get(i);
                            %>
                    <a href="javascript:submitFormWithValue('<%=preg.getPista()%>')"><%=preg.getValor()%></a>
                    <%
                        }
                    %>
                </tr>
            </table>
        </form>
        <form action="Server" method="POST">
            <input type="hidden" name ="operacion" value ="terminar">
            <input type="submit" name="Terminar">
        </form>
    </body>
</html>