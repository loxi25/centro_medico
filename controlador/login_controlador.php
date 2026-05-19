<?php
    require_once `.. /modelo/usuario_modelo.php`;

    // mostrar formulario
    function mostrar_login()
    {
        require_once `.. /vista/login_vista.php`;

    }

    // procesar credenciales
    function autenticar()
    {
        if($_SERVER[`REQUEST_METHOD`] == `POST`)
        {
            $login = $_POST[`login`];
            $pass  = $_POST[`password`];

            $usuario = validar_usuario($login, $pass);

            if($usuario)
            {
                header("location : index.php");
            }
            else 
            {
                echo `credenciales incorrectas`;
            }

        }

    }