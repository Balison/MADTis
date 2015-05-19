<?php
	
	/*
	* Esta funcion valida que el tipo de usuario enviado como parametro
	* sea el mismo que ha iniciado sesion en el sistema.
	* El tipo de usuario puede ser:
	* administrador
	* grupoEmpresa
	* asesor
	* publico
	* 
	* Incluir este archivo despues de la llamada a session_start();
	*
	*/

	function validar_permisos($tipo_usuario = 'publico'){
		if ($_SESSION['tipoUsuario'] != $tipo_usuario){
			header("HTTP/1.1 403 Unauthorized");
			
			include('../403.html');
			exit;
		}
	}
?>