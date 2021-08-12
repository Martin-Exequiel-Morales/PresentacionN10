<?php
include '../../conexion.php';
?>


<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <!---<title> Responsive Registration Form | CodingLab </title>--->
    <link rel="stylesheet" href="styles_Carrera.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="../../js/popper.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <div class="container">
        <div class="title">Registro de Carrera</div>
        <div class="content">
            <form id="cargaCarrera" method="POST">
                <div class="user-details">
                    <div class="input-box">
                        <span class="details">Carrera o curso</span>
                        <input style="background:#E5E7E9;" type="text" name="nombre" placeholder="Ingrese nombre"
                            required>
                    </div>
                    <!--<div class="input-box">
                        <span class="details">Establecimiento:</span>
                        <?php
                        $query = $con->query("SELECT * FROM usuarios");
                        ?>
                        <!--SELECT DE LAS ESCUELAS CARGADAS EN BD-->
                    <!-- <select name="idEscuela">
                            <option value="0">Seleccione:</option>
                            <?php
                            while ($valores = mysqli_fetch_array($query)) {
                            ?>
                            <?php
                                echo '<option value="' . $valores['id_usuario'] . '">' . $valores['nombres'] . '</option>';
                            }
                            ?>
                        </select>
                    </div>-->

                </div>
                <div class="button">
                    <button id="btnGuardar">Agregar Carrera</button>
                </div>
        </div>
        </form>
        <div class="boton">

            <a href="../menu.php"><button style="width: 110px;padding: 5px;border-color: #000000;border-radius: 5px;"
                    class="boton"><i class="fas fa-arrow-left"></i> Volver Atrás</button></a>
        </div>

    </div>

</body>

</html>



<script type="text/javascript">
//en teoria esto es jquery
$(document).ready(function() {
    $('#btnGuardar').click(function() {
        var datos = $('#cargaCarrera')
            .serialize(); //serialize trabaja con el id del form y los names de los inputs
        //alert(datos);
        //return false;
        $.ajax({
            type: "POST",
            url: "registroCarrera.php",
            data: datos,
            success: function(r) {
                if (r == 1) {
                    alert("Agregado con exito");
                } else {
                    alert("Error al cargar");
                }
            }
        });
        //return false; //evita que se recargue y pierda los datos del form
    });

});
</script>