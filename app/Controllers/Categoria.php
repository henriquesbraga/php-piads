<?php
namespace App\Controllers;

class Categoria extends BaseController 
{   
    //Carrega a view principal de lançamentos
    public function index()
    {
        echo view('categorias/index');
    }
}