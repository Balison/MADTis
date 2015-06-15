<?php
    require_once("MenuGE.php");
?>
        <div id="page-wrapper">
 
            
            
            
            
           <div class="row">
         <div class="col-lg-12">
             <h2 class="page-header">Seleccione un Representante Legal</h2> 

             <?php

             $consSocio = $conexion->consulta("SELECT * FROM socio WHERE NOMBRE_U='$uActivo'");


             $socios = mysql_num_rows($consSocio);  

            if ($socios < 3) {

                echo '<div class="alert alert-warning">
                           <strong>Primero debe completar el registro de socios en la opcion "Anadir Socios"</strong>
                       </div>';
            }
            else
            {

            ?>

                    <div class="form-group">
                        Representante Legal:
                        <form method="POST" enctype="Multipart/form-data">
                            <select name="repLegal" class="form-control">
                                <option>Seleccione un representante legal </option>
                                <?php
                                    session_start();
                                    $idGE = $_SESSION['usuario']  ;
                                    $seleccion = "SELECT NOMBRES_S, APELLIDOS_S FROM `socio`WHERE NOMBRE_U LIKE '$idGE'";
                                    $consulta = $conexion->consulta($seleccion);

                                    while($rLegal =  mysql_fetch_array($consulta)){
                                        echo "<option>".$rLegal[0]." ".$rLegal[1]."</option>";
                                    }
                                    echo "<input type='hidden' name='idAsesor' value='$idGE'>";

                                    ?>
                            </select><br>
                             <div class   ="col-sm-8">
                                 <input class ="btn btn-primary" type="submit" value= "Aceptar" id= "aceptar" name="Aceptar" onclick ="this.form.action='../Vista/registrarRP.php?id=0'"></input> &nbsp;&nbsp;              
                            </div>
                        </form>
                    </div>

            <?php  

            }

            ?>
    </div><!--end/submit-->

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