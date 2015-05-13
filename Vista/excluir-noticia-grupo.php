<?php

session_start();

require_once("../Controlador/validacionDeAcceso.php");
validar_permisos('grupoEmpresa'); 
 
include '../Modelo/conexion.php';
$conect = new conexion();
$noticia = $_GET['id'];



$delComen = $conect->consulta("DELETE FROM comentarios WHERE   ID_N= '$noticia'");
$delNoti = $conect->consulta("DELETE FROM noticias WHERE   ID_N= '$noticia'");

?>

<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">

alert ("Tema eliminado con exito.")

</SCRIPT>
<script>
  location.href="lista-de-noticias-grupo.php";
</script>