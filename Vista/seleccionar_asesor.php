<?php
    require_once("MenuGE.php");
?>
           <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Eliga un Asesor </h2>
                    <div class="col-lg-4" >
                        <?php
                          $seleccion = "SELECT REPRESENTANTE_LEGAL_GE FROM grupo_empresa WHERE NOMBRE_U = '$uActivo'";
                          $consultar = $conexion ->consulta($seleccion);
                          $repLegal = mysql_fetch_array($consultar);
                         
                          if(strnatcasecmp($repLegal[0], "") != 0){
                        ?>
                            <div class="form-group">
                                <form method="POST" action="registrar_seleccion.php"><b>Asesor :</b>
                                    <select name="asesor" class="form-control">
                                        <option>Seleccione un Asesor</option>
                                        <?php
                                                $seleccion = "SELECT a.NOMBRES_A, a.APELLIDOS_A FROM asesor AS a, usuario AS u WHERE a.NOMBRE_U = u.NOMBRE_U AND u.ESTADO_E = 'Habilitado'";
                                                $consulta = $conexion->consulta($seleccion);
                                                while($asesor =  mysql_fetch_array($consulta)){
                                                    echo "<option>".$asesor[0]. " " . $asesor[1] . "</option>";
                                                }
                                        ?>
                                    </select>
                                    <br>
                                    <input type='hidden' name='ge' value=<?php echo $uActivo; ?>>
                                    <input type='submit' class='btn btn-primary' name='registrar' value='Registrar'>
                                            
                                </form>
                            </div>
                        <?php
                          }
                          else
                          {
                               echo '<div class="alert alert-warning">
                                     <strong>Primero debe agregar socios y seleccionar un representante legal</strong>
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