<?php
namespace App\Controllers;

class Lancamento extends BaseController 
{   
    //Carrega a view principal de lançamentos
    public function index()
    {
        echo view('lancamentos/index');
    }
}