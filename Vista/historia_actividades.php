
<?php
    require_once("MenuGE.php");

            $peticionA = $conexion->consulta("SELECT `NOMBRE_UA` FROM `inscripcion` WHERE `NOMBRE_UGE`='$uActivo'");
             while ($correo = mysql_fetch_array($peticionA))
               {        
                      $asesor=$correo["NOMBRE_UA"];
               }

         $peticionGE = $conexion->consulta("SELECT NOMBRE_CORTO_GE FROM grupo_empresa WHERE NOMBRE_U='$uActivo'");
             while ($correo1 = mysql_fetch_array($peticionGE))
               {        
                      $grupoEmpresa=$correo1["NOMBRE_CORTO_GE"];   
               }   
                      
         $peticionNL = $conexion->consulta("SELECT NOMBRE_LARGO_GE FROM grupo_empresa WHERE NOMBRE_U='$uActivo'");
             while ($correo2 = mysql_fetch_array($peticionNL))
               {        
                      $grupoEmpresaNL=$correo2["NOMBRE_LARGO_GE"];
               }  
?>
        <link href="css/tabla-div1.css" rel="stylesheet" type="text/css" />
        <link href="css/tabla-div.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" /> 
        <div id="page-wrapper">
        <form id = "ordenc" method = "post" action="" role="form" enctype="multipart/data-form" onsubmit="return validarCampos(ordenc)">
        <div class ="form-horizontal">



        <?php 
  
        
        $peticion6=$conexion->consulta("SELECT * FROM inscripcion WHERE NOMBRE_UGE='$uActivo' and ESTADO_INSCRIPCION='Habilitado'");
        $tamano=mysql_num_rows($peticion6);
        if($tamano>0)
        {
        
            
        
            
        
            $peticion7=$conexion->consulta("SELECT  r.nombre_r, p.fecha_inicio_pl, p.hora_inicio_pl, p.fecha_fin_pl, p.hora_fin_pl FROM plazo p, registro r, tipo t, inscripcion_proyecto i, documento_r d WHERE t.TIPO_T = r.TIPO_T AND p.ID_R = r.ID_R AND r.TIPO_T =  'documento requerido' AND r.NOMBRE_U = '$asesor' AND i.NOMBRE_U='$uActivo' and  d.CODIGO_P=i.CODIGO_P AND r.ID_R=d.ID_R");
            $tamanio=mysql_num_rows($peticion7);
            if($tamanio>0)
            {

                        ?>


                        <div class="historia">

                        <h2><span>ACTIVIDADES EN LINEA</span></h2>
                        </div>
                        <hr>
                        <div class="historia1">
                        <div class="contenedor-fila2">

                        <div class="contenedor-columna">
                        <?php
                        echo "Nombre";
                        ?>
                        </div>  
                        <div class="contenedor-columna">
                        <?php
                        echo "Fecha Inicio";
                        ?>
                        </div>

                        <div class="contenedor-columna">
                        <?php
                        echo "Hora Inicio";
                        ?>
                        </div>
                        <div class="contenedor-columna">
                        <?php
                        echo "Fecha Fin ";
                        ?>
                        </div>
                        <div class="contenedor-columna">
                        <?php
                        echo "Hora Fin";
                        ?>
                        </div>
                        </div>  
                        <?php

                        //Peticion
                        $peticion = $conexion->consulta("SELECT  r.nombre_r, p.fecha_inicio_pl, p.hora_inicio_pl, p.fecha_fin_pl, p.hora_fin_pl FROM plazo p, registro r, tipo t, inscripcion_proyecto i, documento_r d WHERE t.TIPO_T = r.TIPO_T AND p.ID_R = r.ID_R AND r.TIPO_T =  'documento requerido' AND r.NOMBRE_U = '$asesor' AND i.NOMBRE_U='$uActivo' and  d.CODIGO_P=i.CODIGO_P AND r.ID_R=d.ID_R");


                        while($fila = mysql_fetch_array($peticion))
                        {
                        ?>
                        <div class="contenedor-fila">
                        <div class="contenedor-columna">
                        <?php
                        echo $fila['nombre_r'];
                        ?>
                        </div>

                        <div class="contenedor-columna">
                        <?php
                        echo $fila['fecha_inicio_pl'];
                        ?>
                        </div>

                        <div class="contenedor-columna">
                        <?php
                        echo $fila['hora_inicio_pl'];
                        ?>
                        </div>

                        <div class="contenedor-columna">
                        <?php
                        echo $fila['fecha_fin_pl'];
                        ?>
                        </div>

                        <div class="contenedor-columna">
                        <?php
                        echo $fila['hora_fin_pl'];
                        ?>
                        </div>


                        </div>
                        <?php
                        }
            }
            else
            {                     
                $peticion9=$conexion->consulta("SELECT registro.ID_R,registro.NOMBRE_U,registro.NOMBRE_R,registro.FECHA_R,registro.HORA_R  FROM registro, receptor  WHERE  registro.ID_R=receptor.ID_R  and   (RECEPTOR_R='$grupoEmpresaNL' OR RECEPTOR_R='TODOS')");
                $tamanio2=mysql_num_rows($peticion9);
                if($tamanio2<1)
                {  
                        echo '<div class="alert alert-warning">
                              <strong>No existe nunguna actividad registrada</strong>
                              </div>';
                }
            }

        ?>  
                        </div>    
                        <hr>
                        <div class ="form-horizontal">
                        <div class="historia">
        <?php   
        
            $peticion8=$conexion->consulta("SELECT registro.ID_R,registro.NOMBRE_U,registro.NOMBRE_R,registro.FECHA_R,registro.HORA_R  FROM registro, receptor  WHERE  registro.ID_R=receptor.ID_R  and   (RECEPTOR_R='$grupoEmpresaNL' OR RECEPTOR_R='TODOS')");
            $tamanio1=mysql_num_rows($peticion8);
            if($tamanio1>0)
            {
        
                        ?>  
                        <h2><span>ANUNCIOS</span></h2>
                        </div>
                        <hr>
                        <div class="historia1">
                        <div class="contenedor-fila2">

                        <div class="contenedor-columna">
                        <?php
                        echo "ID ";
                        ?>
                        </div>  
                        <div class="contenedor-columna">
                        <?php
                        echo "Asesor";
                        ?>
                        </div>

                        <div class="contenedor-columna">
                        <?php
                        echo "Descripcion";
                        ?>
                        </div>
                        <div class="contenedor-columna">
                        <?php
                        echo "Fecha ";
                        ?>
                        </div>
                        <div class="contenedor-columna">
                        <?php
                        echo "Hora";
                        ?>
                        </div>
                        </div>  
                        <?php

                        $peticion = $conexion->consulta("SELECT registro.ID_R,registro.NOMBRE_U,registro.NOMBRE_R,registro.FECHA_R,registro.HORA_R  FROM registro, receptor  WHERE  registro.ID_R=receptor.ID_R  and   (RECEPTOR_R='$grupoEmpresaNL' OR RECEPTOR_R='TODOS')");


                        while($fila = mysql_fetch_array($peticion))
                        {
                        ?>
                        <div class="contenedor-fila">
                        <div class="contenedor-columna">
                        <?php
                        echo $fila['ID_R'];
                        ?>
                        </div>

                        <div class="contenedor-columna">
                        <?php
                        echo $fila['NOMBRE_U'];
                        ?>
                        </div>

                        <div class="contenedor-columna">
                        <?php
                        echo $fila['NOMBRE_R'];
                        ?>
                        </div>

                        <div class="contenedor-columna">
                        <?php
                        echo $fila['FECHA_R'];
                        ?>
                        </div>

                        <div class="contenedor-columna">
                        <?php
                        echo $fila['HORA_R'];
                        ?>
                        </div>


                        </div>
                        <?php
                        }

            }
            else
            {
                
            }



        ?>  
        </div>    


        </div>

        <hr>

        <?php
        }
        else
        { 
        echo '<div class="alert alert-warning">
        <strong>Su inscripcion no ha sido habilitada</strong>
        </div>';
        }
        ?>             
                 
  </form>
             
    <!--Modal para adjuntar recursos/documentos-->

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