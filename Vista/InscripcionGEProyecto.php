<?php
    require_once("MenuGE.php");
?>
           <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Inscribirse a un proyecto </h2>
                    <div class="col-lg-4" >
                         <?php
                         
                          $seleccion = "SELECT NOMBRE_UA FROM inscripcion WHERE NOMBRE_UGE = '$uActivo'";
                          $conexionsultar = $conexion->consulta($seleccion);
                          $nombreUA = mysql_fetch_array($conexionsultar);

                          $VerificarHabilitacion = $conexion->consulta("SELECT * FROM inscripcion WHERE NOMBRE_UGE='$uActivo' AND ESTADO_INSCRIPCION='Habilitado'");
                          $Habilitacion = mysql_fetch_row($VerificarHabilitacion);

                        if(strnatcasecmp($nombreUA[0], "") != 0){

                            if(is_array($Habilitacion))
                            {        
                        ?>


                            <div class="form-group">
                                <form method="POST" <b>Proyectos disponibles :</b>
                                    <select name="proyecto" class="form-control">
                                    <option>Seleccione un proyecto</option>
                                    <?php
                                        $idGE = $_SESSION['usuario'];
                                        $seleccion = "SELECT id_g "
                                                . "FROM gestion "
                                                . "WHERE DATE (NOW()) > DATE(FECHA_INICIO_G) and DATE(NOW()) < DATE(FECHA_FIN_G)";
                                        $conexionsulta_= $conexion->consulta($seleccion);
                                        $idGestion = mysql_fetch_row($conexionsulta_);
                                        $idGestion_ = $idGestion[0];
                                                                       
                                        $seleccion = "SELECT p.`NOMBRE_P` FROM `proyecto` AS `p`, `gestion` AS `g` WHERE p.`ID_G` = g.`ID_G` AND p.`ID_G` LIKE '".$idGestion_."'";
                                 
                                        $conexionsulta = $conexion->consulta($seleccion);
                
                                        while($proyecto =  mysql_fetch_array($conexionsulta)){
                                            echo "<option>".$proyecto[0]."</option>";
                                        }
                                    echo "<input type='hidden' name='idGE' value='$idGE'>";
            
                                    ?>
                                     </select><br>
                                    <br>
                                    <input type='hidden' name='ge' value=<?php echo $uActivo; ?>>
                                    <div class="form-group">
                                        <button type="submit" name="submit" class="btn btn-primary" onclick="this.form.action='RegistrarProyectoGE.php'">  <span class="glyphicon glyphicon-ok"></span> Aceptar</button>
                                   </div>       
                                </form>
                            </div>
                        <?php
                            }
                            else
                            {
                                echo '<div class="alert alert-warning">
                                     <strong>Su inscripcion no ha sido habilitada</strong>
                                    </div>';

                            }
                        }
                          else
                          {
                               echo '<div class="alert alert-warning">
                                     <strong>Primero debe inscribirse con un asesor, en la opcion de "Seleccionar asesor"</strong>
                             </div>';
                          }
                        ?>
                        
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
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