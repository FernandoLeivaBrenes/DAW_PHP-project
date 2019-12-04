<?php

require_once("./libs/class/Database_PDO.php");
require_once("./libs/class/Usuario.php");

class Session
{
    private $user ; 
    private $time_expire = 30000 ;				// segundos
    private static $instance = null ;
    
    private function __construct() { }

    private function __clone() { }

    public function __sleep()
    {
        return ["user", "instance"] ;
    }

    public static function getInstance()
    {
        session_start() ;

        // Comprobamos que la variable _SESSION variable gobal $_SESSION este indicada
        if (isset($_SESSION["_SESSION"])):
            self::$instance = unserialize($_SESSION["_SESSION"] ) ;
        else:
            if (self::$instance===null) 
                self::$instance = new Session() ;
        endif ;

        // Devolvemos la instancia
        return self::$instance ;
    }

    /**
     * Comprueba que $_SESSION no este vacío
     * 
     * @return bool
     */
    public function isLogged():bool
    {
        return !empty($_SESSION) ;
    }

    public function close()
    {
        // Vaciamos las variables de sesión
        $_SESSION = [] ;

        // Destruimos la sesión
        session_destroy() ;
    }

    public function login():bool
		{
			// Instanciamos la clase Database_PDO
			$dbPDO = Database_PDO::getInstance( "ecorent", "root", "" ) ;

			// buscamos el usuario
            //$sql  = "SELECT * FROM usuario WHERE email=:ema AND pass=MD5(:pas) ; " ;
            $sql = "SELECT * FROM usuario WHERE email='Fernando@fernando.1.es' ";//AND pass=SHA2('1234') ;" ;
            $info = array(
                "sql"=>$sql ,
                "opciones"=>"ni una"
            );
			

            if ($dbPDO->query($info)):

				// rescatar la información del usuario
                $this->user = $dbPDO->getObject("Usuario");
                echo "<pre>".print_r($this->user, true)."</pre>";

				// si el usuario es correcto, iniciamos la sesión
				// guardamos el momento (segs.) en que se inicia
				// la sesión
				$_SESSION["time"]    = time() ;
				$_SESSION["_SESSION"] = serialize(self::$instance) ;

				// la sesión se ha iniciado
                return true ;

			endif ;

			// la sesión no se ha iniciado
			return false ;
		}

}