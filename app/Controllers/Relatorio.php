<?php
namespace App\Controllers;

class Relatorio extends BaseController 
{   
    //Carrega a view principal de lançamentos
    public function index()
    {
        echo view('relatorio/index');
    }
}