<?php
include 'scripts/conexion.php';

$usuario = $_POST["user"];   
$password = $_POST["pass"];
 

$result = mysqli_query($con,"SELECT * FROM cuentas WHERE Nombre = '$usuario'");
if($row = mysqli_fetch_array($result))
{     

 if($row["Contra"] == $password)
 {
  session_start();
  $_SESSION['usuario'] = $usuario;
  header("Location: index.php");  
 }
 else
 {
	 echo 'Contra incorrecta';
             
 }
}
else
{
	echo 'no existes';
}
mysqli_free_result($result);
mysqli_close($con);
?>