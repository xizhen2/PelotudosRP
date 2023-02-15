<?php

session_start();
if(isset($_SESSION['usuario'])) 
{
  header('Location: index.php'); 
  exit();
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
  <div id="logo">
  </div>
  </div>
  
  <div id="nav">
    <ul id="MenuBar2" class="MenuBarHorizontal">
      <li><a href="index.php"><center>Inicio</center></a></li>
      <li><a href="configuracion.php"><center>Configuracion</center></a></li>
      <li><a href="logout.php"><center>Salir</center></a></li>
    </ul>
  </div>
  <div id="article">
  <center><h2>Ingreso</h2>
  <br>
  <br>
<form action="verificar.php" method="post">
	<table>
		<tr>
			<td>Usuario:</td>
			<td><input type="text" name="user" required></td>
		</tr>
		<tr>
			<td>Contraseña:</td>
			<td><input type="password" name="pass" required></td>
		</tr>
		<tr>
			<td colspan="2"><center><input type="submit" value="Iniciar Sesión" name="iniciar"></center></td>
			
		</tr>
	</table>
</form>
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
