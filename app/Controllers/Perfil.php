<?php
namespace App\Controllers;

class Perfil extends BaseController 
{   
    //Carrega a view principal de lançamentos
    public function index()
    {
        echo view('perfis/index');
    }
}