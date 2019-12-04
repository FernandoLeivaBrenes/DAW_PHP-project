<?php

    /**
     * @author Fernando Leiva Brenes
     * Curso 2018 / 19 
     */
    include_once "libs/class/Usuario.php";

    class Database_PDO
    {
        private $host = "localhost";

        private $dbName ;
        private $dbUser ;
        private $dbPass ;

        // $dsn - nombre de origen de datos, def necesaria en PDO
        private $dsn;

        private $PDO_connection = null ;
        private $result = null ;
        private static $instance = null ;
        

        /**
         * Constructor de la clase 
         * 
         * @param $dbNam  - nombre BBDD
         * @param $dbUse  - usuario
         * @param $dbPas  - contraseña
         */
        private function __construct( $dbNam , $dbUse , $dbPas )
        {
            $this->dbName = $dbNam;
            $this->dbUser = $dbUse;
            $this->dbPass = $dbPas;

            $this->dsn = "mysql:dbname=".$this->dbName.";host=".$this->host.";charset=UTF8";

            $this->connect();
        }

        /**
		 * Destructor de la clase
		 */
		public function __destruct()
		{
			$this->PDO_connection = null ;
        }
        
        /*
         * Hacemos privado el método para evitar clonaciones
         */
        private function __clone() { }
        
        /**
		 * Cuando el objeto se deserializa, conectamos de nuevo
		 * con el motor de base de datos.
		 */
		public function __wakeup()
		{
			$this->connect() ;
        }
        
        /**
         * Establecer conexión a la base de datos
         */
        private function connect()
        {
            try{
                $this->PDO_connection = new PDO( $this->dsn , $this->dbUser , $this->dbPass ) or die ("Error: Can't set PDO_connection");
            } catch ( PDOException $e ){
                echo "Error : ".$e->getMessage() ;
            }
        }

        /**
		 * Usamos el patrón de diseño SINGLETON que nos permitirá
		 * tener una única instancia de la clase DATABASE.
		 *
		 * @param $dbNam
         * @param $dbUse
         * @param $dbPas
		 */
		public static function getInstance( $dbNam , $dbUse , $dbPas )
		{
			// si no existe instancia la creamos
			if (self::$instance==null)
                self::$instance = new Database_PDO( $dbNam , $dbUse , $dbPas ) ;

			// devolvemos la instancia
			return self::$instance ;
		}

        /**
         * Realizaremos consultas y devolvemos:
         * TRUE para una consulta correctamente preparada y o realizada
         * FALSE en caso de recibir alguna excepcion de tipo PDOException
         * 
         * @param $
         * @return bool
         */
        public function query($info)
        {
            //echo "<pre>".print_r($info, true)."</pre>";
            
            try{
                // Damos el atributo ERRMODE_EXCEPTION que habilita el lanzamiento de excepciones
                $this->PDO_connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                //Revisar la entrada de datos
                $sqlBefore = $info["sql"];
            
                $this->result = $this->PDO_connection->prepare($sqlBefore);
                
                $this->result->execute();
            } catch (PDOException $e){
                $this->result = "ERROR --> ".$e;
            }
            echo "<pre>".print_r($this->result, true)."</pre>";
            return $this->result;
        }

        public function getObject($cls = "StdClass")
		{
			if (is_null($this->result)) return null ;
			// si tenemos un resultado, lo devolvemos
			return $this->result->fetchObject($cls) ;
        }
        
        
    }
