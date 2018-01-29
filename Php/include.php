<?php
  // ###BFYJ==>
  /*
  * Archivo de configuracion
  */

  $folder_path = "/include/config.path.php";


  $DR     = $_SERVER[DOCUMENT_ROOT];
  $SF     = $_SERVER[SCRIPT_FILENAME];
  $PT     = str_replace($DR, "", dirname($SF));
  $ARR    = explode("/", $PT);
  include $DR . "/" . $ARR[1] . $folder_path;
  // <==BFYJ###
