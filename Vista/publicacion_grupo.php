<?php
 require_once("MenuGE.php");
?>
        <div id="page-wrapper">

            
                     <h2 class="page-header">Documentos recibidos</h2>
                    <div class="panel panel-default" >

              
                        
                         

                             
                            <table class="table form-group" >
                                 
                                                     <tr bgcolor="#888888">
                                                          <th> Nº</th>
                                                          <th >Nombre<th>
                                                          <th >Descripcion</th>  
                                                          <th></th>
                                                          
                                                     </tr> 

 
                                <?php
                                   //gestion**
                                     $selDoc=$conexion->consulta("SELECT DISTINCT `NOMBRE_R`,`RUTA_D`,`DESCRIPCION_D`,`fecha_p` ,`hora_p`,`RECEPTOR_R`,r.`NOMBRE_U` FROM `registro` AS r,`documento` AS d,`descripcion` AS e,`periodo` AS p,`receptor` AS w, `inscripcion_proyecto` AS i, `proyecto` AS a, `gestion` AS g WHERE r.`ID_R` = d.`ID_R` AND r.`ID_R` = e.`ID_R` AND r.`ID_R` = p.`ID_R` AND r.`ID_R` = w.`ID_R` AND r.`TIPO_T` LIKE 'publicaciones' and i.`CODIGO_P` = a.`CODIGO_P` and a.`ID_G` = g.`ID_G` and (DATE (p.`fecha_p`) >= DATE(FECHA_INICIO_G) and DATE(p.`fecha_p`) <= DATE(FECHA_FIN_G))");
                                     
                                   
                                    if(mysql_num_rows($selDoc) != 0)
                                    {    $i=1;
                                           while($docPubli = mysql_fetch_array($selDoc))
                                          {
                                            $auxDoc=$docPubli['2'];
                                            $docDest=$docPubli[5];
           
                                            $selNom=$conexion->consulta("SELECT `NOMBRE_LARGO_GE` FROM `grupo_empresa` WHERE `NOMBRE_U`='$uActivo'");
                                            $nomLargo = mysql_fetch_array($selNom);
                                           
                                            if($docDest==$nomLargo[0] || $docDest=="PUBLICO")
                                            {
                                                $docUbi= $docPubli[1];
                                                
                                                $fepDoc=$docPubli[3];
                                                $hopDoc=$docPubli[4];
                                                $fechaA       = date('Y-m-d');
                                                $horaA        =  date("G:H:i");
                                           
                                                if($fechaA >= $fepDoc )
                                                {     
                                                    if($horaA >= $hopDoc || $horaA <= $hopDoc){
                                                        

                                                        if(!empty($docUbi))
                                                        {
                                              
                                                        ?>

                                                            <tr> 
                                                          <td><?php echo $i?></td> 
                                                          <td><a class="link-dos" target="_blank" href="<?php echo $docPubli[1] ?>"><?php echo $docPubli[0]?></a><td>

                                                          <td><?php echo $docPubli[2]?></td> 
                                                          <td> </td>
                                                         
                                                         </tr>


                                                        <?php
                                                    }

                                              }
                                              $i++;  
                                             }
                                           else{}
                                                
                                          }

                                        if($docDest=="Todas las Grupo Empresas")
                                        {
                                            $estaIns=$conexion->consulta("SELECT `NOMBRE_UA` FROM `inscripcion` WHERE `NOMBRE_UGE`='$uActivo'");
                                            $nomAseso=mysql_fetch_array($estaIns);
                                            if($nomAseso[0]==$docPubli[6])
                                            {
                                                $docUbi= $docPubli[1];
                                                
                                                $fepDoc=$docPubli[3];
                                                $hopDoc=$docPubli[4];
                                                $fechaA       = date('Y-m-d');
                                                $horaA        =  date("G:H:i");

                                                if($fechaA >= $fepDoc )
                                                {     
                                                    if($horaA >= $hopDoc || $horaA <= $hopDoc)
                                                    {
                                                         if(!empty($docUbi))
                                                        {
                                            
                                                        ?>
                                                         <tr> 
                                                          <td><?php echo $i?></td> 
                                                          <td><a class="link-dos" target="_blank" href="<?php echo $docPubli[1] ?>"><?php echo $docPubli[0]?></a><td>

                                                          <td><?php echo $docPubli[2]?></td> 
                                                          <td> </td>
                                                         
                                                         </tr>


                                                        <?php
                                                     }
                                                      $i++;  
                                                 }
                                               }

                                          }
                                    
                                       }
                                       else{}


                                         if($docDest=="Todos los Proyectos")
                                        {
                                            $estaInsP=$conexion->consulta("SELECT `CODIGO_P` FROM `inscripcion_proyecto` WHERE `NOMBRE_U`='$uActivo'");
                                            $enProyec=mysql_num_rows($estaInsP);
                                            if($enProyec>0)
                                            {
                                                $docUbi= $docPubli[1];
                                                
                                                $fepDoc=$docPubli[3];
                                                $hopDoc=$docPubli[4];
                                                $fechaA       = date('Y-m-d');
                                                $horaA        =  date("G:H:i");

                                                if($fechaA >= $fepDoc )
                                                {     
                                                    if($horaA >= $hopDoc || $horaA <= $hopDoc)
                                                    {
                                                        if(!empty($docUbi))
                                                        {
                                            
                                                        ?>
                                                            <tr> 
                                                            <td><?php echo $i?></td> 
                                                            <td><a class="link-dos" target="_blank" href="<?php echo $docPubli[1] ?>"><?php echo $docPubli[0]?></a><td>

                                                          <td><?php echo $docPubli[2]?></td> 
                                                          <td> </td>
                                                         
                                                     </tr>



                                                        <?php
                                                     }
                                                      $i++;  
                                                   }  
                                               }

                                          }
                                    
                                       }
                                       else{}

                                        $desProy=$conexion->consulta("SELECT DISTINCT `NOMBRE_U`FROM `proyecto` AS p,`inscripcion_proyecto` AS i WHERE p.`CODIGO_P` = i.`CODIGO_P` AND i.`NOMBRE_U` = '$uActivo' AND  p.`Nombre_P` LIKE '$docDest' ");
                                        $tamProy=mysql_num_rows($desProy);
                                         $nombreP=mysql_fetch_array($desProy);
                                        if($tamProy>0)
                                        {

                                            if($nombreP[0]==$uActivo)
                                            {
                                                    $docUbi= $docPubli[1];
                                                
                                                $fepDoc=$docPubli[3];
                                                $hopDoc=$docPubli[4];
                                                $fechaA       = date('Y-m-d');
                                                $horaA        =  date("G:H:i");

                                                  if($fechaA >= $fepDoc )
                                                {     
                                                    if($horaA >= $hopDoc || $horaA <= $hopDoc)
                                                    {
                                                        if(!empty($docUbi))
                                                        {

                                                    ?>
                                                     <tr> 
                                                          <td><?php echo $i?></td> 
                                                          <td><a class="link-dos" target="_blank" href="<?php echo $docPubli[1] ?>"><?php echo $docPubli[0]?></a><td>

                                                          <td><?php echo $docPubli[2]?></td> 
                                                          <td> </td>
                                                         
                                                     </tr>


                                                    <?php
                                                     }
                                                   $i++;  
                                                }   



                                            }
                                        }



                                      }
									  else{}
                                       ?>
                                      
                                      
                                       <?php
                                            //echo "</form>";
                                    //$tabla.="</table>";
                                     //echo $tabla;
                                       }
									   ?>
									    </table>
										<?php
									}
                                    else
                                    {
                                        echo  "<b>NO SE ENCONTRO DOCUMENTOS</b><br><br>";
                                    }
                                     
                                   
                                    
                                
                                
                                $conexion->cerrarConexion();
                                
                                

                                ?>
              
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









