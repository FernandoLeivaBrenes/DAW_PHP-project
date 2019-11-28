<?php

    /**
     * @author Fernando Leiva Brenes
     * 2018 / 19 
     */

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
            echo "<pre>".print_r($info, true)."</pre>";
            // Damos el atributo al la 
            //$PDO_connection->setAttribute("PDO::ATTR_ERRMODE", PDO::ERRMODE_EXCEPTION);
            //try{

            //} catch (PDOException $e){}
        }
    }
