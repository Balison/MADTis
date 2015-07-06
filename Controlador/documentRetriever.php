<?php
/*recibe como argumento el nombre de usuario de la grupo empresa,
	y una conexion (Objeto Conexion) a la base de datos.
	Devuelve la lista de documentos requeridos */ 
	function retrieveDocumentsFor($usuarioEmpresa, $conexion){
        $docsReq = $conexion->query("SELECT NOMBRE_R FROM registro, documento_r, inscripcion, inscripcion_proyecto WHERE inscripcion_proyecto.CODIGO_P = documento_r.CODIGO_P AND documento_r.ID_R = registro.ID_R AND inscripcion_proyecto.NOMBRE_U = '$usuarioEmpresa' AND inscripcion.NOMBRE_UGE = inscripcion_proyecto.NOMBRE_U");
        $docs=array();
        
		foreach ($docsReq as $doc) {
			$docs[] = $doc['NOMBRE_R'];
		}

		return $docs;
	}

	/*
	Recibe el nombre de usuario de una grupo empresa, un id de 
	correccion y una conexion (/Modelo/conexion.php) a la base de datos.

	Devuelve la lista de los documentos observados que requiren 
	ser corregidos
	*/

	function retrieveCorrectionsFor($usuarioEmpresa, $id, $conexion){
		$docsToCorrect = $conexion->consulta("SELECT NOMBRE_CORRECCION FROM correcciones, correccion_r WHERE "
										 ."correcciones.ID_R = correccion_r.ID_R AND correcciones.ID_R = $id AND "
										 ."correccion_r.GRUPO_EMPRESA = '$usuarioEmpresa'");
		$docs = array();

		while ($doc = mysql_fetch_row($docsToCorrect)){
			$docs[] = $doc[0];
		}

		return $docs;
	}

	function retrieveCorrectionsWithIDFor($usuarioEmpresa, $id, $conexion){
		$docsToCorrect = $conexion->consulta("SELECT ID, NOMBRE_CORRECCION FROM correcciones, correccion_r WHERE "
										 ."correcciones.ID_R = correccion_r.ID_R AND correcciones.ID_R = $id AND "
										 ."correccion_r.GRUPO_EMPRESA = '$usuarioEmpresa'");
		return collect($docsToCorrect, function(&$list, &$var){
			$list[] = $var;
		});
	}

	function retrieveCorrectionsPaths($uEmpresa, $connection){
		$query = "SELECT NOMBRE_CORRECCION, RUTA 
				  FROM documentos_corregidos, correcciones, correccion_r 
				  WHERE documentos_corregidos.ID_C = correcciones.ID 
				  AND correcciones.ID_R = correccion_r.ID_R 
				  AND correccion_r.GRUPO_EMPRESA = '$uEmpresa'";
		$docsAndPaths = $connection->consulta($query);

		return collect($docsAndPaths, function(&$list, &$var){
			$list[$var[0]] = $var[1];
		});
	}

	//collects all rows from $mysqlResult as specified by $aFunction

	function collect($mysqlResult, $aFunction){
		$res = array();

		while ($aObject = mysql_fetch_row($mysqlResult)){
			$aFunction($res, $aObject);
		}

		return $res;
	}

	function alreadyUploadedCorrections($id, $connection){
		return $connection->consultaUnDato("SELECT COUNT(*) 
											FROM 
											correcciones, documentos_corregidos 
											WHERE 
											correcciones.ID = documentos_corregidos.ID_C 
											and correcciones.ID_R = $id") != 0;
	}					
?>