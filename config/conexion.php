<?php
    // script para crear una conexión con la BD

    require_once 'constantes.php';

    function conectar()
    {
        // Conexión con la BD
        $conexion = mysqli_connect(HOST, USER, PW, BD); 

        // Establecer conjunto de caracteres para el hosting
        mysqli_set_charset($conexion, 'utf8mb4'); 

        // Verificar la conexión con la BD

        if (!$conexion) 
        {
            die("La conexión con la BD falló: ".mysqli_connect_error());  
        }
        /*else
        {
            die("<br>Conexión a la BD exitosa!"); 
        }*/
        return $conexion;
    }
    //Probar conexión
    /*echo '<br>Probando conexión con la BD...';
    $con = conectar();*/
?>
