 <?php  
    session_start();
    $uActivo = $_SESSION['usuario'];
    include '../Modelo/conexion.php';  
    $conectar=new conexion();
    
           $_SESSION["ID"];
           $_SESSION["NombreCorto"];
           $_SESSION["Actividad"] ;
           $_SESSION["usuarioGE"] ;
           $_SESSION["IDPago"];
           $_SESSION["Puntaje"];
           $_SESSION["tamano"] ;
           $_SESSION["promedio"] ;
           $_SESSION["Entregable"];
           $_SESSION["PorcentajeSatis"];
           $_SESSION["detalles"];
        
           $ID=$_SESSION["ID"];
           $NombreCorto= $_SESSION["NombreCorto"];
           $Actividad=$_SESSION["Actividad"] ;
           $usuarioGE=$_SESSION["usuarioGE"]; 
           $IDPago=$_SESSION["IDPago"];
           $Porcentaje=$_SESSION["Porcentaje"];
           $tamano= $_SESSION["tamano"] ;
           $promedio= $_SESSION["promedio"] ;
           $entregables = $_SESSION["Entregable"];
           $porcentajeSatis = $_SESSION["PorcentajeSatis"];
           $detalles = $_SESSION["detalles"];


            date_default_timezone_set('America/La_Paz');
            $fechaAct = date('Y-m-j');

            $peticion1= $conectar->consulta("SELECT f.FECHA_FR FROM  fecha_realizacion as f, registro as a WHERE f.ID_R=a.ID_R and f.ID_R='$ID'");  
            while ($fecha = mysql_fetch_array($peticion1))
            {
                $fechaFin=$fecha["FECHA_FR"];  
            }           
            
            $stampFechaA = strtotime($fechaAct);
            $stampFechaF = strtotime($fechaFin);

           $acepA = 1;

           for($i = 0; $i < $tamano; $i++){
            $notaE = $_POST["nota".$i];
            $nombreE = $entregables[$i];
            $acepE = 1;

            if($stampFechaA > $stampFechaF){
              $conectar->consulta("UPDATE entrega SET `ENTREGADO_P` = '1' WHERE `entrega`.`ID_R` = '$IDPago' AND `entrega`.`ENTREGABLE_P` = '$nombreE'");  
            } 

            if($detalles[$i] > 0){
              for($j = 0; $j < $detalles[$i]; $j++){
                $nomDetalle = $_POST['nombre-'.$i."-".$j];
                $notaDetalle = $_POST['nota-'.$i."-".$j];

                $acepD = ($notaDetalle >= $porcentajeSatis) ? 1 : 0; 

                $conectar->consulta("INSERT INTO detalle (`ID`, `ID_PAGO`, `NOMBRE`, `ENTREGABLE`)
                  VALUES (NULL, '$IDPago', '$nomDetalle', '$nombreE')");

                $peticion = $conectar->consulta("SELECT MAX(ID) FROM detalle");
                $maxI = mysql_fetch_array($peticion);
                $maxID = $maxI["MAX(ID)"];

                $conectar->consulta("INSERT INTO evaluacionElemento (`ID`, `ID_PAGO`, `NOTA`, `NOMBRE_E`, `ACEPTADA`, `TIPO`) 
                VALUES (NULL, '$maxID', '$notaDetalle', '$nomDetalle', '$acepD', 'Detalle')");

                if($acepD == 0){
                  $acepE = 0;
                  $acepA = 0;
                }
              }
            }
            else{
              $acepE = ($notaE >= $porcentajeSatis) ? 1 : 0;
              if($acepE == 0)
                $acepA = 0;
            }

            $conectar->consulta("INSERT INTO evaluacionElemento (`ID`, `ID_PAGO`, `NOTA`, `NOMBRE_E`, `ACEPTADA`, `TIPO`) 
            VALUES (NULL, '$IDPago', '$notaE', '$nombreE', '$acepE', 'Entregable')");
           }

            $conectar->consulta("INSERT INTO evaluacionElemento (`ID`, `ID_PAGO`, `NOTA`, `NOMBRE_E`, `ACEPTADA`, `TIPO`) 
            VALUES (NULL, '$IDPago', '$promedio', '$Actividad', '$acepA', 'Actividad')");
 
          
          echo '<script type="text/javascript">alert("La evaluacion se guardo exitosamente"); window.location="lista_evaluacion.php";</script>';
 ?> 

                      		