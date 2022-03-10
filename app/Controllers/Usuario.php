<?php
namespace App\Controllers;

class Usuario extends BaseController 
{   
    //Carrega a view principal de lançamentos
    public function index()
    {
        echo view('usuarios/index');
    }
}