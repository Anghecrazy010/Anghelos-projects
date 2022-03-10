<meta http-equiv="Content-type" content="text/html; charset=utf-8" />

<?php
switch($_GET['modo'])
{

case "Agregar" :
$mysql = new mysql ('localhost','root', 'practica_php');
$mysql->query ("INSERT INTO carreras" .
"SET Descripcion = '$_POST(txtDescripcion)'");
$myssql->close();
header("Location:cat_carreras.php");
break;

case "MODIFICAR" :
break;
}
?>
