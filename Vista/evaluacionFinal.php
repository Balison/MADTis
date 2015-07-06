 <?php  
    session_start();
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
    <script src="../Librerias/js/habilitarInput.js"></script>
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
                  <h4 class="modal-title">Evaluacion Grupo Empresa</h4>
            </div>
                <form method="post" action="evaluacionFinalBD.php">
          
               <div class="bs-callout bs-callout-danger">
              <h4>Nota</h4>
               <p>
               El registro de la evaluacion de la planificacion solo se realiza una vez.
              </p>
             </div>   
  
             <div class="bs-callout bs-callout-info">
                 <h4>Nota Final</h4>            
   <?php       
           

           $_SESSION["ID"];
           $_SESSION["NombreCorto"];
           $_SESSION["Actividad"] ;
           $_SESSION["usuarioGE"] ;
           $_SESSION["IDPago"];
           $_SESSION["Porcentaje"];
           $_SESSION["tamano"];
           $_SESSION["PorcentajeSatis"];
        
           $ID=$_SESSION["ID"];
           $NombreCorto= $_SESSION["NombreCorto"];
           $Actividad=$_SESSION["Actividad"] ;
           $usuarioGE=$_SESSION["usuarioGE"]; 
           $IDPago=$_SESSION["IDPago"];
           $Porcentaje=$_SESSION["Porcentaje"];
           $tamano= $_SESSION["tamano"] ;
           $entregables = $_SESSION["Entregable"];
           $porcentajeSatis = $_SESSION["PorcentajeSatis"];

           $detalles;
           $tamDetalle = 0;

           $total = 0;

           for ($i = 0; $i < $tamano; $i++) { 
              $total += $_POST['nota'.$i];
              while($_POST['nombre-'.$i."-".$tamDetalle] != null){
                $detalles[$i]++; 
                $tamDetalle++; 
              }
              $tamDetalle = 0;
           }

           $promedio = $total / $tamano;
           $_SESSION["promedio"] = $promedio;
           $_SESSION["detalles"] = $detalles;

            echo '<table class="table table-hover">
            <thead>
            <tr>

            <th>Actividad</th>
            <th>Porcentaje pago</th>
            <th>Nota final</th>

            </tr>
            </thead>
            <tbody>
            <td>'.$Actividad.'</td>
            <td>'.$Porcentaje.'%</td>    
            <td>'.$promedio.'</td>


            </tbody>
            </table>';

            for ($i = 0; $i < $tamano; $i++) {
              echo '<table class="table table-hover">
              <thead>
              <tr>

              <th>Entregable</th>
              <th>Nota final</th>

              </tr>
              </thead>
              <tbody>'; 
              echo '<tr><td>'.$entregables[$i].'</td>
                    <td><input name="nota'.$i.'" disabled 
                    value="'.$_POST['nota'.$i].'"></input>
                    </td></tr></tbody></table>';
              if($detalles[$i] > 0){
                echo '<table class="table table-hover">
                <thead>
                <tr>
                <th>Detalle</th>
                <th>Nota</th>
                </tr>
                </thead>
                <tbody>';
                for($j = 0; $j < $detalles[$i]; $j++){
                  $nomDetalle = $_POST['nombre-'.$i."-".$j];
                  $notaDetalle = $_POST['nota-'.$i."-".$j];

                  echo '<tr><td><input name="nombre-'.$i.'-'.$j.'" 
                  disabled value="'.$nomDetalle.'"></input></td>
                  <td><input name="nota-'.$i.'-'.$j.'" 
                  disabled value="'.$notaDetalle.'"></input></td></tr>';
                }
                echo '</tbody></table>';
              }
            }?>
            </div>
            <div class="modal-footer">
                <a href="lista_evaluacion.php" class="btn btn-default btn-primary" type="submit" >Cancelar</a>  
                <button type="button" onclick="subir()" class="btn btn-primary">Guardar</button>
            </div>
            </form>  
        </div>
    </div>
    </div>
</div>
</body>   

</html>             

                      		