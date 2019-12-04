<?php
    /**
     * @author Fernando Leiva Brenes
     * Curso 2018 / 19 
     */

    require_once("libs/class/Session.php");

    // Instanciar la sesión
    $session = Session::getInstance();
    echo "<pre> NO -- ".var_dump( $session , true)."</pre>";

    if ( !$session->isLogged() ):
        $session->redirect("login.php");
    endif;
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>EcoRent</title>
</head>
<body>

    <h1>Test conexion</h1>
    <a href="logout.php">Pa fuera</a>

    <h1><?=$session->getUserName();?></h1>

<?php

    //$session->login();
    
    echo "<pre>".print_r( $_SESSION["_SESSION"] , true)."</pre>";

    //$ses->close();
?>
    
    
</body>
</html>