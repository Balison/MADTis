<?php  
    session_start();
    require_once("../Controlador/validacionDeAcceso.php");
    validar_permisos('asesor');
    $uActivo = $_SESSION['usuario'];
    include '../Modelo/conexion.php';  
    $conectar=new conexion();

 ?> 

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Sistema de Apoyo a la Empresa TIS</title>



    <script type="text/javascript" src="../Librerias/lib/jquery-2.1.0.min.js"></script>
    <!-- icheck -->

    <link href="../Librerias/icheck/skins/square/green.css" rel="stylesheet">
    <script src="../Librerias/lib/icheck.min.js"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="../Librerias/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="../Librerias/lib/bootstrap.js"></script>
    <!-- Docs -->
    <link rel="stylesheet" type="text/css" href="../Librerias/lib/css/docs.css">
    <!-- Font-Awesome -->
    <link rel="stylesheet" type="text/css" href="../Librerias/font-awesome/css/font-awesome.css">
    <!-- Bootstrap-datetimepicker -->
    <link rel="stylesheet" type="text/css" href="../Librerias/lib/css/bootstrap-datetimepicker.css">
    <script type="text/javascript" src="../Librerias/lib/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="../Librerias/lib/bootstrap-datetimepicker.es.js"></script>
    <!-- Bootstrap-multiselect -->
    <link rel="stylesheet" type="text/css" href="../Librerias/lib/css/bootstrap-multiselect.css">
    <script type="text/javascript" src="../Librerias/lib/bootstrap-multiselect.js"></script>
    <!-- Bootstrap-validator -->
    <link rel="stylesheet" type="text/css" href="../Librerias/lib/css/bootstrapValidator.css">
    <script type="text/javascript" src="../Librerias/lib/bootstrapValidator.js"></script>
    
    <script type="text/javascript">
	$(document).ready(function(){
		$("#myModal").modal('show');
	});
</script>



</head>

    
     <body>
