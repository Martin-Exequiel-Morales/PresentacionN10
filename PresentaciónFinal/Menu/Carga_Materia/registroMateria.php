<?php


include("../../conexion.php");
//$conexion = mysqli_connect('localhost', 'root', '', 'sistema_encuestasv1');

$nombre = $_POST['nombre']; //names de los inputs
$carrera = $_POST['carrera'];
$profesor = $_POST['profesor'];



$query = "INSERT INTO materia (nombre,idCarrera,idProfesor) VALUES('$nombre','$carrera','$profesor')";

//$resultado = $con->query($query);
echo mysqli_query($con, $query);

    //header("Location: Menu/Carga_Alumno/Carga_Alumno.php");