<?php

session_start();
if(!isset($_SESSION['usuario'])) 
{
  header('Location: login.php'); 
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
  <center>
  <br>
  <h3>Contraseña</h3>
  <form action="configuracion/contra.php" method="post">
  <table width="354" border="0">
  <tr>
    <td width="197">Contraseña actual:</td>
    <td width="139"><input name="contraactual" type="password"></td>
  </tr>
  <tr>
    <td>Nueva contraseña</td>
    <td><input name="contranueva" type="password"></td>
  </tr>
  <tr>
    <td>Confirmar contraseña</td>
    <td><input name="contraconf" type="password"></td>
  </tr>
  <tr>
    <td></td>
    <td><input type="hidden" name="usuario" value="<?php  echo $username; ?>"/>
    <center><input name="btn-cambiarcontra" type="submit" value="Cambiar"></td>
  </tr>
</table></form>
<br>
<hr width="600" align="center" color="#CCC">
<h3>El juego</h3>
    <form action="control/kick.php" method="post">
    
    <button name="btn-comprar">Desconectarse</button>
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
