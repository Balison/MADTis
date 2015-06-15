<?php
    require_once("MenuGE.php");
?>
        <div id="page-wrapper">

   
            
         
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Registrar Socio</h2>
                    <div class="col-lg-6" >
                        <form name="agregarSocio" role=form" method="post" enctype="multipart/data-form">
                            <div class="form-group">
                                
                                
                                    <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                  <span class="glyphicon glyphicon-user"></span>
                                                </span>
                                                <input class="form-control" type="text" name="nombre" id="nombre" placeholder="Nombre" minlength="3" pattern=".{3,}" title="Nombre muy corto" required  onkeypress="return validarLetras(event)">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                  <span class="glyphicon glyphicon-user"></span>
                                                </span>
                                                <input class="form-control" type="text" name="apellido" id="apellido" placeholder="Apellido" minlength="4" pattern=".{4,}" title="Apellido muy corto" required  onkeypress="return validarLetras(event)">
                                            </div>
                                        </div>
                                        
                                
                                
                                        
                                <button type="submit" onclick="this.form.action='registrarSocio.php'" class="btn btn-primary"> <span class="glyphicon glyphicon-ok"></span> Registrar</button>
                                
                                
                            </div>
                        </form>

                        <?php 

                        $consSocios = $conexion->consulta("SELECT * FROM socio WHERE NOMBRE_U='$uActivo'");

                        $socios = mysql_num_rows($consSocios);

                        if($socios < 3)
                        {
                            echo '<div class="form-group">
                                    <div class="alert alert-warning">
                                        <strong>* Recuerde que debe registrar al menos 3 socios</strong>
                                    </div>
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