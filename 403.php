<?php
include "Controlador/root_selector.php";

function display_error($user_type = 'publico'){

$path = get_root_path($user_type);

echo <<< HTML
   <!DOCTYPE html>
   <html>

   <head>
       <title>SAETIS - Acceso restringido</title>
       <link rel="stylesheet" type="text/css" href="/css/error404.css">
   </head>

   <body>
       <div class = "center" align = "center">

           <h1 class="page-header"  >Acceso restringido</h1>
           <p>Lo sentimos, pero usted no cuenta con los privilegios necesarios para acceder a este sitio.</p>
           <a href='$path'>Volver a SAETIS</a><br><br><br><br>
       	   <img  src="/imagenes/403.gif">
       </div>

   </body>

   </html>

HTML;
}
?>
