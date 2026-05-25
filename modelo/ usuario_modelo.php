<?php
    require (__DIR__."/../config/conexion.php");
    
    // funcion para buscar un usuario por su login
    function validar_usuario($login, $password)
    {
        // Establecer conexión con la BD

        $conexion = conectar();

        echo "<br>función validar_usuario, del modelo, ejecutándose...";

        // Instruccion SQL para hacer la consulta a la BD
        $sql = "SELECT id_usuario, login_usuario, password_usuario, estado_usuario, tipo_usuario, COUNT(*) AS contar FROM Usuario WHERE login_usuario = '$login' AND password_usuario = '$password'";

        // Ejecutar la consulta SQL a la BD
        $consulta = mysqli_query($conexion, $sql) or trigger_error("Error en la consulta MySql: ".mysqli_error($conexion));

        // Convertir consulta en array
        //$resultado = mysqli_fetch_array($consulta);
        $resultado = mysqli_fetch_assoc($consulta);

        // verificar si el usuario existe en la BD
        if($resultado['contar']>0)
        {
            echo '<br>El usuario existe en la BD';
            echo '<br>Usuario: '.$resultado['login_usuario'];
            echo '<br>Id: '.$resultado['id_usuario'];
            echo '<br>Tipo: '.$resultado['tipo_usuario'];
            echo '<br>Estado: '.$resultado['estado_usuario'];
        }
        else
        {
            echo '<br>El usuario no existe, o login o password incorrecto';
        }

        return $resultado;
    }

    
    // probar consulta a BD

    $user = 'osanchez';
    $pass = 12345;

    echo 'Probando consulta...';
    echo '<br>'.$user;
    echo '<br>'.$pass;
    

    validar_usuario($user, $pass);

?>