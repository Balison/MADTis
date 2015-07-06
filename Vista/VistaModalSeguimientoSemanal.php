<?php
require_once '../Modelo/Model/Planificacion.php';
require_once '../Modelo/Model/Entregable.php';
require_once '../Modelo/Model/Registro.php';
require_once '../Modelo/Model/Precio.php';
require_once '../Modelo/Model/FechaRealizacion.php';
require_once '../Modelo/Model/Reporte.php';

$funcion = $_POST['funcion'];
$u = $_POST['usuario'];
$rr = Reporte::listaRolesReporte();
switch ($funcion){
    case 'registrar reportes':
        $conexion = new Conexion();
        $conexion->conectar();
        $format='Y-m-d';
        $today = date($format);
        

        $rolesReporte = '<div class="container">';
        for($i =0;$i<count($rr);$i++){
            $rolesReporte .='<input type="radio" name="roles" value="'.$rr[$i].'">';
            $rolesReporte .='<label for = '.$rr[$i].'>';
            $rolesReporte .=''.$rr[$i].'</label><br>';
        }
        $rolesReporte .='</div>';
        ?>
        <div class="container">    
            <div id="registrarActividad">
                <fieldset><legend>Registro de las actividades, <?php echo $u; ?></legend></fieldset>
                <div class="bs-callout bs-callout-info">
                    <h4>Nota</h4>
                    <p>
                        Elija un rol y escriba las actividades a realizarse...
                    </p>
                </div>
                <div class="col-md-6">
                    
                        <div class="col-md-4">
                              <label>Rol</label><br/>

                            <?php echo $rolesReporte; ?>                                     
                        </div>
                        <div class="col-md-8">
                              <label>Actividad</label><br/>
                              <textarea class="form-control" rows="3" name="act" id="act" maxlength="100"></textarea>
                              <input id = "funcion" type="hidden" name="funcion" value="setActividad">
                              <input id = "grupoE" type="hidden" name="grupoE" value="<?php echo $u; ?>">
                              <br/>
                              <div class="col-md-12">
                                  <button onclick="setActividad()" id="submit" class="btn btn-primary">Agregar</button>
                              </div>                      
                        </div>
                    
                </div>
                <div id="getActividad" class="col-md-6">
                    <label>Actividades programadas</label><br/>
                    <?php
                      $seguimientos=$conexion->consulta("SELECT `ID_S`, `ROL_S`,`ACTIVIDAD_S` FROM seguimiento WHERE seguimiento.GRUPO_S='$u' AND FECHA_S ='$today'");
                      $numLines=  mysql_num_rows($seguimientos);
                      if($numLines==0){
                          echo 'No hay actividades programadas para la fecha.';
                      }
                      else{
                    ?>
                    <table class="table table-striped col-md-12">
                        <thead>
                            <tr>
                                <th class="col-md-3">Rol</th>
                                <th class="col-md-6">Actividad</th>
                                <th class="col-md-3">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            while($seg =  mysql_fetch_array($seguimientos)){
                                $id=$seg[0];
                                $rolGE=$seg[1];
                                $actividad=$seg[2];                                
                                echo "<tr>";
                                echo '<td>'.$rolGE.'</td>';
                                echo '<td>'.$actividad.'</td>';
                                echo '<td><button onclick="delActividad('.$id.')" class="btn btn-xs btn-danger btnBorrarReporte"><i class="fa fa-times"></i></button></td>';
                                echo "</tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                    <?php
                      }
                    
                    echo '<div class="col-md-12">
                        <button onclick="ejecutarSeguimiento()" type="button" class="btn btn-primary"'; 
                            if($numLines==0){
                                echo 'disabled="disabled"';
                            }
                                ?> 
                                >Ejecutar Seguimiento</button>
                    </div>
                </div>           
                
            </div>
        </div>
        
        <?php
        break;
    case 'ejecutar seguimiento':
        $conexion = new Conexion();
        $conexion->conectar();
        $format='Y-m-d';
        $today = date($format);
        $actEjecutados=$conexion->consulta("SELECT `ROL_S`,`ACTIVIDAD_S`,`RESULTADO_S`,`CONCLUSION_S`,`OBSERVACION_S` FROM seguimiento  WHERE seguimiento.GRUPO_S='$u' AND FECHA_S ='$today' AND HECHO_S=1");
        $ejecutarAct=$conexion->consulta("SELECT `ROL_S`,`ACTIVIDAD_S`,`RESULTADO_S`,`CONCLUSION_S`,`OBSERVACION_S`, `ID_S`  FROM seguimiento  WHERE seguimiento.GRUPO_S='$u' AND FECHA_S ='$today' AND HECHO_S=0");
        $numEjecutados=  mysql_num_rows($actEjecutados);
        $numEjecutar=  mysql_num_rows($ejecutarAct);
        ?>
<div class="container">
    <div id="ejecutaractividad">
        <?php
        if($numEjecutados>0 || $numEjecutar>0){
        ?>
        <fieldset><legend>Ejecucion de las actividades programadas</legend></fieldset>
        <!-- Aca se muestra las actividades ya ejecutadas -->
        <?php
        }
        if($numEjecutados>0){
        ?>
        <h4>Actividades ejecutadas</h4>
        <div class="col-md-12">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <td class="col-md-1">Rol</td>
                        <td class="col-md-2">Actividad</td>
                        <td class="col-md-3">Resultado</td>
                        <td class="col-md-3">Conclusion</td>
                        <td class="col-md-3">Observacion</td>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    while($ejecutados =  mysql_fetch_array($actEjecutados)){
                        $rol=$ejecutados[0];
                        $act=$ejecutados[1];
                        $res=$ejecutados[2];
                        $con=$ejecutados[3];
                        $obs=$ejecutados[4];
                        echo '<tr>';
                        echo '<td>'.$rol.'</td>';
                        echo '<td>'.$act.'</td>';
                        echo '<td>'.$res.'</td>';
                        echo '<td>'.$con.'</td>';
                        echo '<td>'.$obs.'</td>';
                        echo '</tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
        <?php
        }
        if($numEjecutar >0){
        ?>
        <h4>Ejecutar actividades</h4>

        <div class="col-md-12">
            
            <table class="table table-striped">
                <thead>
                    <tr>
                        <td class="col-md-1">Rol</td>
                        <td class="col-md-3">Actividad</td>
                        <td class="col-md-2">Resultado</td>
                        <td class="col-md-2">Conclusion</td>
                        <td class="col-md-2">Observacion</td>
                        <td class="col-md-2">Acciones</td>
                    </tr>
                </thead>
            
        
                    <?php
                    while($ejecutar =  mysql_fetch_array($ejecutarAct)){
                        $rol=$ejecutar[0];
                        $act=$ejecutar[1];
                        $res=$ejecutar[2];
                        $con=$ejecutar[3];
                        $obs=$ejecutar[4];
                        $id=$ejecutar[5];
                        ?>
                
                    <input type="hidden" id="idS" value="<?php echo $id ?>">
                    
                    <input type="hidden" id="grupoE" value="<?php echo $u ?>">
                    <?php
                        echo '<tr>';
                        echo '<td>'.$rol.'</td>';
                        echo '<td>'.$act.'</td>';
                        echo '<td><textarea class="form-control" rows="3" id="resultado'.$id.'"></textarea></td>';
                        echo '<td><textarea class="form-control" rows="3" id="conclusion'.$id.'"></textarea></td>';
                        echo '<td><textarea class="form-control" rows="3" id="observacion'.$id.'"></textarea></td>';
                        echo '<td><button onclick="updActividad('.$id.')" type="button" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-ok-sign"></span></button></td>';
                        echo '</tr>';
                        ?>
                    
                    <?php
                    }
                    ?>                
            
                
            </table>
            
        </div>
        <?php
        }
        ?>
    </div>
</div>
        <?php
        break;
        
        
        case 'registrar seguimiento':
      $conexion = new Conexion();
      $conexion->conectar();
      $fechas=$conexion->consulta("SELECT DISTINCT `FECHA_S` FROM seguimiento WHERE seguimiento.GRUPO_S='$u' ORDER BY FECHA_S DESC ");
      
      
      ?>
      
 

      <?php


      while ($fechasSegui = mysql_fetch_array($fechas))
     { 
         $fechaArr=$fechasSegui[0];

         echo "<div class='bs-callout bs-callout-info'>
              <h4>".$fechaArr."</h4>
          </div>";
          $peticionGE = $conexion->consulta("SELECT `ROL_S`,`ACTIVIDAD_S`,`HECHO_S`,`RESULTADO_S`,`CONCLUSION_S`,`OBSERVACION_S`  FROM seguimiento WHERE seguimiento.GRUPO_S='$u' AND FECHA_S ='$fechaArr'");
        
             while ($seguimiento = mysql_fetch_array($peticionGE))
            { 


                $rolGE=$seguimiento[0];
                $actividad=$seguimiento[1];
                $hechoGE=$seguimiento[2];
                $resultado=$seguimiento[3];
                $conclusion=$seguimiento[4];
                $obserGE=$seguimiento[5];
               

              
                if($hechoGE=="1")
                {
                  $hechoGE1="si";
                }
                else
                {
                  $hechoGE1="no";
                }
               
                $tabla="<b>Rol:</b> ".$rolGE."</br>
                <b>Hecho:</b> ".$hechoGE1."</br>";

                $tabla.=" <form class='form-horizontal'> <fieldset class='campos-border'> <table class='table table-bordered table-responsive table-highlight'>
                 <thead>
                   <tr>
                      
                      <th>Actividad</th>
                      <th>Resultado</th>
                      <th>Conclusion</th>
                      <th>Observacion</th>
                   </tr>";
             
                $tabla.="<tr>
                                
                                       <td class='col-md-2'>
                                           <div class='form-group'>
                                               <div class='col-md-12'>
                                                   ".$actividad."
                                               </div>
                                           </div>
                                       </td>";
                                    


                    
                                                   
                            $tabla.= "
                                       <td class='col-md-2'>
                                           <div class='form-group'>
                                               <div class='col-md-12'>
                                                   ".$resultado."
                                               </div>
                                           </div>
                                       </td>
                                       <td class='col-md-2'>
                                           <div class='form-group'>
                                               <div class='col-md-12'>
                                                   ".$conclusion."
                                               </div>
                                           </div>
                                       </td>
                                       <td class='col-md-2'>
                                           <div class='form-group'>
                                               <div class='col-md-12'>
                                                   ".$obserGE."
                                               </div>
                                           </div>
                                       </td>
                                       
                                   </tr>";
                
                 
               
                $tabla.=" </thead> 
                </table> </fieldset></form></div>";
                echo $tabla;

               
                         
         }

        

    } 
      

      break;
}

//funciones a los eventos onclick
?>
<script>
function setActividad(){
    var list=$("#getActividad");
    console.log($("#act").val());
    console.log($("input[name='roles']:checked").val());
    if($("input[name='roles']:checked").val() !== '' && $("#act").val() !== '' && 
            $("input[name='roles']:checked").val() !== undefined){
    $.ajax({
        type: 'POST',
        url: "/Controlador/RegistrarSeguimientoSemanal.php",
        cache: false,
        dataType: 'html',
        data: {
            act: $("#act").val(),
            rol: $("input[name='roles']:checked").val(),
            funcion: $("#funcion").val(),
            grupoE: $("#grupoE").val()
        }
    }).done(function(res) {
        list.empty();
        //console.log(res);
        list.append(res);
    });
    $("#act").val("");
    }
    else
        alert("campos requeridos");
}
function updActividad(id){
    var c=$("#ejecutaractividad");
    console.log(id);
    console.log($("#resultado"+id).val());
    console.log($("#conclusion"+id).val());
    console.log($("#observacion"+id).val());
    //console.log($("#funcion").val());
    console.log($("#grupoE").val());
    $.ajax({
        type: 'POST',
        dataType: 'html',
        url: "/Controlador/RegistrarSeguimientoSemanal.php",
        cache: false,
        data: {
            idS:id,
            funcion:'updateActividad',
            grupoE:$("#grupoE").val(),
            resultado:$("#resultado"+id).val(),
            conclusion:$("#conclusion"+id).val(),
            observacion:$("#observacion"+id).val()
        }
    }).done(function (res){
        c.empty();
        c.append(res);
    });
}
function delActividad(id){
    var list=$("#getActividad");
        $.ajax({
        type: 'POST',
        dataType: 'html',
        url: "/Controlador/RegistrarSeguimientoSemanal.php",
        cache: false,
        data:{
            idS:id,
            grupoE:$("#grupoE").val(),
            funcion:'deleteActividad'
        }
    }).done(function (res){
        list.empty();
        list.append(res);
    });
}
function  ejecutarSeguimiento(){
    var u = $("#grupoE").val();
    var funcion='ejecutar seguimiento';
    $.ajax({
        type:'POST',
        dataType: 'html',
        url: "VistaModalSeguimientoSemanal.php",
        cache: false,
        data:{
            usuario: u,
            funcion: funcion
        }
    }).done(function(res){
        
        $('.modalRegistroReportes').find('.modal-body').load('VistaModalSeguimientoSemanal.php', {
            funcion:funcion,
            usuario:u
        });
        $('.modalRegistroReportes').modal('show');
    });
}
</script>