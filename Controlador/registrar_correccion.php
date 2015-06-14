<?php
    function registrar_correccion($datos, $conexion){
    	$usuario = $datos['asesor'];
    	$fechaR = date('Y:m:j');
    	$horaR = date('H:i:s');
    	$fechaFinal = $datos['fecha_fin'];
    	$horaFinal = $datos['hora_fin'];
    	$grupo = $datos['grupo_empresa'];
    	$InsertarRegistro = $conexion->query("INSERT INTO registro (NOMBRE_U,TIPO_T,ESTADO_E,NOMBRE_R,FECHA_R,HORA_R) 
        	VALUES ('$usuario','documento requerido','Habilitado','Correccion','$fechaR','$horaR')");
        $SeleccionDocumentoID = $conexion->query("SELECT MAX(ID_R) FROM registro WHERE NOMBRE_U = '$usuario' AND TIPO_T = 'documento requerido'");
		if(mysql_num_rows($SeleccionDocumentoID) > 0){
		echo "<SCRIPT LANGUAGE='javascript'>". 
		            " alert('es mas de uno');".
		            " document.location=('../Vista/ordenDeCambio.php');</SCRIPT>";
		}else{
			echo "<SCRIPT LANGUAGE='javascript'>". 
		            " alert('nup');".
		            " document.location=('../Vista/ordenDeCambio.php');</SCRIPT>";
		}
		//$InsertarPlazo = $conexion->query("INSERT INTO plazo VALUES('$DocId[0]','$fechaR','$fechaFinal','$horaR','$horaFinal')");
		//$InsertarDescripcion  = $conexion->query("INSERT INTO descripcion VALUES('$DocId[0]', 'Correccion')");
		//$InsertarCorreccion = $conexion->query("INSERT INTO correccion_r VALUES('$DocId[0]', '$grupo')");

		/*if($InsertarRegistro and $InsertarPlazo and $InsertarDescripcion and $InsertarCorreccion){
			echo "<SCRIPT LANGUAGE='javascript'>". 
		            " alert('Exito, el registro de la correcion se realizo exitosamente.');".
		            " document.location=('../Vista/ordenDeCambio.php');</SCRIPT>";
		}
		else{
			echo "<SCRIPT LANGUAGE='javascript'>". 
		            " alert('Error, no se pudo solicitar la correccion $InsertarRegistro');".
		            " document.location=('../Vista/ordenDeCambio.php');</SCRIPT>";
		}*/
    }
?>