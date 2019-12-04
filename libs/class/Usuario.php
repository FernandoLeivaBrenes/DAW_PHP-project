<?php

    /**
     * @author Fernando Leiva Brenes
     * 2018 / 19 
     */

    class Usuario
    {
        private $uuid_usuario;
        private $nombre;
        private $apellido_1;
        private $apellido_2;
        private $email;
        private $passwd;
        private $fecha_nacimiento;
        private $fecha_inicio;
        private $tipo_usuario;
        private $API_code;
        
        public function __construct() {}

        public function getUUID(){
            return $this->uuid;
        }

        public function setUUID( $uuid ){
            return $this->uuid = $uuid;
        }

        public function getNombre(){
            return $this->nombre;
        }

        public function setNombre( $nombre ){
            return $this->nombre = $nombre;
        }

        public function getApellido1(){
            return $this->apellido1;
        }

        public function setApellido1( $apellido1 ){
            return $this->apellido1 = $apellido1;
        }

        public function getApellido2(){
            return $this->apellido2;
        }

        public function setApellido2( $apellido2 ){
            return $this->apellido2 = $apellido2;
        }

        public function getEmail(){
            return $this->email;
        }

        public function setEmail( $email ){
            return $this->email = $email;
        }

        public function getPasswd(){
            return $this->passwd;
        }

        public function setPasswd( $passwd ){
            return $this->passwd = $passwd;
        }

        public function getFecha_nacimiento(){
            return $this->fecha_nacimiento;
        }

        public function setFecha_nacimiento( $fecha_nacimiento ){
            return $this->fecha_nacimiento = $fecha_nacimiento;
        }

        public function getFecha_inicio(){
            return $this->fecha_inicio;
        }

        public function setFecha_inicio( $fecha_inicio ){
            return $this->fecha_inicio = $fecha_inicio;
        }

        public function getTipo_usuario(){
            return $this->tipo_usuario;
        }

        public function setTipo_usuario( $tipo_usuario ){
            return $this->tipo_usuario = $tipo_usuario;
        }

        public function getAPI_code(){
            return $this->API_code;
        }

        public function setAPI_code( $api ){
            return $this->API_code = $api;
        }

        public function __toString()
	    {
	    	return $this->nombre." ".$this->apellido1." ".$this->email ;
	    }

    }