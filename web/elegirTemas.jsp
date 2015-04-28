<%-- 
    Document   : elegirTemas
    Created on : Apr 28, 2015, 12:20:59 AM
    Author     : Fernando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #selectMateria, #selectCategoria, #selectPista {
                width:222px;
            }
            table {
                float:left;
                width:20%;
            }
        </style>
    </head>
    <body onload="mostrarTemas()">
        <% String user = (String) session.getAttribute("usuario");
            if (user == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <h1>Elegir Tema!</h1>
        <form action="Server" id="listaPistas" method="POST">
            <input type="hidden" name ="operacion" value ="elegirCategorias">
            <input type="submit" value ="Jugar!">
        </form>
        <div class="container">
            <table>
                <tbody>
                    <tr>
                        <td><h3>Temas</h3></td>
                    </tr>
                    <tr>
                        <td>
                            <select name="materia" size="4" id="selectMateria" onchange="mostrarCategorias()">
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>            
            <table>
                <tbody>
                    <tr>
                        <td><h3>Categorias</h3></td>
                    </tr>
                    <tr>
                        <td>
                            <select name="categoria" size="4" id="selectCategoria" onchange="mostrarPistas()">                               
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>            
            <table>
                <tbody>
                    <tr>
                        <td><h3>Pistas</h3></td>
                    </tr>
                    <tr>
                        <td>
                            <select name="pistas" size="4" id="selectPista">                              
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><button type="button" onclick="agregarLista()">Agregar categoria a la lista</button></td>
                    </tr>
                </tbody>
            </table> 
            <table>
                <tbody>
                <ol id ="detallePistas">
                </ol>
                </tbody>
            </table>
        </div>
        <script src="javascript/controlpaneljs.js">
        </script>
    </body>
</html>
