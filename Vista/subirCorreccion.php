<?php

    require_once("MenuGE.php");
?>    
        <div id="page-wrapper">

            
            
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Subir Correccion</h2>
                    <div class="col-lg-6" >
                        
                        <?php
                        $selAsesor = $conexion->consulta("SELECT NOMBRE_UA FROM inscripcion WHERE NOMBRE_UGE='$uActivo'");
                        $Asesor = mysql_fetch_row($selAsesor);

                        date_default_timezone_set('America/Puerto_Rico');
                        $horaAct = date("H:i:s");
                        $fechaAct = date('Y-m-j');

                            $verifIns= $conexion->consulta("SELECT NOMBRE_U FROM inscripcion_proyecto WHERE NOMBRE_U = '$uActivo' ");
                            $inscrip = mysql_fetch_row($verifIns);

                            if (!is_array($inscrip))
                            {
                                echo '<div class="alert alert-warning">
                                            <strong>Para subir su propuesta primero debe inscribirse a un proyecto</strong>
                                          </div>';
            
                            }
                            else{

                
                              
                                    $id_correccion = $_GET['id'];
                                    
                                    $consFechas = $conexion->consulta("SELECT FECHA_INICIO_PL, FECHA_FIN_PL, HORA_INICIO_PL, HORA_FIN_PL FROM registro, correccion_r, plazo WHERE correccion_r.ID_R = plazo.ID_R AND correccion_r.ID_R = registro.ID_R AND correccion_r.GRUPO_EMPRESA = '$uActivo' AND correccion_r.ID_R = $id_correccion");

                                    $fechas = mysql_fetch_row($consFechas);

                                    $stampHoraA = strtotime($horaAct);
                                    $stampFechaA = strtotime($fechaAct);
                                    $stampHoraI = strtotime($fechas[2]);
                                    $stampHoraF = strtotime($fechas[3]);
                                    $stampFechaI = strtotime($fechas[0]);
                                    $stampFechaF = strtotime($fechas[1]);
                                    
                                    $consDoc = $conexion->consulta("SELECT * FROM registro WHERE NOMBRE_U = '$uActivo' AND NOMBRE_R = 'Correccion'");

                                    $verifDoc = mysql_fetch_row($consDoc);
                                    
                                    $correccionesSubidas = is_array($verifDoc);

                                    if($correccionesSubidas)
                                    {
                                          
                                          echo '<div class="alert alert-warning">
                                                    <strong>Usted ya ha subido la correccion correspondiente</strong>
                                                </div>';
                                    }
                                    else

                                    {

 
                                        if (($stampFechaA == $stampFechaI and $stampHoraA < $stampHoraI) or ($stampFechaA ==$stampFechaF and $stampHoraA > $stampHoraF) or ($stampFechaA < $stampFechaI) or ($stampFechaA > $stampFechaF)) {

                                    
                                            echo '<div class="alert alert-warning">
                                                        <strong>No esta disponible la subida del documento</strong>
                                                    </div>';
                                        }
                                        else
                                        {
                                           
                                                echo '<div class="alert alert-warning">';

                                                echo '<strong>La entrega esta disponible desde la fecha '.$fechas[0].' a horas '.$fechas[2].' hasta la fecha '.$fechas[1].' a horas '.$fechas[3].'</strong>';
                                                echo '</div>';

                                                echo '
                                                    <form action="GuardarSubirDocumento.php" method="POST" enctype="multipart/form-data">
                                                        <fieldset>
                                                            <div class="form-group">
                                                                <input name="archivoA" id="archivoA" type="file" class = "btn btn-primary" required>
                                                            </div>
                                                        <input type="hidden" name="Documento" value="'."Correccion".'">
                                                            <div class="form-group">
                                                                <input type="submit" value="Subir Documento" class= "btn btn-primary">
                                                            </div>
                                                        </fieldset>
                                                        <input type = "hidden" name="Usuario" value="'.$uActivo.'"">
                                                    </form>';

                                                   
                                        }    
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