<div id="myModal" class="modal fade" role="dialog" data-backdrop="static" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <a href="lista_evaluacion.php" type="submit" class="close" aria-hidden="true">&times;</a>
                <h5 class="modal-title">Evaluacion </h5>
            <div class="modal-header">
     
            </div>
            <form method="post" action="modificar_fechaBD.php">
          
  
             <div class="bs-callout bs-callout-info">
                 <h4>Detalles de Evaluacion</h4>   </div>           
   <?php       

            $ID = $_GET['GE'];
            $notaFin = 0;
            $estado = ""; 
            $peticion = $conectar->consulta("SELECT f.FECHA_FR FROM  fecha_realizacion as f, registro as a WHERE f.ID_R=a.ID_R and f.ID_R='$ID'");  
            while ($fecha = mysql_fetch_array($peticion))
            {
                $fechaFin=$fecha["FECHA_FR"];  
            }    
            $peticion1 = $conectar->consulta("SELECT grupo_empresa.NOMBRE_CORTO_GE FROM grupo_empresa, registro WHERE registro.ID_R='$ID' and grupo_empresa.NOMBRE_U=registro.NOMBRE_U");
             while ($nomGE = mysql_fetch_array($peticion1))
            { 
                $nombreCorto=$nomGE["NOMBRE_CORTO_GE"];
            }              
            $peticion2 = $conectar->consulta("SELECT `NOMBRE_R` FROM `registro` WHERE `TIPO_T`='actividad planificacion' and ID_R='$ID'"); 
            while ($nomAct = mysql_fetch_array($peticion2))
            {
                $actividad=$nomAct["NOMBRE_R"];  
            }
            $peticion3 = $conectar->consulta("SELECT p.PORCENTAJE_A FROM precio AS p, registro AS u WHERE u.ID_R='$ID' and p.NOMBRE_U= u.NOMBRE_U");
             while ($porc = mysql_fetch_array($peticion3))
            { 
                $porcentajeS=$porc["PORCENTAJE_A"];
            }                  
           
           $peticion4 = $conectar->consulta("SELECT `NOMBRE_U` FROM `grupo_empresa` WHERE `NOMBRE_CORTO_GE`='$nombreCorto'");
           while ($nomU = mysql_fetch_array($peticion4))
           { 
            $usuarioGE=$nomU["NOMBRE_U"];
            }  
           
            $peticion5 = $conectar->consulta("SELECT MAX(ID_R) FROM registro WHERE `NOMBRE_R`= '$actividad' and `NOMBRE_U`='$usuarioGE'");
           while ($maxID = mysql_fetch_array($peticion5))
           { 
                $IDPago=$maxID["MAX(ID_R)"];
            } 
            $peticion6 = $conectar->consulta("SELECT `NOTA`,`ACEPTADA` FROM evaluacionElemento WHERE `ID_PAGO`='$IDPago' AND `NOMBRE_E`='$actividad'");
             while ($evaAct = mysql_fetch_array($peticion6))
            { 
                $notaAct=$evaAct["NOTA"];
                $actiAceptada=$evaAct["ACEPTADA"];
            }
            $peticion7 = $conectar->consulta("SELECT `PORCENTAJE_DEL_TOTAL_P`, `MONTO_P` FROM  pago WHERE `ID_R`='$IDPago'");  
            while ($porcen = mysql_fetch_array($peticion7))
            {
                $porcenCosto = $porcen["PORCENTAJE_DEL_TOTAL_P"];
                $montoAct = $porcen["MONTO_P"]; 
            }
            $peticion8 = $conectar->consulta("SELECT e.ENTREGABLE_P, v.NOTA, v.ACEPTADA FROM `entrega` as e, `evaluacionElemento` as v WHERE e.ID_R='$IDPago' 
                and v.ID_PAGO='$IDPago' and e.ENTREGADO_P='1' and e.ENTREGABLE_P = v.NOMBRE_E");
            $tamanio = mysql_num_rows($peticion8);
            //$entregables = mysql_fetch_array($peticion8);

            if($actiAceptada == 1)
            {
                $clase="list-group-item list-group-item-success"; 
                $puntosEva = 60 * $porcenCosto / 100;
            }
            else
            {
                $clase="list-group-item list-group-item-danger";
                $puntosEva = 0;
            }

            if($tamanio > 0)
            {  
                 $estado="Retrasado";
                 $modal="list-group-item list-group-item-danger";
                 echo '<span class="'.$modal.'">Estado: '.$estado.'</span>';
            }             
   
            
            echo '<table class="table table-hover">
            <thead>
            <tr>
            
            <th>Grupo Empresa</th>               
            <th>Actividad</th>
            <th>Fecha de Evaluaci&oacuten</th>
            <th>% Costo</th>
            <th>Monto Actividad</th>
            <th>% Satisfacci&oacuten</th>
            <th>Nota 100%</th>            
            <th>Puntos Evaluacion</th>

            </tr>
            </thead>
            <tbody>
            <th>'.$nombreCorto.'</th>            
            <th>'.$actividad.'</th>
            <th>'.$fechaFin.'</th>    
            <th>'.$porcenCosto.' %</th>
            <th>'.$montoAct.' Bs</th>
            <th>'.$porcentajeS.' %</th>  
            <th><span class="'.$clase.'">'.$notaAct.'</th>    
            <th><span class="'.$clase.'">'.$puntosEva.'</th>   
 
            </tbody>
            </table>';

            while ($entregables = mysql_fetch_array($peticion8)) {

                $nomEntregable = $entregables["ENTREGABLE_P"];
                $notaEntregable = $entregables["NOTA"];
                $acepEntregable = $entregables["ACEPTADA"];

                $peticion9 = $conectar->consulta("SELECT v.NOTA, v.NOMBRE_E, v.ACEPTADA 
                    FROM `evaluacionElemento` as v, `detalle` as d WHERE v.ID_PAGO =d.ID 
                    and d.ENTREGABLE = '$nomEntregable' and d.ID_PAGO = '$IDPago' and v.NOMBRE_E = d.NOMBRE");

                if($acepEntregable == 1)
                {
                    $clase="list-group-item list-group-item-success"; 
                }
                else
                {   
                    $clase="list-group-item list-group-item-danger";
                }

                echo '<table class="table table-hover">
                <thead>
                <tr>
                
                <th>Entregable</th>   
                <th>Nota 100%</th>        

                </tr>
                </thead>
                <tbody>
                <td>'.$nomEntregable.'</td>              
                <td><span class="'.$clase.'">'.$notaEntregable.'</td> 
     
                </tbody>
                </table>';

                if(mysql_num_rows($peticion9) > 0){
                    echo '<table class="table table-hover">
                    <thead>
                    <tr>
                    
                    <th>Detalle</th>   
                    <th>Nota 100%</th>        

                    </tr>
                    </thead>
                    <tbody>';

                    while ($detalles = mysql_fetch_array($peticion9)) {
                        $nomDetalle = $detalles["NOMBRE_E"];
                        $notaDetalle = $detalles["NOTA"];
                        $acepDetalle = $detalles["ACEPTADA"];

                        if($acepDetalle == 1)
                        {
                            $clase="list-group-item list-group-item-success"; 
                        }
                        else
                        {   
                            $clase="list-group-item list-group-item-danger";
                        }

                        echo '<tr><td>'.$nomDetalle.'</td>
                        <td><span class="'.$clase.'">'.$notaDetalle.'</td></tr>';
                    }
                    echo '</tbody></table>';
                }
            } 
                     
 ?>
            <div class="modal-footer">
                <a href="lista_evaluacion.php" class="btn btn-default btn-primary "  type="submit" >Aceptar</a>  

 
            </div>
            </form>  

                
        </div>
    </div>
    </div>
</div>
</body>   

</html>             

                      		