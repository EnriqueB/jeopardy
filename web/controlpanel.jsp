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
            #materia {
                width:222px;
            }
            table {
                float:left;
                width:20%;
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
                        <td><h3>Materias</h3></td>
                    </tr>
                    <tr>
                        <td>Buscar:<input type="text" name="materia"/></td>
                    </tr>
                    <tr>
                        <td>
                            <select name="materia" size="3" id="materia">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td><button type="button" onclick="">Borrar materia</button></td>
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
                            <select name="materia" size="3" id="categoria">
                                <option>Física</option>
                                <option>Geografía</option>
                                <option>Historia</option>
                                <option>Matemáticas</option>
                                <option>Redes</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
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
                            <select name="materia" size="3" id="pistas">
                                <option>Física</option>
                                <option>Geografía</option>
                                <option>Historia</option>
                                <option>Matemáticas</option>
                                <option>Redes</option>
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
        <script>
            function mostrarTemas() {
                xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange=function() {
                    if (xmlhttp.readyState==4 && xmlhttp.status==200) {
                        document.getElementById("materia").innerHTML=xmlhttp.responseText;
                    }
                }
                xmlhttp.open("GET", "ServerPanel?op=temas", true);
                xmlhttp.send();
            }
//            $(document).ready(function() {
//                $('#materia').on("click","change", function(){
//                    var value = $("#selectFecha option:selected").text();
//                    xmlhttp = new XMLHttpRequest();
//                    xmlhttp.onreadystatechange=function() {
//                        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
//                            document.getElementById("materia").innerHTML=xmlhttp.responseText;
//                        }
//                    }
//                    xmlhttp.open("POST", "ServerPanel?op=materia&value="+value, true);
//                    xmlhttp.send();
//                });
//            });
        </script>
    </body>
</html>
