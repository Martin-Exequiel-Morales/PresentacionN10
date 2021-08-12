<?php

// Incluir archivo de conexión a base de datos
include("../../conexion.php");

// Establecemos la zona horario
date_default_timezone_set("America/Lima");
$date = new DateTime();
$fecha_inicio = $date->format('Y-m-d H:i:s');

// Obtener valores
$carrera     = $_POST['carrera'];
$materia     = $_POST['materia'];

$query = "SELECT id_encuesta FROM encuestas ORDER BY id_encuesta DESC LIMIT 1";

$resultado = $con->query($query);

$id = mysqli_fetch_array($resultado);
$id = (int)$id[0] + 1;

$query = "INSERT INTO filtro_encuesta (id_encuesta_filtro, carrera, materia) VALUES ('$id', '$carrera','$materia')";
$resultado = $con->query($query);