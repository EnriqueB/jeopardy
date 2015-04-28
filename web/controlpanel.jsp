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
            #popupTema, #popupCategoria, #popupPista, #popupPistaM, #popupCategoriaM {
                display:none;
                position:absolute;
                top:300px;
                left:50px;
            }
            #returnButton {
                position:absolute;
                top:400px;
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
                        <td>
                            <select name="categoria" size="3" id="selectCategoria" onchange="mostrarPistas()">                               
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><button type="button" onclick="agregarCategoriaShow()">Agregar categoria</button></td>
                    </tr>
                    <tr>
                        <td><button type="button" onclick="agregarCategoriaShowM()">Editar categoria</button></td>
                    </tr>
                    <tr>
                        <td><button type="button" onclick="borrarCategoria()">Borrar categoria</button></td>
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
                            <select name="pistas" size="3" id="selectPista" onchange="mostrarDetalle()">                              
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><button type="button" onclick="agregarPistaShow()">Agregar pista</button></td>
                    </tr>
                    <tr>
                        <td><button type="button" onclick="agregarPistaShowM()">Editar pista</button></td>
                    </tr>
                    <tr>
                        <td><button type="button" onclick="borrarPista()">Borrar pista</button></td>
                    </tr>
                </tbody>
            </table> 
            <table border="1">
                <tbody id="detallePistas">
                </tbody>
            </table>
        </div>
        <form action="/jeopardy/menu.jsp" id="returnButton">
            <input type="submit" value="Regresar"/>
        </form>
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
        <!-- Popup Div categorias termina -->
        <!-- Popup Div para agregar Pistas -->
        <div id="popupPista">
            <form action="javascript:agregarPista()" id="formPista" method="post" name="form">
                <h2>Agregar Pista</h2>
                <input id="pista" name="pista" placeholder="Pista" type="text">
                <input id="respuesta" name="respuesta" placeholder="Respuesta" type="text">
                <input id="valor" name="valor" placeholder="Puntuacion" type="text">
                <br/>
                <a href="javascript:validarPista()" id="submit">Agregar</a>
                <a href="javascript:agregarPistaHide()" id="cancel">Cancelar</a>
            </form>
        </div>
        <!-- Popup Div Pistas termina -->
        <div id="popupPistaM">
            <form action="javascript:editarPista()" id="formPistaM" method="post" name="form">
                <h2>Modificar Pista</h2>
                <input id="pistaM" name="pista" type="text">
                <input id="respuesta" name="respuesta" type="text">
                <input id="valor" name="valor" type="text">
                <br/>
                <a href="javascript:validarPistaM()" id="submit">Modificar</a>
                <a href="javascript:agregarPistaHideM()" id="cancel">Cancelar</a>
            </form>
        </div>
        <!-- Popup Div Pistas termina -->
        <!-- Popup Div Categoria termina -->
        <div id="popupCategoriaM">
            <form action="javascript:editarCategoria()" id="formCategoriaM" method="post" name="form">
                <h2>Modificar Categoria</h2>
                <input id="categoriaM" name="categoria" type="text">
                <br/>
                <a href="javascript:validarCategoriaM()" id="submit">Modificar</a>
                <a href="javascript:agregarCategoriaHideM()" id="cancel">Cancelar</a>
            </form>
        </div>
        <!-- Popup Div Categoria termina -->
        <script src="javascript/controlpaneljs.js">
        </script>
    </body>
</html>
