function mostrarTemas() {
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            document.getElementById("selectMateria").innerHTML=xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", "ServerPanel?op=temas", true);
    xmlhttp.send();
}
function mostrarCategorias(){
    var value = document.getElementById("selectMateria");
    var selectedValue = value.options[value.selectedIndex].text;
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            document.getElementById("selectCategoria").innerHTML=xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", "ServerPanel?op=categoria&value="+selectedValue, true);
    xmlhttp.send();
}
function mostrarPistas() {
    var value = document.getElementById("selectCategoria");
    var selectedValue = value.options[value.selectedIndex].text;
    var tema = document.getElementById("selectMateria");
    var selectedTema = tema.options[tema.selectedIndex].text;
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            document.getElementById("selectPista").innerHTML=xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", "ServerPanel?op=pistas&value="+selectedValue+"&tema="+selectedTema, true);
    xmlhttp.send();
}

function mostrarDetalle() {
    var value = document.getElementById("selectCategoria");
    var selectedValue = value.options[value.selectedIndex].text;
    var tema = document.getElementById("selectMateria");
    var selectedTema = tema.options[tema.selectedIndex].text;
    var pista = document.getElementById("selectPista");
    var selectedPista = pista.options[pista.selectedIndex].text;
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            document.getElementById("detallePistas").innerHTML=xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", "ServerPanel?op=detalle&value="+selectedValue+"&tema="+selectedTema+"&pista="+selectedPista, true);
    xmlhttp.send();
}

function agregarTema() {
    var form = document.getElementById("formTema");
    var tema = form.tema.value;
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            alert("Tema agregado exitosamente");
            location.reload();
        }
    }
    xmlhttp.open("GET", "ServerPanel?op=agregarTema&value="+tema, true);
    xmlhttp.send();
}

function agregarCategoria() {
    var form = document.getElementById("formCategoria");
    var categoria = form.categoria.value;
    var value = document.getElementById("selectMateria");
    var tema = value.options[value.selectedIndex].text; 
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            alert("Categoria agregada exitosamente");
            location.reload();
        }
    }
    xmlhttp.open("GET", "ServerPanel?op=agregarCategoria&tema="+tema+"&value="+categoria, true);
    xmlhttp.send();
}


function agregarPista() {
    var form = document.getElementById("formPista");
    var value = document.getElementById("selectCategoria");
    var categoria = value.options[value.selectedIndex].text;
    value = document.getElementById("selectMateria");
    var tema = value.options[value.selectedIndex].text; 
    var pista = form.pista.value;
    var puntuacion = form.valor.value;
    var respuesta = form.respuesta.value;
    
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            alert("Categoria agregada exitosamente");
            location.reload();
        }
    }
    xmlhttp.open("GET", "ServerPanel?op=agregarPista&tema="+tema+"&categoria="+categoria+"&pista="+pista+"&puntuacion="+puntuacion+"&respuesta="+respuesta, true);
    xmlhttp.send();
}

function borrarPista() {
    var pista = document.getElementById("selectPista");
    var selectedPista = pista.options[pista.selectedIndex].text;
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            alert("Pista borrada exitosamente");
            location.reload();
        }
    }
    xmlhttp.open("GET", "ServerPanel?op=borrarPista&value="+selectedPista, true);
    xmlhttp.send();
}

function borrarCategoria() {
    var categoria = document.getElementById("selectCategoria");
    var selectedCategoria = categoria.options[categoria.selectedIndex].text;
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            alert("Categoria y Pistas borrada exitosamente");
            location.reload();
        }
    }
    xmlhttp.open("GET", "ServerPanel?op=borrarCategoria&value="+selectedCategoria, true);
    xmlhttp.send();
}


function editarPista() {
    var form = document.getElementById("formPistaM");
    var value = document.getElementById("selectCategoria");
    var categoria = value.options[value.selectedIndex].text;
    value = document.getElementById("selectMateria");
    var tema = value.options[value.selectedIndex].text; 
    var pista = form.pista.value;
    var puntuacion = form.valor.value;
    var respuesta = form.respuesta.value;
    
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            alert("Pista modificada exitosamente");
            location.reload();
        }
    }
    xmlhttp.open("GET", "ServerPanel?op=editarPista&tema="+tema+"&categoria="+categoria+"&pista="+pista+"&puntuacion="+puntuacion+"&respuesta="+respuesta, true);
    xmlhttp.send();
}


function agregarTemaShow() {
    document.getElementById('popupTema').style.display = "block";
}
function agregarTemaHide() {
     document.getElementById('popupTema').style.display = "none";
}
function validarTema() {
    if(document.getElementById("tema").value == "") {
        alert("Favor de llenar los campos.");
    } else {
        document.getElementById("formTema").submit();
    }
}

function agregarCategoriaShow() {
    document.getElementById('popupCategoria').style.display = "block";
}
function agregarCategoriaHide() {
     document.getElementById('popupCategoria').style.display = "none";
}
function validarCategoria() {
    if(document.getElementById("categoria").value == "") {
        alert("Favor de llenar los campos.");
    } else {
        document.getElementById("formCategoria").submit();
    }
}

function agregarPistaShow() {
    document.getElementById('popupPista').style.display = "block";
}
function agregarPistaHide() {
     document.getElementById('popupPista').style.display = "none";
}
function validarPista() {
    if(document.getElementById("pista").value == "") {
        alert("Favor de llenar los campos.");
    } else {
        document.getElementById("formPista").submit();
    }
}

function agregarPistaShowM() {
    document.getElementById('popupPistaM').style.display = "block";
}
function agregarPistaHideM() {
     document.getElementById('popupPistaM').style.display = "none";
}
function validarPistaM() {
    if(document.getElementById("pistaM").value == "") {
        alert("Favor de llenar los campos.");
    } else {
        document.getElementById("formPistaM").submit();
    }
}