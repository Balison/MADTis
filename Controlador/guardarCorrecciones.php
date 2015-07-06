<?php
session_start();
include '../Modelo/conexion.php';
include 'documentRetriever.php';
include '../Modelo/FileManager.php';
include 'registrar_correccion.php';

$oldmask = umask(0);
$activeUser = $_SESSION['usuario'];

$connection = new conexion();
$fileManager = new FileManager("../Repositorio/$activeUser");
$fileManager->goIntoFolder("Correcciones");

$docs = retrieveCorrectionsWithIDFor($activeUser, $_GET['ID'], $connection);
$uploaded = true;
$docsPath = array();

foreach ($docs as $aDoc){

	$uploaded = $uploaded && $fileManager->saveUploadedFile($_FILES[$aDoc[0]]['tmp_name'], "correccion-".$_FILES[$aDoc[0]]['name'], $docsPath);
}

$msg = "Las correcciones han sido guardadas.";

if (!$uploaded || !recordSavedCorrections($docs, $docsPath, $connection)){
	$msg = "Ocurrio un problema mientras se intentaba guardar su correccion.\n"
			."Por favor intente nuevamente.";
}
$id = $_GET['ID'];
echo <<< HTML
	<script type="text/javascript">
		alert('$msg');	
		location.href = "/Vista/subirCorreccion.php?id=$id";
	</script>
HTML;

$connection->cerrarConexion();
umask($oldmask);
?>