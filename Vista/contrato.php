<!DOCTYPE html>

<?php

    include '../Modelo/conexion.php';
    session_start();
    $con=new conexion();
    $UsuarioActivo = $_SESSION['usuario'];
 
?>

<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Sistema de Apoyo a la Empresa TIS</title>

    <!-- JQuery -->
    <script type="text/javascript" src="../Librerias/lib/jquery-2.1.0.min.js"></script>
    <!-- icheck -->
    <link href="../Librerias/icheck/skins/square/green.css" rel="stylesheet">
    <script src="../Librerias/lib/icheck.min.js"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="../Librerias/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="../Librerias/lib/bootstrap.js"></script>
    <!-- Docs -->
    <link rel="stylesheet" type="text/css" href="../Librerias/lib/css/docs.css">
    <!-- Font-Awesome -->
    <link rel="stylesheet" type="text/css" href="../Librerias/font-awesome/css/font-awesome.css">
    <!-- Bootstrap-datetimepicker -->
    <link rel="stylesheet" type="text/css" href="../Librerias/lib/css/bootstrap-datetimepicker.css">
    <script type="text/javascript" src="../Librerias/lib/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="../Librerias/lib/bootstrap-datetimepicker.es.js"></script>
    <!-- Bootstrap-multiselect -->
    <link rel="stylesheet" type="text/css" href="../Librerias/lib/css/bootstrap-multiselect.css">
    <script type="text/javascript" src="../Librerias/lib/bootstrap-multiselect.js"></script>
    <!-- Bootstrap-validator -->
    <link rel="stylesheet" type="text/css" href="../Librerias/lib/css/bootstrapValidator.css">
    <script type="text/javascript" src="../Librerias/lib/bootstrapValidator.js"></script>
    <!-- Validators -->
    <script type="text/javascript" src="../Librerias/lib/validator/diferenteActividadPlanificacion.js"></script>
    <script type="text/javascript" src="../Librerias/lib/validator/diferenteEntregable.js"></script>
    <script type="text/javascript" src="../Librerias/lib/validator/stringLength.js"></script>
    <script type="text/javascript" src="../Librerias/lib/validator/notEmpty.js"></script>
    <script type="text/javascript" src="../Librerias/lib/validator/callback.js"></script>
    <script type="text/javascript" src="../Librerias/lib/validator/date.js"></script>
    <script type="text/javascript" src="../Librerias/lib/validator/numeric.js"></script>
    <script type="text/javascript" src="../Librerias/lib/validator/porcentajeMax.js"></script>
    <script type="text/javascript" src="../Librerias/lib/validator/porcentajeMin.js"></script>
    <!-- JS -->
    <script type="text/javascript" src="../Librerias/lib/funcion.js"></script>





    <link href="../Librerias/css/plugins/timeline/timeline.css" rel="stylesheet">
    <!-- SB Admin CSS - Include with every page -->
    <link href="../Librerias/css/sb-admin.css" rel="stylesheet">

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
                   <a class="navbar-brand" href="inicio_grupo_empresa.php">Inicio </a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="modificar_asesor.php"><i class="fa fa-user fa-fw"></i> Modificar Datos personales</a>
                        </li>
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
                            <a href="#"><i class="fa fa-bar-chart-o fa-files-o "></i> Documentos <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                
                                <li>
                                    <a href="#" >Subir Documentos <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <?php
                                        try{
                                                  //creamos la conexion a la base de datos
                                                 $conexion = new conexion();
                                                 $idUsuarioAsesor1=$conexion->consulta("SELECT i.`NOMBRE_UA` FROM inscripcion AS i WHERE i.NOMBRE_UGE LIKE '$UsuarioActivo'");
                                                 $f=mysql_fetch_array($idUsuarioAsesor1);//$idUsuarioG='bolivia';
                                                 $nombre_a=$f['NOMBRE_UA'];
                                                 //$idUsuarioAsesor=$conexion->consulta("SELECT `NOMBRE_UA` FROM inscripcion WHERE NOMBRE_UGE LIKE '$UsuarioActivo'");
                                                $idUsuarioAsesor=$nombre_a;
                                                $idUsuarioG=$UsuarioActivo;
                                                 $consulta=$conexion->consulta("SELECT r.NOMBRE_R,r.`NOMBRE_U` FROM registro AS r,plazo AS p,descripcion AS d,`estado` AS e,`tipo` AS t WHERE r.ID_R = d.ID_R AND r.TIPO_T = t.TIPO_T AND r.ID_R = p.ID_R AND e.`ESTADO_E` = r.`ESTADO_E` AND r.`ESTADO_E` LIKE 'habilitado' AND r.TIPO_T LIKE 'documento requerido' AND r.NOMBRE_U LIKE '$idUsuarioAsesor'");
                                                 $indice=1;
                                                 while($fila = mysql_fetch_array($consulta))
                                                {
                                                     //aqui introducimos atraves de codigo php los enlaces de opciones
                                                     if(!stripos($fila['0'], "modif"))
                                                     {
                                                     $temporal=$fila['1'];
                                                         echo   "<form name='formulario$indice' action='subir_documento.php' enctype='multipart/form-data' method='POST'>"
                                                                 . "<input type='hidden' name='nombreUsuarioAsesor' value='$temporal'>"
                                                                 . "<input type='hidden' name='nombreRegistro' value='".$fila['0']."'>"
                                                                 . "<input type='hidden' name='nombreUsuarioG' value='$idUsuarioG'>"
                                                                 . "</form>"
                                                                 . "<li>"
                                                                 . "<a href='javascript:document.formulario$indice.submit();'>".$fila['0']."</a>"                                       
                                                                 . "</li>";
                                                         
                                                     $indice++;
                                                     }
                                        
                                                }
                                                
                                                $consultaDos=$conexion->consulta("SELECT r.NOMBRE_R,r.`NOMBRE_U` FROM registro AS r,plazo AS p,descripcion AS d,`estado` AS e,`tipo` AS t WHERE r.ID_R = d.ID_R AND r.TIPO_T = t.TIPO_T AND r.ID_R = p.ID_R AND e.`ESTADO_E` = r.`ESTADO_E` AND r.`ESTADO_E` LIKE 'habilitado' AND r.TIPO_T LIKE 'documento requerido' AND r.NOMBRE_U LIKE '$idUsuarioAsesor' AND LOWER(r.`NOMBRE_R`) LIKE '%modif%'");
                                                //$consultaTres=$conexion->consulta("SELECT r.`NOMBRE_R` FROM registro AS r,`tipo` AS t, `documento` AS d,`estado` AS e WHERE r.`ID_R` = d.`ID_R` AND r.`TIPO_T` = t.`TIPO_T` AND r.`ESTADO_E` = e.`ESTADO_E` AND t.`TIPO_T` LIKE 'orden de cambio' AND r.`NOMBRE_U` LIKE '$idUsuarioG'");
                                                if (mysql_num_rows($consultaDos) != 0) {
                                                    
                                                    while($filaDos = mysql_fetch_array($consultaDos))
                                                {
                                                     //aqui introducimos atraves de codigo php los enlaces de opciones de subir propuesta modificada
                                                     
                                                     
                                                     $temporalDos=$filaDos['1'];
                                                         echo   "<form name='formulario$indice' action='subir_documento.php' enctype='multipart/form-data' method='POST'>"
                                                                 . "<input type='hidden' name='nombreUsuarioAsesor' value='$temporalDos'>"
                                                                 . "<input type='hidden' name='nombreRegistro' value='".$filaDos['0']."'>"
                                                                 . "<input type='hidden' name='nombreUsuarioG' value='$idUsuarioG'>"
                                                                 . "</form>"
                                                                 . "<li>"
                                                                 . "<a href='javascript:document.formulario$indice.submit();'>".$filaDos['0']."</a>"                                       
                                                                 . "</li>";
                                                         
                                                     $indice++;
                                                     
                                        
                                                }
                                                    
                                                    
                                                }
                                                
                                                $conexion->cerrarConexion();
                                               
                                            }
                                        catch (ErrorException $e)
                                        {
                                              echo $e;
                                        }
                                    ?>
                                    </ul>
                                </li>
                                <li>
                                    <a href="publicacion_grupo.php">Recepci&oacute;n Documentos </a>
                                    
                                </li>
                               
                            </ul>
                            
                            <!-- /.nav-second-level -->
                        </li>
                        
                         <li>
                            <a href="#"><i class="fa fa-tasks fa-fw"></i> Tareas<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <?php
                                                 $idUsuarioAsesor='leticia';
                                                 $idUsuarioG='freevalue';
                                echo   ""
                                     . "<form name='formularioNombre' action='verificar_nombre.php' enctype='multipart/form-data' method='POST'>"
                                     . "<input type='hidden' name='nombreGrupo' value='$idUsuarioG'>"
                                     . "<input type='hidden' name='nombreAsesor' value='$idUsuarioAsesor'>"
                                     . "</form>"
                                     . "<li>"
                                     . "<a href='javascript:document.formularioNombre.submit();'>Verificar Nombre de Empresa</a>"
                                     . "</li>";
                                ?>
                                <li>
                                    <a href="seleccionar_asesor.php">Seleccionar Asesor</a>
                                </li>
                                
                                 <li>
                                     <a href="InscripcionGEProyecto.php">Inscribirse a proyecto</a>
                                </li>
                                
                                <li>
                                     <a href="AnadirSocio.php">Añadir socios</a>
                                </li>
                                
                                <li>
                                    <a href="AnadirRL.php">Seleccionar Representante legal</a>
                                </li>
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-warning fa-fw"></i> Notificaciones<span class="fa arrow"></span></a>
                                                    
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="historia_actividades.php">Historia de actividades</a>
                                </li>
                                
                            </ul>  
                            </li>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-building-o fa-fw"></i> Actividades<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a id="registrarPlanificacion" href="#">
                                        <i class="fa fa-pencil-square-o fa-fw"></i>Registrar Planificaci&oacute;n
                                    </a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
 
                        
                        <li>
                            <a href="#"><i class="fa fa-question-circle fa-fw"></i> Ayuda <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="lista-de-noticias-grupo.php"><i class="fa fa-comment"></i> Foro</a>
                                
                            </ul>
                            <!-- /.nav-second-level -->
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
           
