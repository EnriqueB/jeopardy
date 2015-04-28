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
        <title>Jeopardy!</title>
        <style>
            #selectMateria, #selectCategoria, #selectPista {
                width:222px;
            }
            table {
                float:left;
                width:20%;
            }
            #popupTema, #popupCategoria {
                display:none;
            }
        </style>
    </head>
    <body onload="javascript:mostrarTemas()">
        <% String user = (String) session.getAttribute("usuario");
            if (user == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <h1>Panel de Control</h1>
        <div class="container">
            <table>
                <tbody>
                    <tr>
                        <td><h3>Temas</h3></td>
                    </tr>
                    <tr>
                        <td>Buscar:<input type="text" name="materia"/></td>
                    </tr>
                    <tr>
                        <td>
                            <select name="materia" size="3" id="selectMateria" onchange="mostrarCategorias()">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><button type="button" onclick="agregarTemaShow()">Agregar materia</button></td>
                    </tr>
                </tbody>
            </table>            
            <table>
                <tbody>
                    <tr>
                        <td><h3>Categorias</h3></td>
                    </tr>
                    <tr>
                        <td>Buscar:<input type="text" name="materia"/></td>
                    </tr>
                    <tr>
                        <td>
                            <select name="categoria" size="3" id="selectCategoria" onchange="mostrarPistas()">                               
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><button type="button" onclick="agregarCategoriaShow()">Agregar categoria</button></td>
                    </tr>
                    <tr>
                        <td><button type="button" onclick="">Borrar categoria</button></td>
                    </tr>
                </tbody>
            </table>            
            <table>
                <tbody>
                    <tr>
                        <td><h3>Pistas</h3></td>
                    </tr>
                    <tr>
                        <td>Buscar:<input type="text" name="materia"/></td>
                    </tr>
                    <tr>
                        <td>
                            <select name="pistas" size="3" id="selectPista">                              
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td><button type="button" onclick="">Borrar pista</button></td>
                    </tr>
                </tbody>
            </table>            
        </div>
        <!-- Popup Div para agregar Temas -->
        <div id="popupTema">
            <form action="javascript:agregarTema()" id="formTema" method="post" name="form">
                <h2>Agregar Tema</h2>
                <input id="tema" name="Tema" placeholder="Tema" type="text">
                <br/>
                <a href="javascript:validarTema()" id="submit">Agregar</a>
                <a href="javascript:agregarTemaHide()" id="cancel">Cancelar</a>
            </form>
        </div>
        <!-- Popup Div temas termina -->
        <!-- Popup Div para agregar Categorias -->
        <div id="popupCategoria">
            <form action="javascript:agregarCategoria()" id="formCategoria" method="post" name="form">
                <h2>Agregar Categoria</h2>
                <input id="categoria" name="categoria" placeholder="Categoria" type="text">
                <br/>
                <a href="javascript:validarCategoria()" id="submit">Agregar</a>
                <a href="javascript:agregarCategoriaHide()" id="cancel">Cancelar</a>
            </form>
        </div>
        <!-- Popup Div temas termina -->
        
        <script src="javascript/controlpaneljs.js">
        </script>
    </body>
</html>
