<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<center>
<h2>Catálogo de Carreras</h2>
<a href="form_carrera.php">agregar una carrera</a>
<table border="1">
<tr><th>clave</th><th>Descripción</th><th></th></tr>
<form action = "form_carrera.php?modo=AGREGAR method="POST">
<tr><th>Nuevo:</th>
<td><input type="text" name="txtDescrpicion" size="70" ></button></td></tr>
</form>


<?php
   $mysql = new mysqli('localhost', 'root', '', 'practica_php');
   $res = $mysql->query("SELECT * FROM carreras");
   while ($row = $res->fetch_array(MYSQLI_ASSOC))
   {
       echo "<tr>";
	   echo "<td>$row[clave]</td>";
	   echo "<td>$row[Descripcion]</td>";
	   echo "<td><img src='del.png'></td>";
	   echo "</tr>";	   
   }
   $mysql->close();
?>

</table>
<a href="index.php">regresar a index</a>
</center>