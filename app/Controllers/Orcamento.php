<?php
namespace App\Controllers;

use App\Models\OrcamentoModel;

class Orcamento extends BaseController 
{   

    protected $orcamentoModel;

    public function __construct()
    {
        $this->orcamentoModel = new OrcamentoModel();
    }


    //Carrega a view principal de lançamentos
    public function index()
    {
        $search = $this->request->getGet('search');
        $orcamentos = $this->orcamentoModel
        ->addSearch($search, 'orcamentos.descricao')
        ->addUserId($this->session->id_usuario)
        ->addOrder([
            'campo' => 'orcamentos.descricao',
            'sentido' => 'asc'
        ])
        ->getAllWithCategorias();
        $data = [
            'orcamentos' => $orcamentos,
            'search' => $search
        ];
        echo view('orcamentos/index', $data);
    }





}