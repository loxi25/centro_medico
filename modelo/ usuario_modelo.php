<?php
    require_once "../config/conexion.php";
    
    // Funcion para buscar un usuario por su login 
    function validar_usuario($login, $password)

    {
        // establecer conexion con la BD
        $conexion = $conectar();

        // Instruccion sql para hacer la consulta a la BD
        $sql = "SELECT login_usuario, password_usuario, estado_usuario, tipo_usuario, COUNT(*) AS contar FROM Usuario WHERE login_usuario = '$login' AND password_usuario ='$password'";

        // Ejecutar la consulta sql a la BD
        $consulta = mysqli_query($conexion, $sql ) or trigger_error("Error en la consulta sql: " + mysqli_error($conexion));

        // Convertir consultas en un array
        $resultado = mysqli_fetch_array($consulta);

        // Verificar si el usuario existe en la BD
        if($resultado['contar'] >0)
        {
            echo 'El usuario existe en la BD';
            echo $resultado['login_usuario'];


        }
        else 
        {
            echo "el usuario no existe en la BD o usuario o contraseña incorrectos";
            echo 
        }
    }

    
?>