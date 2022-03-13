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

    public function create()
    {
        $data = [
            'titulo' => 'Nova Categoria'
        ];
        echo view('categorias/form', $data);
    }

    public function store()
    {
        $post = $this->request->getPost();
        if($this->categoriaModel->save($post)) {
            return redirect()->to('/mensagem/sucesso')->with('mensagem', [
                'mensagem' => 'Registro salvo com sucesso',
                'link' => [
                    'to' => 'categoria',
                    'texto' => 'Voltar para Categorias'
                ]
            ]);
        }
        else {
            echo view('categorias/form', [
                'titulo' => !empty($post['chave']) ?' Editar Categoria' : 'Nova Categoria',
                'errors' => $this->categoriaModel->errors()
            ]);
        }
    }

    public function edit($chave)
    {
        $categoria = $this->categoriaModel->addUserId($this->session->id_usuario)->getByChave($chave);

        if(!is_null($categoria)){
            $data = [
                'titulo' => 'Editar Categoria',
                'categoria' => $categoria
            ];
            echo view('categorias/form', $data);
        }
        else {
            return redirect()->to('/mensagem/erro')->with('mensagem', [
                'mensagem' => 'Categoria não encontrada',
                'link' => [
                    'to' => 'categoria',
                    'texto' => 'Voltar para Categorias'
                ]
            ]);
        }

        
    }

    public function delete($chave = null)
    {
        if ($this->categoriaModel->addUserId($this->session->id_usuario)->delete($chave))
        {
            return redirect()->to('/mensagem/sucesso')->with('mensagem', [
                'mensagem' => 'Categoria deletada com sucesso',
                'link' => [
                    'to' => 'categoria',
                    'texto' => 'Voltar para Categorias'
                ]
            ]);
        }
        else {
            return redirect()->to('/mensagem/erro')->with('mensagem', [
                'mensagem' => 'Erro ao excluir a categoria',
                'link' => [
                    'to' => 'categoria',
                    'texto' => 'Voltar para Categorias'
                ]
            ]);
        }
    }
}