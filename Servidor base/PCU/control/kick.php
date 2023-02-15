<?php

session_start();
if(!isset($_SESSION['usuario'])) 
{
  header('Location: login.php'); 
  exit();
}

?>

<?php
include '../scripts/conexion.php';

$username = $_SESSION['usuario'];
require("SampRcon.class.php");
$host = "ip";
$puerto = "puerto";
$rcon_pass = "contraseña";
$query = new SampRcon($host,$puerto,$rcon_pass); 
if ($query->connect()) 
{
$query->kick("$username");
header('Location: ../configuracion.php'); 
}
else
{
echo "El servidor se encuentra apagado.<br />";
}
$query->close();
?>
