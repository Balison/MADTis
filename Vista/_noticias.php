
    <div class="mainbar">
     <nav class="star" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
        <a class="navbar-brand">Avisos Empresa TIS</a>
            
        </div>
    </nav>
        <h2 class="star"><span>&nbsp; </span></h2>
                                       
          
        <?php                                  

               $valor='0';
               $peticion11 = $conectar->consulta("select count(*) from receptor where RECEPTOR_R='PUBLICO'"); 
               while($fila = mysql_fetch_array($peticion11))
               $valor= $fila["count(*)"] ;                         
               $row_Recordset1='Descargar';
               if($valor<'4'){ $valor='4'; }
          
        ?>                                        
                                        
                                     
<table width="70%" border="0" cellpadding="4" cellspacing="0" class="fondo_central " align="center">

<tr><td height="10"></td></tr>

<script language="JavaScript" type="text/javascript">
        <!--

        var nume= <?php echo $valor; ?>   
        setTamAviso( 130 );
        setNumAvisos( nume );
        timerID = setTimeout("moverAvisos()", 1000);         
        -->
</script>
<tr><td>
    <table width="100%" cellpadding="0" cellspacing="0"><tr>
    <td style="width: 97%" onmouseover="normal()">
    <div style="position:relative; overflow:hidden; width:100%; height:390px;">


    <?php
    $numero='0';
    $peticion = $conectar->consulta("SELECT registro.NOMBRE_U,registro.NOMBRE_R,registro.FECHA_R,registro.HORA_R, asesor.NOMBRES_A, asesor.APELLIDOS_A , documento.RUTA_D, descripcion.DESCRIPCION_D FROM registro , asesor , documento , receptor , descripcion WHERE registro.NOMBRE_U=asesor.NOMBRE_U and  `TIPO_T`='publicaciones' and documento.ID_R=registro.ID_R and descripcion.ID_R=registro.ID_R and receptor.ID_R=registro.ID_R and RECEPTOR_R='PUBLICO'");                                                            
    while($fila = mysql_fetch_array($peticion))
    {  
        ?>       

        <div class="caja_aviso" id="aviso<?php echo $numero ?>" style="position:absolute; height:130px; top:0px; width:95%; left:2.5%;">
        <div class="subtitulo_aviso" ><strong>Docente: </strong> <?php echo $fila['NOMBRES_A']; ?>&nbsp;&nbsp;<?php echo $fila['APELLIDOS_A']; ?>
        &nbsp;&nbsp;&nbsp;<strong> </strong> </div>                           
        <div  class="titulo_aviso">
        <?php echo $fila['NOMBRE_R']; ?>
        </div>    
        <div class="letra_aviso" >
        <?php echo $fila['DESCRIPCION_D']; ?>&nbsp;&nbsp;&nbsp;


        <?php  
        $tamano=$fila['RUTA_D'];
        if(empty($tamano)==false)
        {
        echo "<a href='".$fila['RUTA_D']."' target='_blank'><font color='blue'>".$row_Recordset1."</a>";
        }
        ?>

        </div>
        <div class="pie_aviso">Publicado el   <?php       echo $fila['FECHA_R']; ?>  &nbsp;&nbsp; Hora:<?php       echo $fila['HORA_R']; ?> </div>
        </div>         
        <?php  $numero++;   

    }

    ?>       

    </div>
    </td>

    <td style="width: 3%">
    <table style="height: 390px" border="0" cellpadding="0" cellspacing="0">
    <tr style="height: 20%"><td><img id="masarriba" alt="Arriba Rapido" src="/imagenes/masarriba.jpg" style="opacity:0.3; filter:alpha(opacity=29);" onmouseover="control_aviso('masarriba')" onmousedown="control_aviso('masarriba')" onmouseout="control_salir_aviso('masarriba')" /></td></tr>
    <tr style="height: 20%"><td><img id="arriba" alt="Arriba" src="/imagenes/arriba.jpg" style="opacity:0.3; filter:alpha(opacity=29)" onmouseover="control_aviso('arriba')" onmousedown="control_aviso('arriba')" onmouseout="control_salir_aviso('arriba')" /></td></tr>
    <tr style="height: 20%"><td><img id="alto" alt="Detener" src="/imagenes/alto.jpg" style="opacity:0.3; filter:alpha(opacity=29)" onmouseover="control_aviso('alto')" onmousedown="control_aviso('alto')" onmouseout="control_salir_aviso('alto')" /></td></tr>
    <tr style="height: 20%"><td><img id="abajo" alt="Abajo" src="/imagenes/abajo.jpg" style="opacity:0.3; filter:alpha(opacity=29)" onmouseover="control_aviso('abajo')" onmousedown="control_aviso('abajo')" onmouseout="control_salir_aviso('abajo')" /></td></tr>
    <tr style="height: 20%"><td><img id="masabajo" alt="Abajo Rapido" src="/imagenes/masabajo.jpg" style="opacity:0.3; filter:alpha(opacity=29)" onmouseover="control_aviso('masabajo')" onmousedown="control_aviso('masabajo')" onmouseout="control_salir_aviso('masabajo')" /></td></tr>
    </table></table></table>

         
    </div>