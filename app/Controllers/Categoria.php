<?php
namespace App\Controllers;

use App\Models\CategoriaModel;

class Categoria extends BaseController 
{   
    protected $categoriaModel;

    public function __construct()
    {
        $this->categoriaModel = new CategoriaModel();
    }

    //Carrega a view principal de lançamentos
    public function index()
    {
        session()->id_usuario = 1;
        $search = $this->request->getGet('search');
        //recuperar todos os dados
        
        $categorias = $this->categoriaModel
        ->addUserId($this->session->id_usuario)
        ->addSearch($search)
        ->addOrder([
            'order' => [
                'campo' => 'tipo',
                'sentido' => 'desc'
            ],
            [
                'campo' => 'descricao',
                'sentido' => 'asc'
            ]
        ])
        ->paginate(5);
        
        $data = [
            'categorias' => $categorias,
            'pager' => $this->categoriaModel->pager,
            'search' => $search
        ];
        echo view('categorias/index', $data);
    }
}