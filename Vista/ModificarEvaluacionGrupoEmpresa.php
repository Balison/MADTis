<?php  
   
    session_start();
    $UserAct = $_SESSION['usuario'];

?>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Sistema de Apoyo a la Empresa TIS</title>

    <!-- Core CSS - Include with every page -->
    <link href="../Librerias/css/bootstrap.min.css" rel="stylesheet">
   
    <link href="../Librerias/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- ComboBox estilizado ;) -->
    
    <!-- Page-Level Plugin CSS - Dashboard -->
    
    <link href="../Librerias/css/plugins/timeline/timeline.css" rel="stylesheet">
   

    <!-- SB Admin CSS - Include with every page -->
    <link href="../Librerias/css/sb-admin.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../Librerias/css/jquery-te-1.4.0.css">

    <!--link rel="stylesheet" href="../Librerias/css/awesome-bootstrap-checkbox.css"-->
    
    <script src="../Librerias/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="../Librerias/js/masked_input.js"></script>
    <script src="../Librerias/js/jquery-2.1.0.min.js"></script>
     
    <script src="../Librerias/js/evaluar.js"></script>
    <link href="../Librerias/css/bootstrap-dialog.css" rel="stylesheet">
    <script src="../Librerias/js/bootstrap-dialog.js"></script>
   
</head>

<body>

   
    <div id="wrapper">
    <!--<h2>design by <a href="#" title="flash templates">flash-templates-today.com</a></h2>-->
        
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               <a class="navbar-brand" href="inicio_asesor.php">Inicio </a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
             
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><?php echo "$UserAct"; ?>
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="modificar_asesor.php"><i class="fa fa-user fa-fw"></i> Modificar Datos Personales</a>
                        
                        <li class="divider"></li>
                        <li><a href="unlog.php"><i class="fa fa-sign-out fa-fw"></i>Salir</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default navbar-static-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="AdministrarGrupoEmpresa.php"><i class="fa fa-book"></i> Administrar Grupo Empresas</a>
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-th-list"></i> Evaluacion Grupo Empresa<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="CrearModalidadEvaluacion.php">Criterio de Evaluaci&oacute;n </a>                             
                                </li>
                                                    
                                <li>
                                    <a href="#">Criterio de Calificaci&oacute;n<span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="CrearModalidadCalificacion.php"> Crear Criterio de Calificaci&oacute;n</a>
                                        </li>
                                        <li>
                                            <a href="EliminarCriterioCalificacion.php"> Eliminar Criterio de Calificaci&oacute;n</a>
                                        </li>
                                    </ul>
                                </li>
                                                     
                                <li>
                                    <a href="#">Formulario de Evaluacion<span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="CrearFormulario.php">Crear Formulario de Evaluacion</a>
                                        </li>
                                        <li>
                                            <a href="SeleccionarFormulario.php"> Habilitar Formulario de Evaluacion </a>   
                                        </li>
                                        <li>
                                            <a href="EliminarFormulario.php">Eliminar Formulario de Evaluacion</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="EvaluarGrupoEmpresa.php">Evaluar Grupo Empresa </a>   
                                </li>
                                <li>
                                    <a href="../Vista/EvaluacionGeneral.php">Evaluacion Final </a>   
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-files-o "></i> Documentos <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                            <a href="../Vista/subirarchivoasesor.php">Subir Documentos</a>
                                </li>
                                <li>
                                    <a href="../Vista/RegistrarDocumentosRequeridos.php">Registrar Documentos</a>
                                </li>
                                
                                <li>
                                    <a href="#">Publicaci&oacute;n Documentos <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        
                                        
                                        <li>
                                            <a href="../Vista/publicar_asesor.php">Nueva Publicaci&oacute;n </a>
                                        </li>
                                        <li>
                                            <a href="../Controlador/publicaciones.php">Publicaciones </a>
                                        </li>
                                       
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                                <li>
                                    <a href="#">Recepci&oacute;n Documentos <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="documentos_recibidos.php">Documentos Recibidos</a>
                                        </li>
                                        <li>
                                            <a href="ConfiguracionFechasRecepcion.php" ><span class="fa fa-calendar-o"></span> Configuraci&oacute;n de Fechas para la Recepci&oacute;n de Documentos</a>
                                            
                                        </li>
         
                                    </ul>
                                </li>
                               
                            </ul>
                            
                            <!-- /.nav-second-level -->
                        </li>
                        
                         <li>
                            <a href="#"><i class="fa fa-tasks fa-fw"></i> Tareas<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="contrato.php">Emitir Contrato </a>
                                </li>
                                <li>
                                    <a href="../Vista/RegistrarFirma.php">Firma de Contratos</a>
                                </li>
                                <li>
                                    <a href="ordendecambioempresas.php">Emitir Orden de Cambio</a>
                                </li>
                                <li>
                                    <a href="notificacion_conformidad.php">Emitir Notificaci&oacute;n de Conformidad</a>
                                </li>
                                <li>
                                    <a href="InscripcionProyecto.php">Registrar Proyecto</a>
                                </li>
                                <li>
                                    <a href="#">Seguimiento Grupo Empresa <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        
                                        <li>
                                            <a id="Seguimiento" href="../Vista/inicio_asesor.php">Seguimiento</a>
                                        </li>
                                        
  
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
   
                        <li>
                              <a href="lista_doc_subidos.php"><i class="fa fa-tasks fa-fw"></i>Documentos Subidos </a>  
                                              
                        </li>
                        <li>
                            <a href="lista-de-noticias.php"><i class="fa fa-comment"></i> Foro</a>
                        </li>

                        
                        
                       
                    </ul>
                    <!-- /#side-menu -->
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

