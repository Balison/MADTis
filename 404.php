<?php
session_start();
include "Controlador/root_selector.php";
$path = "/index.php";
if (isset($_SESSION['tipoUsuario'])){
   $path = get_root_path($_SESSION['tipoUsuario']);
}

echo <<< HTML
   <!DOCTYPE html>
   <html>

   <head>
       <title>SAETIS - Sitio no encontrado</title>
       <link rel="stylesheet" type="text/css" href="/css/error404.css">
   </head>

   <body>
       <div class = "center" align = "center">

           <h1 class="page-header"  >Sitio no encontrado</h1>
           <p>Lo sentimos, pero la pagina que busca no existe o no se puede encontrar.</p>
           <a href='$path'>Volver a SAETIS</a><br>
           <img  src="/imagenes/error404.png">
       </div>

   </body>

   </html>
HTML;

?>
