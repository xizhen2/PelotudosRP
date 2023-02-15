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
<link href="../css/style_general.css" rel="stylesheet" type="text/css">
<link href="../SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css">
<script src="../SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
</head>

<body>

<div id="container">

  <div id="header">
  <div id="logo">
  </div>
  </div>
  
  <div id="nav">
    <ul id="MenuBar2" class="MenuBarHorizontal">
      <li><a href="../index.php"><center>Inicio</center></a></li>
      <li><a href="../configuracion.php"><center>Configuracion</center></a></li>
      <li><a href="../logout.php"><center>Salir</center></a></li>
    </ul>
  </div>
  <div id="article"><center>
  <?php
include '../scripts/conexion.php';

$username = $_SESSION['usuario'];
  

$usuario = $_POST['usuario']; 
$password = $_POST["contraactual"];
$nuevacontra = $_POST["contranueva"];
$confpass = $_POST["contraconf"];
 
if (isset($_POST["btn-cambiarcontra"]))
{
$result = mysqli_query($GLOBALS["___mysqli_ston"], "SELECT * FROM `cuentas` WHERE Nombre = '$username'");
if($row = mysqli_fetch_array($result))
{     

 if($row["Contra"] == $password)
 {
	 if($nuevacontra == $confpass)
	 {
	 echo '<br>Has cambiado tu contraseña.';
	 echo '<br>';
	 echo '<br>Si no eres redirigido automaticamente <a href="../index.php">pincha aqui.</a>';
	 header("refresh: 3; ../index.php");  
	 $q = "UPDATE `cuentas` SET `Contra`='$nuevacontra' WHERE Nombre = '$username'";
	 $resultado = mysqli_query($GLOBALS["___mysqli_ston"], $q) or die (((is_object($GLOBALS["___mysqli_ston"])) ? mysqli_error($GLOBALS["___mysqli_ston"]) : (($___mysqli_res = mysqli_connect_error()) ? $___mysqli_res : false))); 
	 }
	 else
	 {
		 echo '<br>Las contraseñas no coinciden';
		 echo '<br>';
		 echo '<br>';
		 echo '<a href="../configuracion.php">Volver a intentar</a>';
	 }
 }
 else
 {
  echo 'La contraseña actual no es correcta';
  echo '<br>';
  echo '<br>';
  echo '<a href="../configuracion.php">Volver a intentar</a>';           
 }
}
else
{
echo 'Ha ocurrido un error inesperado';
echo '<br>';
echo '<br>';
echo '<a href="../configuracion.php">Volver a intentar</a>';        
}
}
((mysqli_free_result($result) || (is_object($result) && (get_class($result) == "mysqli_result"))) ? true : false);
((is_null($___mysqli_res = mysqli_close($GLOBALS["___mysqli_ston"]))) ? false : $___mysqli_res);
?></center>
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
