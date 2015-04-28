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
