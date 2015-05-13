<?php
	session_start();
	require_once("../Controlador/validacionDeAcceso.php");
	validar_permisos('asesor');
	
	include '../Modelo/conexion.php';

	$conect = new conexion();
	$userAct = $_SESSION['usuario'];

	if(isset($_POST["enviar"])){
		$destino = $_POST["Conocido"];
		$titulo = $_POST["campoTitulo"];
		$desDoc = $_POST["campoDescripcion"];
		$fechap = $_POST["fecha1"];
		$horap  = $_POST["hora1"];
		$rutap  = $_POST["recurso"];
		date_default_timezone_set("America/La_Paz");
		$fecha  = date('Y-m-d');
		$hora   =  date("G:H:i");
		$destinoG = "Ningun";

		if($destino == "Publico")
			$destinoG = "PUBLICO";
		else{
			if ($destino == "Grupo Empresa") {
				$grupoEmp = $_POST["grupoempresa"];	
				switch ($grupoEmp) {
					case "Seleccione Grupo Empresa":
						echo"<script type=\"text/javascript\">alert('No seleccion\u00f3  Grupo Empresa'); window.history.back();</script>";
						break;
					
					case "TODOS":
						$destinoG = "Todas las Grupo Empresas";
						break;

					default:
						$destinoG = $grupoEmp;	
						break;
				}
			}
			else{
				if ($destino == "Proyectos") {
					$proyecto = $_POST["proyecto"];
					switch ($proyecto) {
					case "Seleccione Proyecto":
						echo"<script type=\"text/javascript\">alert('No seleccion\u00f3  proyecto'); window.history.back();</script>";
						break;
					
					case "TODOS":
						$destinoG = "Todos los Proyectos";
						break;

					default:
						$destinoG = $proyecto;		
						break;
				}
			}
			else
				echo"<script type=\"text/javascript\">alert('No seleccion\u00f3 receptor'); window.history.back();</script>";		
			}
		}

		if($destinoG == "Ningun")
			header("location:../Vista/publicar_asesor.php");
		else{
			$comentario_add = $conect->consulta("INSERT INTO registro (NOMBRE_U,TIPO_T,ESTADO_E,NOMBRE_R,FECHA_R,HORA_R) 
			VALUES ('$userAct','publicaciones','Habilitado','$titulo','$fecha','$hora')")or die("Error al s");

			$query = $conect->consulta("SELECT MAX(ID_R) AS 'ID_R' FROM registro");
			if ($row = mysql_fetch_row($query)) {
				$idDoc = trim($row[0]);
			}
	 	
	 		$guardar_doc = $conect->consulta("INSERT INTO documento (ID_R,TAMANIO_D,RUTA_D,VISUALIZABLE_D,DESCARGABLE_D)
			VALUES('$idDoc','1024','$rutap','1','1')");
			$des_D = $conect->consulta("INSERT INTO descripcion (ID_R,DESCRIPCION_D)
			VALUES('$idDoc','$desDoc')");
			$destinatario = $conect->consulta("INSERT INTO receptor (ID_R,RECEPTOR_R)
			VALUES('$idDoc','$destinoG')");
			$guardar = $conect->consulta("INSERT INTO periodo (ID_R,fecha_p,hora_p) 
			VALUES ('$idDoc','$fechap','$horap')") or die("Error al s");

			header("location:../Vista/publicaciones.php");   
		} 
	}
?>