
<?php

session_start();
if(!isset($_SESSION['usuario'])) 
{
  header('Location: login.php'); 
  exit();
}

?>
<?php
   include 'scripts/conexion.php';
   $username = $_SESSION['usuario'];
   $query = mysqli_query($con,"SELECT * FROM cuentas WHERE Nombre = '$username'");
    while($row = mysqli_fetch_assoc($query))
    { 
        $nombre = $row['Nombre'];
		$skin = $row['Ropa'];
		$vida = $row['Vida'];
		$chaleco = $row['Chaleco'];
		$muertes = $row['Muertes'];
		$asesinatos = $row['Asesinatos'];
		$pfaccion = $row['Faccion'];
		$prango = 'Rango'.$row['Rango'];
		$trabajo = $row['Trabajo'];
		$dinero = $row['Dinero'];
		if($row['Genero'] == 0)
		{
		$genero = 'Masculino';
		}
		else if($row['Genero'] == 1)
		{
		$genero = 'Femenino';
		}
		if($row['Trabajo'] == 0)
		{
		$trabajo = 'Ninguno';
		}
		else if($row['Trabajo'] == 1)
		{
		$trabajo = 'Trabajo 1';
		}
		else if($row['Trabajo'] == 2)
		{
		$trabajo = 'Trabajo 2';
		}
		else if($row['Trabajo'] == 3)
		{
		$trabajo = 'Trabajo 3';
		}
		if($pfaccion == 0)
		{
		$faccion = 'Ninguna';
		$rango = '-';
		}
		else
		{
		$fquery = mysqli_query($GLOBALS["___mysqli_ston"], "SELECT * FROM facciones WHERE ID = '$pfaccion'");
		while($row = mysqli_fetch_assoc($fquery))
		{ 
        $faccion = $row['Nombre'];
		$rango = $row[$prango];
    }  
	}
	}
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>PCU</title>
<link href="css/style_general.css" rel="stylesheet" type="text/css">
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css">
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
</head>

<body>

<div id="container">

  <div id="header">
  <div id="logo"></div>
  </div>
  
  <div id="nav">
    <ul id="MenuBar2" class="MenuBarHorizontal">
      <li><a href="index.php"><center>Inicio</center></a></li>
      <li><a href="configuracion.php"><center>Configuracion</center></a></li>
      <li><a href="logout.php"><center>Salir</center></a></li>
    </ul>
  </div>
  <div id="article">
  <br>
  <div id="skin">
    <img src="imagenes/skins/Skin_<?php echo $skin?>.png" width="55" height="100"> </div>
    <br>
    <center><h3>General</h3><table width="300" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td width="145" height="20"><center>Vida</center></td>
    <td width="145"><center><a style="color:#F00"><?php echo $vida?>/100</a></center></td>
  </tr>
  <tr>
    <td><center>Armadura:</center></td>
    <td><center><?php echo $chaleco?>/100</center></td>
  </tr>
  <tr>
    <td><center>Dinero</center></td>
    <td><center><a style="color:#090">$<?php echo $dinero?></a></center></td>
  </tr>
</table>
</center>
  
     <center><h3>Informacion</h3><table width="300" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td width="145" height="20"><center>Genero:</center></td>
    <td width="145"><center><?php echo $genero ?></center></center></td>
  </tr>
  <tr>
    <td><center>Trabajo:</center></td>
    <td><center><?php echo $trabajo?></center></td>
  </tr>
  <tr>
    <td><center>Muertes:</center></td>
    <td><center><?php echo $muertes?></center></td>
  </tr>
    <tr>
    <td><center>Asesinatos:</center></td>
    <td><center><?php echo $asesinatos?></center></td>
  </tr>
    </tr>
    <tr>
    <td><center>Faccion:</center></td>
    <td><center><?php echo $faccion?></center></td>
  </tr>
    </tr>
    <tr>
    <td><center>Rango:</center></td>
    <td><center><?php echo $rango?></center></td>
  </tr>
</table>
</center>
</div>
 
     <div id="footer">
     <center><a style="color: #FFF; font-family: Verdana, Geneva, sans-serif; text-align: center;">Based by: KRISSTI4N - Actual: -</a></center>
 </div>
</div>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
var MenuBar2 = new Spry.Widget.MenuBar("MenuBar2", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script>
</body>
</html>
