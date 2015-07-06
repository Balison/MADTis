<?php
	if (isset($_POST['empresa']) && $_POST['empresa'] != "Seleccione una grupo empresa"){
		renderDocListFor($_POST['empresa']);	
	}
?>
<?php

	function renderDocListFor($empresa){

		include '../Controlador/documentRetriever.php';
		include '../Modelo/conexion_pd.php';
		$con = new conexion();
        $docs = retrieveDocumentsFor(getUNameFor($empresa, $con), $con);
       
        echo "<h5><b> Documentos de la empresa $empresa: </b></h5>";

        echo "<table id = 'document-list'><tr>";
        foreach ($docs as $doc) {
        	$encoded = preg_replace('/\s+/', '-', $doc);

        	echo <<<HTML
        			<td>
        				<input class = 'docs-check' type = "checkbox" name = "docs[]" value = "$doc" encoded = "$encoded"> $doc
        			</td>
HTML;
        }

        echo "</tr></table><br><br>";

        foreach ($docs as $doc) {
        	renderObs($doc);
        }
	}

	function getUNameFor($empresa, $conexion){
		$query 		= "SELECT ge.`NOMBRE_U` FROM `grupo_empresa` AS ge WHERE ge.`NOMBRE_LARGO_GE` = '$empresa'";
        $result    	= $conexion->query($query);
        $row       	= $result->fetchObject();
        $nombreUGE 	= $row->NOMBRE_U;

        return $nombreUGE;
	}

	function renderObs($docName){
		
		$doc = preg_replace('/\s+/', '-', $docName);

		echo <<< HTML
		<div class="form-group doc-obs" id = "obs-$doc">
		    <label class="col-sm-2 control-label obs">Observaciones del documento $docName</label>
		     <a onclick="addObs('$doc', 'true')" class="link-dos" > Agregar Observacion&nbsp;&nbsp;</a><span class="glyphicon glyphicon-plus"></span>
		     
		     <div id = "obs-$doc-block" style="height: 200px;width:600px;overflow: scroll">
		     </div>
		</div>

HTML;

	}
?>    

