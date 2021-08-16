<html>

<head>
    <title></title>
    <link href="https://fonts.googleapis.com/css?family=Baloo+Bhaina" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>

<body>
    <center><strong><label class="titulo">IMPORTAR materias .CSV</label></strong></center>
    <p>
    <form action="subirMaterias.php" method="POST" enctype="multipart/form-data">
        <center>
            <table>
                <tr>
                    <td class="letra" width="250"><strong>Subir materias:</strong></td>
                    <td><input type="file" name="foto" id="foto"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="enviar" value="SUBIR" class="boton"></td>
                </tr>
            </table>
        </center>
    </form>

</body>

</html>