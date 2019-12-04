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

<?php
    require_once "./libs/class/Session.php";

    $ses = Session::getInstance();

    $ses->login();
    
    print_r( $ses , true );
?>
    
</body>
</html>