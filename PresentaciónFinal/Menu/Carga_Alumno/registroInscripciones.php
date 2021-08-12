<?php
include('../../conexion.php');

$idCarrera = $_POST['idCarrera'];
$idAlumno = $_POST['idAlumno'];
//$materia = mysqli_fetch_array($_POST['materia']);

if (isset($_POST['enviar'])) {
    if (!empty($_POST['materia'])) {
        foreach ($_POST['materia'] as $seleccion) {
            // if ($seleccion != '0') {
            $query = "INSERT INTO inscripciones (idCarrera,idMateria,idAlumno) VALUES('$idCarrera', '$seleccion[0]','$idAlumno')";
            echo mysqli_query($con, $query);
            header("Location: materiasAlumno.php");
            //}
        }
    }
}