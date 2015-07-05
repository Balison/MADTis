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
		//return array("hola", "esta", "es", "una", "prueba");
	}
?>																																																									