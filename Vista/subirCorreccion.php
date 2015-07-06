<?php

    require_once("MenuGE.php");
    require_once("../Controlador/documentRetriever.php");
?>    
        <div id="page-wrapper">

            
            
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Subir Correcciones</h2>
                    <div class="col-lg-6" >
                        
                        <?php
                        $selAsesor = $conexion->consulta("SELECT NOMBRE_UA FROM inscripcion WHERE NOMBRE_UGE='$uActivo'");
                        $Asesor = mysql_fetch_row($selAsesor);

                        date_default_timezone_set('America/La_Paz');
                        $horaAct = date("H:i:s");
                        $fechaAct = date('Y-m-j');
                              
                        $id_correccion = $_GET['id'];
                        
                        $consFechas = $conexion->consulta("SELECT FECHA_INICIO_PL, FECHA_FIN_PL, HORA_INICIO_PL, HORA_FIN_PL FROM registro, correccion_r, plazo WHERE correccion_r.ID_R = plazo.ID_R AND correccion_r.ID_R = registro.ID_R AND correccion_r.GRUPO_EMPRESA = '$uActivo' AND correccion_r.ID_R = $id_correccion");

                        $fechas = mysql_fetch_row($consFechas);

                        $stampHoraA = strtotime($horaAct);
                        $stampFechaA = strtotime($fechaAct);
                        $stampHoraI = strtotime($fechas[2]);
                        $stampHoraF = strtotime($fechas[3]);
                        $stampFechaI = strtotime($fechas[0]);
                        $stampFechaF = strtotime($fechas[1]);


                        if(alreadyUploadedCorrections($id_correccion, $conexion))
                        {
                              
                              echo '<div class="alert alert-warning">
                                        <strong>Usted ya ha subido las correcciones correspondientes</strong>
                                    </div>';
                        }
                        else
                        {

                            //verifica que la fecha actual se encuentre dentro del periodo permitido para subir la correccion
                            if (($stampFechaA == $stampFechaI and $stampHoraA < $stampHoraI) or ($stampFechaA ==$stampFechaF and $stampHoraA > $stampHoraF) or ($stampFechaA < $stampFechaI) or ($stampFechaA > $stampFechaF)) {

                        
                                echo '<div class="alert alert-warning">
                                            <strong>El periodo para subir correcciones ha vencido.</strong>
                                        </div>';
                            }
                            else
                            {
                               
                                    echo '<div class="alert alert-warning">';

                                    echo '<strong>La entrega esta disponible desde la fecha '.$fechas[0].' a horas '.$fechas[2].' hasta la fecha '.$fechas[1].' a horas '.$fechas[3].'</strong><br><br>';
                                    echo '<strong>Una vez subidos los documentos no se podran realizar correcciones</strong>';
                                    echo '</div>';

                                    $correcciones = retrieveCorrectionsWithIDFor($uActivo, $id_correccion, $conexion);
                                    require ("_subirCorreccion.php"); //aca esta el generador de inputs

                                    echo "<form action='/Controlador/guardarCorrecciones.php?ID=$id_correccion' method='POST' enctype='multipart/form-data'>";

                                    foreach($correcciones as $correccion){
                                        renderInputFieldset($correccion[0], $correccion[1]);
                                    }

                                    echo '<div class="form-group">
                                            <input type="submit" value="Subir Correcciones" class= "btn btn-primary">
                                          </div>';

                                    echo "</form>";     
                            }    
                        }  
            
                        ?>
                        
                        
                       
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Core Scripts - Include with every page -->
    
    <!--script src="../Librerias/js/bootstrap.min.js"></script-->
    <script src="../Librerias/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- SB Admin Scripts - Include with every page -->
    <script src="../Librerias/js/sb-admin.js"></script>

</body>

</html><!DOCTYPE html>