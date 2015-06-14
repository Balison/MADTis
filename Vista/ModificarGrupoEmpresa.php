<?php
 require_once("MenuGE.php");


 ?>            
            
   <!-- --------------------------------------------------------------------------------------------------------- --->          
            
         <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Modificar Informacion Personal</h2>
                </div>
            </div>
             
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default" id="configuracionFechas">
                        <div class="panel-body"> 
                            
                                    <?php
                                        $nLargo;
                                        $nCorto;
                                        $correo;
                                        $telefono;
                                        $direccion;
                                        $contrase;
                                        $peticion = $conexion->consulta("SELECT G.NOMBRE_LARGO_GE, G.NOMBRE_CORTO_GE, U.CORREO_ELECTRONICO_U, U.TELEFONO_U, G.DIRECCION_GE, U.PASSWORD_U
                                                    FROM grupo_empresa G, usuario U WHERE G.NOMBRE_U=U.NOMBRE_U AND U.NOMBRE_U='$uActivo'");         
                                        while($fila = mysql_fetch_array($peticion))
                                        {
                                            $nLargo = $fila["NOMBRE_LARGO_GE"];
                                            $nCorto = $fila["NOMBRE_CORTO_GE"];
                                            $correo = $fila["CORREO_ELECTRONICO_U"];
                                            $telefono = $fila["TELEFONO_U"];
                                            $direccion = $fila["DIRECCION_GE"];
                                            $contrase = $fila["PASSWORD_U"];
                                        }
                                   ?>       
                            
                                    <form method = "post" id="FormularioRegistroUsuarioGE">
                                       
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                  <span class="glyphicon glyphicon-user"></span>
                                                </span>
                                                <input class="form-control" type="text" name="nombreU" id="nombreU" value="<?php echo $uActivo?> " readonly="readonly" pattern="\b[a-zA-z]{5}[a-zA-z0-9]{0,9}" title="Minimo 5 y Maximo 14 caracteres...Ejm: Bittle123, Bitle" required>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                  <span class="glyphicon glyphicon-lock"></span>
                                                </span>
                                                <input class="form-control" type="text" name="contrasena1" id="contrasena1" value="<?php echo $contrase ?>" minlength="8" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$" title="Ingrese una contraseña segura, debe tener como minimo 8 caracteres y como maximo 15, al menos una letra mayuscula, una minuscula, un numero y un caracter especial" required>
                                            </div>
                                        </div>
                                        <br> </br>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                  <span class="glyphicon glyphicon-user"></span>
                                                </span>
                                                <input class="form-control" type="text" name="nombreL" id="nombreL" value="<?php echo $nLargo ?>"readonly="readonly" minlength="3" pattern=".{3,}" title="Nombre largo muy corto" required  onkeypress="return validarLetras(event)">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                  <span class="glyphicon glyphicon-user"></span>
                                                </span>
                                                <input class="form-control" type="text" name="nombreC" id="nombreC" value="<?php echo $nCorto ?>" readonly="readonly" minlength="3" pattern=".{3,}" title="Nombre corto muy corto" required  onkeypress="return validarLetras(event)">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                  <span class="glyphicon glyphicon-envelope"></span>
                                                </span>
                                                <input class="form-control" type="email" name="correo" id="correo" value="<?php echo $correo ?>" pattern="^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$" title="Ingrese un correo correcto" required  onkeypress="return validarEmail(event)">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                  <span class="glyphicon glyphicon-earphone"></span>
                                                </span>
                                                <input class="form-control" type="text" name="telefono" id="telefono" value="<?php echo $telefono?>" title="Ejm: 4022371" pattern="\b[4][0-9]{6}"  required  onkeypress="return validarNumeros(event)">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                  <span class="glyphicon glyphicon-envelope"></span>
                                                </span>
                                                <input class="form-control" type="text" name="direccion" id="direccion" value="<?php echo $direccion ?>" required>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                             <button type="submit" name="submit" class="btn btn-primary" onclick="this.form.action='ModificarGE.php'">  <span class="glyphicon glyphicon-ok"></span> Actualizar</button>
                                        </div>
                                        
                                    </form>   
                                    <div id="panelResultado">
      
                                    </div>  
                        </div><!-- /.panel -->
                    </div>
                <!-- /.col-lg-6 -->      
                </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-8 -->
                </div>
            </div><!-- /.row -->
            
        </div><!-- /#page-wrapper --> 
            
            
            
            
         
    </div>
    <!-- /#wrapper -->
    <!-- Core Scripts - Include with every page -->
    
    <!--script src="../Librerias/js/bootstrap.min.js"></script-->
    <script src="../Librerias/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <!-- SB Admin Scripts - Include with every page -->
    <script src="../Librerias/js/sb-admin.js"></script>
</body>
</html><!DOCTYPE html>