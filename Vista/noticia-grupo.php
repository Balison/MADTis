<?php 
    require_once("MenuGE.php");
?>
        <div id="page-wrapper">

            
                <div class="row">
                <div class="col-lg-12">
                       <div class="mainbar">
                                            <div class="article">
                            <h2 class="page-header" ><span>Foro</span></h2>   
                            
                        </div>
                        
                    </div>
                    
                    
                      
                       <?php
                                 $idNoti = $_GET['id'];
                               // Adiciona +1 de Visualizaciones a cada pessoa que acessar a noticia
                               $selNoti = $conexion->consulta("SELECT * FROM noticias WHERE ID_N = '$idNoti'");
                               $noticia = mysql_fetch_array($selNoti);
                               $view = $noticia['VIEWS'];
                               $views = $view + 1;
                               $actNoti = $conexion->consulta("UPDATE noticias SET VIEWS = '$views' WHERE ID_N = '$idNoti'");
                              $selNoti2 =$conexion->consulta("SELECT * FROM noticias WHERE ID_N = '$idNoti'");
                              
                             
                               while ($noticiaF=mysql_fetch_array($selNoti2)) 
                               { 
                                   $idNotic = $noticiaF["ID_N"];
                                   $autor = $noticiaF["NOMBRE_U"];
                                   $titulo = $noticiaF["TITULO"];
                                   $fecha = $noticiaF["FECHA_N"];
                                   $vistos = $noticiaF["VIEWS"];
                                   $texto = $noticiaF["TEXTO"];
                                   $posteado=$noticiaF["POSTEADO"];
                                    $selComen = $conexion->consulta("SELECT * FROM comentarios, inscripcion_proyecto, proyecto, gestion WHERE ID_N='$idNotic' and inscripcion_proyecto.NOMBRE_U = '$uActivo' and inscripcion_proyecto.CODIGO_P = proyecto.CODIGO_P and proyecto.ID_G = gestion.ID_G and DATE (FECHA_C) >= DATE(FECHA_INICIO_G) and DATE(FECHA_C) <= DATE(FECHA_FIN_G)");
                                    
                                    $tamComen = mysql_num_rows($selComen);
                                   echo"<font face='verdana' Color='Black' size='6'>$titulo</font></br></br>";
                                    echo "<font face='arial' Color='Teal' size='4'>$texto</font></br>";
                                    echo "<p><b>Postado por </b><b>$posteado</b>  <b>$fecha</b> - <font face='arial' Color='Teal' size='3'>$vistos Visualizaciones</font> | <font face='arial' Color='Teal' size='3'>$tamComen Comentarios | </font>";
                                    echo "</br>";
                                   
                         ?>
                        <div class="mainbar">
                            <div class="article">
                            <h2 ><span>Comentarios</span></h2>   
                           </div>
                       </div>
                       

                        <?php
                         }
                       $idNoti= $_GET['id'];
                       $selCom1 = $conexion->consulta("SELECT * FROM comentarios, inscripcion_proyecto, proyecto, gestion WHERE ID_N = '$idNoti' and inscripcion_proyecto.NOMBRE_U = '$uActivo' and inscripcion_proyecto.CODIGO_P = proyecto.CODIGO_P and proyecto.ID_G = gestion.ID_G and DATE (FECHA_C) >= DATE(FECHA_INICIO_G) and DATE(FECHA_C) <= DATE(FECHA_FIN_G) ORDER BY ID_N DESC");
                      
                        // muestra los valores da tabla 'comentarios'
                       while ($actualC=mysql_fetch_array($selCom1)) 
                       { 
                             $idComen = $actualC["ID_C"];
                             $autor = $actualC["NOMBRE_U"];
                             $nor = $actualC["ID_N"];
                             $textoC = $actualC["COMENTARIO"];
                             $fecha = $actualC["FECHA_C"];
                             $autor_c=$actualC["AUTOR_C"];
                       
                            echo "<font face='arial' Color='Olive' size='3'>$autor_c</font> <font face='arial' Color='Olive' size='3'>el</font><font face='arial' Color='Olive' size='3'> $fecha</font><font face='arial' Color='Olive' size='3'> comento: </font>$textoC</b></br>";
                           
                        }
                        ?>
                      
        
                    _______________________________________________________________________________________________________________________________________________________________________________________________________
                     
                    <?php
                    if (!empty($_POST) AND empty($_POST['comentario'])) 
                    {
                        echo "<font color=\"#ff0000\">Por Favor llene los campos vacios</font>";
                    }
                     else 
                     {
                                if (empty($_POST['comentario'])) { $mensage="";} else { $mensage=$_POST['comentario'];}
                                if($mensage == ""){} 
                                else {
                               // Adiciona comentario
                                     $idNoticia=$_GET['id'];
                                    $textoComen=$_POST['comentario'];
                                      $agregarC = $conexion->consulta("INSERT INTO comentarios (NOMBRE_U,ID_N,COMENTARIO,FECHA_C,AUTOR_C) VALUES ('$autor','$idNoticia', '$textoComen', NOW(), '$uActivo')");
                                  
                                   
                ?>

                <script>
                location.href="noticia-grupo.php?id=<?php echo $_GET['id']; ?>";
                </script>
                <?php
                    }
                    }
                ?>
                   <form name="input" action="noticia-grupo.php?id=<?php echo $_GET['id']; ?>" method="post">
                          <div class="form-group">
                              <label class="col-sm-2 control-label"><font face='arial' Color='Black' size='4'>Comentar:</font></label>
                                <div class="col-sm-8">
                                    <textarea class="jqte-test"  name="comentario" id="campoDescripcion" rows="10" style="overflow: auto;"></textarea>
                                </div>
                        </div>

                                <div class="form-group">
                                 <div class="col-sm-12">
                                 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; 
                                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; 
                                       <input type="submit" class="btn btn-primary" value="Enviar Comentario">
                                     </div>
                                 </div>
                </form>
                                  
                   
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Core Scripts - Include with every page -->
    
    <!--script src="../Librerias/js/bootstrap.min.js"></script-->
    <script>
    $('.jqte-test').jqte();
    var jqteStatus = true;
    $(".status").click(function()
    {
        jqteStatus = jqteStatus ? false : true;
        $('.jqte-test').jqte({"status" : jqteStatus})
    });
</script>
<script type="text/javascript">
function validarCampos(formulario) {
    var permitidos = /^[0-9a-zA-Z\s/]+$/

            //Controlar campos vacios y caracteres invalidos
            if(formulario.campoTitulo.value.length==0) {  
                formulario.campoTitulo.focus();    
                alert('Por favor, ingresa un titulo');  
                return false;  
            }
            if(!formulario.campoTitulo.value.match(permitidos)) {

                alert('Caracteres no validos:_a,¿?()*,"" ');
                return false;
            }
            if(formulario.campoDescripcion.value.length >= 1000) {
                formulario.campoDescripcion.focus();
                alert('Descripcion demasiado larga(max 1000 caracteres)')
                return false;
            }
            if(formulario.campoDescripcion.value.length==0){
                formulario.campoDescripcion.focus();
                alert('Por favor, ingrese una descripcion');
                return false;
            }

            

        }
</script>
    <script src="../Librerias/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- SB Admin Scripts - Include with every page -->
    <script src="../Librerias/js/sb-admin.js"></script>

</body>

</html><!DOCTYPE html>