<?php
namespace App\Controllers;

class Orcamento extends BaseController 
{   
    //Carrega a view principal de lançamentos
    public function index()
    {
        echo view('orcamentos/index');
    }
}