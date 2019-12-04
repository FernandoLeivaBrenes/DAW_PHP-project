<?php
    /**
     * @author Fernando Leiva Brenes
     * Curso 2018 / 19 
     */

    require_once("libs/class/Session.php");

    // Instanciar la sesión
    $session = Session::getInstance();

    if( !$session->isLogged() ):
        $session->redirect("login.php");
    else:
        $session->close();
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

    <h1>Estas deslogueado</h1>
    <p>Pulsa <a href="login.php">aqui</a> para volver al main</p>

<?php
    
    echo "<pre> NO -- ".print_r( $_SESSION["_SESSION"] , true)."</pre>";

    //$ses->close();
?>
    
</body>
</html>