<?php 
  require_once("MenuGE.php");
?>
        <div id="page-wrapper">


            
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Foro</h2>
                    <div class="col-lg-12" >

                          <div class="panel panel-default">
                        <div class="panel-heading">
                            <i ></i> <h3>Temas</h3>
                        </div>
                            


                        <!-- /.panel-heading -->
                        <div class="panel-body"  >
                            <div class="list-group">

                                   <?php
 
                                         // Seleciona la tabla de noticias
                                        $noticia = $conexion->consulta("SELECT * FROM noticias ORDER BY ID_N DESC");

                                
                                        while ($noticias=mysql_fetch_array($noticia)) 
                                        { 
                                           $idNoti = $noticias["ID_N"];
                                           $usuario = $noticias["NOMBRE_U"];
                                           $titulo = $noticias["TITULO"];
                                           $fecha = $noticias["FECHA_N"];
                                           $vistos = $noticias["VIEWS"];
                                           $posteado=$noticias["POSTEADO"];

                                            // numero de comentarios
                                           $selComen = $conexion->consulta("SELECT * FROM comentarios WHERE ID_N='$idNoti'");
                                           $comentarios = mysql_num_rows($selComen);

                                  ?>



                                <a href="#" class="list-group-item">
                                       <i ></i> <p size="5"><font size="3"><b><?php echo $titulo?></b><p></p>
                                       <i ></i> Posteado por <b><?php echo $posteado?></b> -
                                       <i ></i> <b> <?php echo $vistos?></b> Visualizaciones -
                                       <i ></i> <b><?php echo $comentarios?></b> Comentarios -
                                       <i ></i> <?php echo $fecha?>
                                     <?php
                                           if($posteado==$uActivo )
                                     {?>
                                                  <span class="pull-right text-muted small"><em><?php echo"<td> <a  class='link-dos' href=\"noticia-grupo.php?id=$idNoti\">Ver </a></td>";?></em>
                                                  </span>
                                                  <span class="pull-right text-muted small"><em><?php echo "<td> <a  class='link-dos'href=\"excluir-noticia-grupo.php?id=$idNoti\">Eliminar</a></td>"; ?></em>
                                                  </span>
                                   
                                    <?php
                                     } 
                                    else { ?>
                                     
                                                  <span class="pull-right text-muted small"><em><?php echo"<td> <a  class='link-dos' href=\"noticia-grupo.php?id=$idNoti\">Ver </a></td>";?></em>
                                    </span>
                                    <?php
                                         } 
                                    ?>
                                </a>
                                
                                <?php
                                 }
                                 ?>
                                
                            </div>
                            <!-- /.list-group -->
                           <!--<a href="#" class="btn btn-default btn-block">Ver Todas las Alertas</a>-->
                        </div>
                        <!-- /.panel-body -->
                    </div>


<br>
<b><a  class='link-dos' href="adicionar-noticia-grupo.php">Adicionar nuevo  tema</a></b>
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