<form id = "econtrato" method = "post" action="" role="form" >
    <div class ="form-horizontal">
         <div class="row">
            <div class="col-lg-12">
               <h1> Emitir Contrato <small></small></h1>           
            </div>
         </div><!-- /.row -->
    </div>    
                <!--Descripcion de la publicacion--> 
                
 </form>               

    <div class="form-group">
    Grupo Empresa:
    <form method="POST" action="emtirContrato.php" enctype="Multipart/form-data">
        <select name="grupoempresa" class="form-control">
            <option>Seleccione una grupo empresa</option>
            <?php
                $idAsesor= $_SESSION['usuario']  ;
                $estado = "Habilitado";
                $c1="SELECT ge.`NOMBRE_LARGO_GE` FROM `inscripcion` AS i,`asesor` AS a,`grupo_empresa` AS `ge` WHERE i.`NOMBRE_UA` = a.`NOMBRE_U` AND i.`NOMBRE_UGE` = ge.`NOMBRE_U` AND a.`NOMBRE_U` LIKE '$idAsesor' AND i.`ESTADO_INSCRIPCION` LIKE '$estado'";
                $a1=$con->consulta($c1);
                
                while($v1 =  mysql_fetch_array($a1)){
                    echo "<option>".$v1[0]."</option>";
                }
                echo "<input type='hidden' name='idAsesor' value='$idAsesor'>";
            
                ?>
        </select><br>
         <div class   ="col-sm-8">
             <input class ="btn btn-primary" type="submit" value= "Generar" id= "Generar PDF" name="Generar PDF" onclick ="this.form.action='../Controlador/emitirContrato.php?id=0'"></input> &nbsp;&nbsp;              
        </div>
    </form>
    </div>
    
    <div class   ="form-group">
      
    </div><!--end/submit-->
                
      
    

             
    <!--Modal para adjuntar recursos/documentos-->
         
      
    </div>
    <!-- /#wrapper -->
    

    <!-- Core Scripts - Include with every page -->
 
 

    <script src="../Librerias/js/bootstrap.min.js"></script>
    <script src="../Librerias/js/plugins/metisMenu/jquery.metisMenu.js"></script>


    <!-- SB Admin Scripts - Include with every page -->
    <script src="../Librerias/js/sb-admin.js"></script>
  
    <!-- Page-Level Demo Scripts - Dashboard - Use for reference -->
    <script src="../Librerias/js/demo/dashboard-demo.js"></script>
    <!-- Combo Box scripts -->
 
  
<script type="text/javascript">
    
     
});
</script>
</body>

</html>
