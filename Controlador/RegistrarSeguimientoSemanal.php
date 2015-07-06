<?php
	
require_once '../Modelo/conexion.php';

$funcion = $_POST['funcion'];
$grupoE = $_POST['grupoE'];
$conexion = new conexion();
session_start();
$uActivo = $_SESSION['usuario'];

date_default_timezone_set('America/Puerto_Rico');
$horaReg = date("H:i:s");
$fechaReg = date('Y:m:j');
$today=  date("Y-m-d");
        
	switch ($funcion) {
        case 'registrar asistencia':

        	$codigos = explode(',', $_POST['codigos']);
        	$asistencias = explode(',', $_POST['asistencias']);

        	$conexion->consulta("START TRANSACTION");

        	$insReg = $conexion->consulta("INSERT INTO registro(NOMBRE_U, TIPO_T, ESTADO_E, NOMBRE_R, FECHA_R, HORA_R)VALUES('$uActivo', 'asistencia', 'asistencia registrada', 'asistencia', '$fechaReg', '$horaReg');");

        	$selIdReg = $conexion->consulta("SELECT MAX(ID_R) FROM registro WHERE TIPO_T = 'asistencia' AND NOMBRE_U='$uActivo'");

        	$idReg = mysql_fetch_row($selIdReg);

        	for ($i = 0; $i < count($codigos); $i++) { 
        		$codigo = $codigos[$i];
				$presente = 1;
				$licencia = 0;
				if ($asistencias[$i] == 'ausente') {
					$presente = 0;
				} else {
					if ($asistencias[$i] == 'licencia') {
						$presente = 0;
						$licencia = 1;
					}
				}

				$insAsis = $conexion->consulta("INSERT INTO asistencia_semanal(id_r, grupo_as, codigo_socio_as, asistencia_as, licencia_as)VALUES('$idReg[0]','$grupoE','$codigo', '$presente', $licencia);");
			}

			if($insReg and $selIdReg and $insAsis)
			{
				$conexion->consulta("COMMIT");

			}
			else
        	{
        		$conexion->consulta("ROLLBACK");	
        	}

            break;

        case 'registrar reportes':
            

        	$roles = explode(',', $_POST['roles']);
        	$actividades = explode(',', $_POST['actividades']);
        	$hechos = explode(',', $_POST['hechos']);
        	$resultados = explode(',', $_POST['resultados']);
        	$conclusiones = explode(',', $_POST['conclusiones']);
        	$observaciones = explode(',', $_POST['observaciones']);

        	$conexion->consulta("START TRANSACTION");

        	$insReg = $conexion->consulta("INSERT INTO registro(NOMBRE_U, TIPO_T, ESTADO_E, NOMBRE_R, FECHA_R, HORA_R)VALUES('$uActivo', 'seguimiento', 'seguimiento registrado', 'revision', '$fechaReg', '$horaReg');");

        	$selIdReg = $conexion->consulta("SELECT MAX(ID_R) FROM registro WHERE TIPO_T = 'seguimiento' AND NOMBRE_U='$uActivo'");

        	$idReg = mysql_fetch_row($selIdReg);

        	for ($i = 0; $i < count($roles); $i++) { 
        		$rol = $roles[$i];
        		$actividad = $actividades[$i];
        		$hecho = 1;
        		$resultado = $resultados[$i];
        		$conclusion = $conclusiones[$i];
        		$observacion = $observaciones[$i];
				
				if ($hechos[$i] == 'no') {
					$hecho = 0;
				}

				$insSeg = $conexion->consulta("INSERT INTO seguimiento(id_r, rol_s, grupo_s, actividad_s, hecho_s, resultado_s, conclusion_s, observacion_s,fecha_s)VALUES('$idReg[0]','$rol','$grupoE', '$actividad', $hecho, '$resultado', '$conclusion', '$observacion','$fechaReg');");
			}

			if($insReg and $selIdReg and $insSeg)
			{
				$conexion->consulta("COMMIT");

			}
			else
        	{
        		$conexion->consulta("ROLLBACK");	
        	}
                
                
                
            break;
            
        case 'setActividad':
            $act=$_POST['act'];
            $rol=$_POST['rol'];
            $today=  date("Y-m-d");
            $idReg=92;
            $conexion->consulta("START TRANSACTION");
            $consulta="INSERT INTO seguimiento(id_r, rol_s, grupo_s, actividad_s, hecho_s, fecha_s) VALUES('$idReg','$rol','$grupoE', '$act', 0,'$today');";
            
            $res = $conexion->consulta($consulta);
            
            if($res)
                $conexion->consulta ("COMMIT");
            else
                $conexion->consulta ("ROLLBACK");
            
            actividades($grupoE,$today);
            break;
            
            
        case 'updateActividad':
            $id_s=$_POST['idS'];
            $res=$_POST['resultado'];
            $con=$_POST['conclusion'];
            $obs=$_POST['observacion'];
            //$pre=$conexion->consulta("SELECT * FROM seguimiento where id_s=$id_s");
            //echo "UPDATE `seguimiento` SET `HECHO_S`=1, `RESULTADO_S`='$res', `CONCLUSION_S`='$con', `OBSERVACION_S`='$obs' WHERE seguimiento.`ID_S`=$id_s";
            //if (mysql_num_rows($pre) > 0) {
            $conexion->consulta("UPDATE `seguimiento` SET `HECHO_S`=1, `RESULTADO_S`='$res', `CONCLUSION_S`='$con', `OBSERVACION_S`='$obs' WHERE seguimiento.`ID_S`=$id_s");
            //}
            
            $actEjecutados=$conexion->consulta("SELECT `ID_S`, `ROL_S`,`ACTIVIDAD_S`,`RESULTADO_S`,`CONCLUSION_S`,`OBSERVACION_S` FROM seguimiento  WHERE GRUPO_S='$grupoE' AND FECHA_S ='$today' AND HECHO_S=1");
            $ejecutarAct=$conexion->consulta("SELECT `ID_S`, `ROL_S`,`ACTIVIDAD_S`,`RESULTADO_S`,`CONCLUSION_S`,`OBSERVACION_S` FROM seguimiento  WHERE GRUPO_S='$grupoE' AND FECHA_S ='$today' AND HECHO_S=0");
            $numEjecutados= mysql_num_rows($actEjecutados);
            $numEjecutar= mysql_num_rows($ejecutarAct);
            
        
        if($numEjecutados>0 || $numEjecutar>0){
        
        echo '<fieldset><legend>Ejecucion de las actividades programadas</legend></fieldset>';
        }
        if($numEjecutados>0){
        
        echo '<h4>Actividades ejecutadas</h4>'.
        '<div class="col-md-12">'.
            '<table class="table table-striped">'.
                '<thead>'.
                    '<tr>'.
                        '<td class="col-md-1">Rol</td>'.
                        '<td class="col-md-2">Actividad</td>'.
                        '<td class="col-md-3">Resultado</td>'.
                        '<td class="col-md-3">Conclusion</td>'.
                        '<td class="col-md-3">Observacion</td>'.
                    '</tr>'.
                '</thead>'.
        '<tbody>';
                    
                    while($ejecutados =  mysql_fetch_array($actEjecutados)){
                        $id=$ejecutados[0];
                        $rol=$ejecutados[1];
                        $act=$ejecutados[2];
                        $res=$ejecutados[3];
                        $con=$ejecutados[4];
                        $obs=$ejecutados[5];
                        echo '<tr>';
                        echo '<td>'.$rol.'</td>';
                        echo '<td>'.$act.'</td>';
                        echo '<td>'.$res.'</td>';
                        echo '<td>'.$con.'</td>';
                        echo '<td>'.$obs.'</td>';
                        echo '</tr>';
                    }
                    
                echo '</tbody>'.
            '</table>'.
        '</div>';
        }
        if($numEjecutar >0){
        
        echo '<h4>Ejecutar actividades</h4>'.
        '<div class="col-md-12">'.            
            '<table class="table table-striped">'.
                '<thead>'.
                    '<tr>'.
                        '<td class="col-md-1">Rol</td>'.
                        '<td class="col-md-3">Actividad</td>'.
                        '<td class="col-md-2">Resultado</td>'.
                        '<td class="col-md-2">Conclusion</td>'.
                        '<td class="col-md-2">Observacion</td>'.
                        '<td class="col-md-2">Acciones</td>'.
                    '</tr>'.
                '</thead>'.
                '<tbody>';
                    while($ejecutar =  mysql_fetch_array($ejecutarAct)){
                        $id=$ejecutar[0];
                        $rol=$ejecutar[1];
                        $act=$ejecutar[2];
                        $res=$ejecutar[3];
                        $con=$ejecutar[4];
                        $obs=$ejecutar[5];                
                    echo '<input type="hidden" id="idS" value="'.$id.'">'.
                    '<input type="hidden" id="funcion" value="updateActividad">'.
                    '<input type="hidden" id="grupoE" value="'.$grupoE.'">';
                        echo '<tr>';
                        echo '<td>'.$rol.'</td>';
                        echo '<td>'.$act.'</td>';
                        echo '<td><textarea class="form-control" rows="3" id="resultado'.$id.'"></textarea></td>';
                        echo '<td><textarea class="form-control" rows="3" id="conclusion'.$id.'"></textarea></td>';
                        echo '<td><textarea class="form-control" rows="3" id="observacion'.$id.'"></textarea></td>';
                        echo '<td><button onclick="updActividad('.$id.')" type="button" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-ok-sign"></span></button></td>';
                        echo '</tr>';
                        
                    }
                    
            echo '</table>'.
        '</div>';
        } 
        
        break;
            
        case 'deleteActividad':
            $id_s=$_POST['idS'];
            $today=  date("Y-m-d");
            $conexion->consulta("DELETE FROM seguimiento WHERE id_s=$id_s LIMIT 1");
            actividades($grupoE,$today);
            break;
    }

    function actividades($ge,$t){
        //update ajax
        $conexion = new conexion();
        echo '<label>Actividades programadas</label><br/>';
        echo '<table class="table table-striped col-md-12">'.
                '<thead>'.
                    '<tr>'.
                        '<th class="col-md-3">Rol</th>'.
                        '<th class="col-md-6">Actividad</th>'.
                        '<th class="col-md-3">Acciones</th>'.
                    '</tr>'.
                '</thead>'.
                '<tbody>';
        $se=$conexion->consulta("SELECT `ID_S`, `ROL_S`,`ACTIVIDAD_S` FROM seguimiento WHERE seguimiento.GRUPO_S='$ge' AND seguimiento.FECHA_S ='$t'");
        //echo mysql_num_rows($se);
        while($seg =  mysql_fetch_array($se)){
            $id=$seg[0];            
            $rolGE=$seg[1];
            $actividad=$seg[2];
            echo "<tr>";
            echo '<td>'.$rolGE.'</td>';
            echo '<td>'.$actividad.'</td>';
            echo '<td><button onclick="delActividad('.$id.')" class="btn btn-xs btn-danger btnBorrarReporte"><i class="fa fa-times"></i></button></td>';
            echo "</tr>";
        }
        echo '</tbody>';
        echo '</table>';
        echo '<div class="col-md-12">'.
                '<button type="button" onclick="ejecutarSeguimiento()" class="btn btn-primary">Ejecutar Seguimiento</button>'.
            '</div>';

    }
?>