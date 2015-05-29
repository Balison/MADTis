<?php
function get_root_path($user_type){
   $path = "/index.php";

   if ($user_type == "asesor")
      $path = "/Vista/inicio_asesor.php";
   else if ($user_type == "grupoEmpresa")
      $path = "/Vista/inicio_grupo_empresa.php";
   else if ($user_type == "administrador")
      $path = "/Vista/principal.php";

   return $path;
}
?>