<!-------------------------------------------NUEVAS PUBLICACIONES------------------------------------------>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">Modificar Evaluacion Grupo Empresa</h2>
            <div class="col-lg-6">   
                <form method = "post" id="FormEvaluar">
                                                      
                            <?php 
                            include '../Modelo/conexion.php';

                            $GrupoE = $_GET['GE'];
                            
                            $conect = new conexion();

                            $Sel_IdF = $conect->consulta("SELECT ID_FORM FROM nota WHERE NOMBRE_U='$GrupoE'");

                            $Id_Form = mysql_fetch_row($Sel_IdF);

                            if(is_array($Id_Form)){

                                $Sel_Nota = $conect->consulta("SELECT CALIF_N FROM nota WHERE NOMBRE_U='$GrupoE'");

                                $Nota = mysql_fetch_row($Sel_Nota);

                                $Sel_IdN = $conect->consulta("SELECT ID_N FROM nota WHERE NOMBRE_U='$GrupoE'");
                                $IdNota = mysql_fetch_row($Sel_IdN);

                                $Sel_PGE = $conect->consulta("SELECT CALIFICACION FROM puntaje_ge WHERE ID_N='$IdNota[0]'");

                                while ($Row_PGE = mysql_fetch_row($Sel_PGE)) {
                                    $Pje_GE[] = $Row_PGE[0];
                                    
                                }

                                echo '<input type="hidden" name="GrupoEscogido" value ='.$GrupoE.'>';
                                echo '<input type="hidden" name="IdFormularioUtilizado" value ='.$Id_Form[0].'>';
                                echo '<input type="hidden" name="Operacion" value ="ReEvaluar">';

                                echo '<div class="panel panel-default">
                                        <div class="panel-body">';

                                        echo '<div class="form-group">
                                                <h4>Grupo Empresa:</h4>
                                                <input type="text" name="" id="" class="form-control" value="'.$GrupoE.'" Disabled>
                                            </div>';

                                        echo '<div class="form-group">
                                                <h4>Nota:</h4>
                                                <input type="text" name="" id="" class="form-control" value="'.$Nota[0].'" Disabled>
                                            </div>';
                                echo '</div>
                                        </div>';

                                $Sel_IdE = $conect->consulta("SELECT ID_CRITERIO_E FROM form_crit_e WHERE ID_FORM ='$Id_Form[0]'");

                                while ($RowCritE = mysql_fetch_row($Sel_IdE)) {

                                    $IdCritE[] = $RowCritE; 
                                    
                                }

                                for ($i=0; $i <count($IdCritE) ; $i++) { 

                                    $Sel_NomE = $conect->consulta('SELECT NOMBRE_CRITERIO_E FROM criterio_evaluacion WHERE ID_CRITERIO_E = '.$IdCritE[$i][0].'');

                                    $NomCE[] = mysql_fetch_row($Sel_NomE);
                        
                                }

                                $Sel_Pje = $conect->consulta("SELECT PUNTAJE FROM puntaje WHERE ID_FORM = '$Id_Form[0]'");

                                while($Row_Pje = mysql_fetch_row($Sel_Pje))
                                {
                                    $Pje[] = $Row_Pje;
                                }

                                $Sel_IdC = $conect->consulta("SELECT ID_CRITERIO_C FROM from_crit_c WHERE ID_FORM = '$Id_Form[0]'");

                                while ($RowCritC = mysql_fetch_row($Sel_IdC)) {

                                    $IdCritC[] = $RowCritC;
                
                                }


                                for ($j=0; $j < count($IdCritC) ; $j++) { 
                                    
                                    $Sel_Tipo = $conect->consulta('SELECT TIPO_CRITERIO FROM criteriocalificacion WHERE ID_CRITERIO_C ='.$IdCritC[$j][0].'');

                                    $TipoC[] = mysql_fetch_row($Sel_Tipo);
                                }

                                $contador = 0;

                                    for ($i=0; $i < count($NomCE) ; $i++) { 

                                        echo "<div>";
                                            echo '<div class="panel panel-default">';
                                                echo '<div class="panel-body">';
                                                    echo '<div class="form-group">';
                                                        echo '<strong>'.'* '.$NomCE[$i][0].'</strong>'.' ('.$Pje[$i][0].' puntos)';
                                                        echo '<input type="hidden" name="valoresFormulario[]" value="'.$Pje[$i][0].'">';

                                                    echo '</div>';


                                                if ($TipoC[$i][0] == 4) {

                                                    $contador++;

                                                        echo'<div class="form-group">';
                                                            echo'<input type="text" name="valorInput[]" class="form-control" pattern="^[0-9]{1,3}" value="'.$Pje_GE[$i].'" title="El campo solo admite numeros" required>';
                                                            echo '<input type="hidden" name="puntajeCriterio[]" value="'.$contador.'">';
                                                        
                                                        echo'</div>';
                                                    echo'</div>';
                                                echo'</div>';
                                                }
                                                else
                                                {      
                                                    
                                                    $Sel_Ind = $conect->consulta('SELECT NOMBRE_INDICADOR FROM indicador WHERE ID_CRITERIO_C = '.$IdCritC[$i][0].'');

                                                    while($Row_Ind = mysql_fetch_row($Sel_Ind)){

                                                        $Ind[] = $Row_Ind;
                                                    }

                                                    $valores = $conect->consulta('SELECT PUNTAJE_INDICADOR FROM indicador WHERE ID_CRITERIO_C = '.$IdCritC[$i][0].'');
                                                
                                                    while ($rowP = mysql_fetch_row($valores)) {

                                                        $PjeC[] = $rowP;
                                            
                                                    }
                                                    
                                                    echo '<div id='.$i.'>';

                                                    for ($z=0; $z < count($Ind) ; $z++) { 


                                                        if($PjeC[$z][0] == $Pje_GE[$i])
                                                        {
                                                            echo'<div class="checkbox">';
                                                            
                                                            echo'<input type="checkbox" id="'.$z.'" name="valorInput[]" value="'.$PjeC[$z][0].'" checked>'.$Ind[$z][0].' ('.$PjeC[$z][0].')';
                                                           
                                                            echo'</div>';

                                                        }
                                                        else{
                                                            echo'<div class="checkbox">';
                                                            
                                                            echo'<input type="checkbox" id="'.$z.'" name="valorInput[]" value="'.$PjeC[$z][0].'">'.$Ind[$z][0].' ('.$PjeC[$z][0].')';
                                                           
                                                            echo'</div>';

                                                        }
                                                    
                                                    }
                                                    echo '</div>';
                                                echo '</div>';
                                                echo '</div>';
                                                
                                                unset($Ind);
                                                unset($PjeC);
                                                
                                                }

                                        echo "</div>";   
                                    }
                                    echo '<div class="form-group">
                                                <button type="submit" name="submit" class="btn btn-primary btn-sm" id="btn-evaluar">Evaluar</button>
                                                
                                          </div>';


                            }else{

                                echo '<div class="alert alert-warning">
                                                    <strong>La grupo empresa no ha sido evaluada</strong>
                                                </div>';
                            }

                            ?>
                </form>
                  
                    <div id="ResultadoNota">
                        <div class="form-group">
                                        
                        </div>
                    </div>                                      
            </div><!--Col-lg6-->
        </div><!--Col lg 12-->
    </div><!-- /.row -->  

</div><!--Page-Wrapper-->               
    <script src="../Librerias/js/bootstrap.min.js"></script>
    <script src="../Librerias/js/plugins/metisMenu/jquery.metisMenu.js"></script>


    <!-- SB Admin Scripts - Include with every page -->
    <script src="../Librerias/js/sb-admin.js"></script>
  
    <!-- Page-Level Demo Scripts - Dashboard - Use for reference -->
    <script src="../Librerias/js/demo/dashboard-demo.js"></script>
    <!-- Combo Box scripts -->
    
</body>

</html>