<?php
namespace App\Controllers;

use App\Models\CategoriaModel;
use App\Models\OrcamentoModel;

class Orcamento extends BaseController 
{   

    protected $orcamentoModel;
    protected $categoriaModel;

    public function __construct()
    {
        $this->orcamentoModel = new OrcamentoModel();
        $this->categoriaModel = new CategoriaModel();
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

    public function create()
    {
        $data = [
            'titulo' => 'Novo Orçamento',
            'formDropDown' => $this->categoriaModel->addOrder([
                'campo' => 'descricao',
                'sentido' => 'asc'
            ])->addUserId($this->session->id_usuario)->formDropDown([
                'opcaoNova' => true,
                'tipo' => 'd'
            ])
        ];
        echo view('orcamentos/form', $data);
    }

    public function store()
    {
        $post = $this->request->getPost();
        if($this->orcamentoModel->save($post)) {
            return redirect()->to('/mensagem/sucesso')->with('mensagem',[
                'mensagem' => "Orçamento salvo com sucesso.",
                'link' => [
                    'to' => 'orcamento',
                    'texto' => 'Votlar para Orçamentos'
                ]
            ]);
        }
        else {
            $dados = [
                'titulo' => !empty($post['chave']) ? 'Editar Orçamento' : 'Novo Orçamento',
                'errors' => $this->orcamentoModel->errors(),
                'formDropDown' => $this->categoriaModel->addOrder([
                    'campo' => 'descricao',
                    'sentido' => 'asc'
                ])->formDropDown([
                    'tipo' => 'd',
                    'opcaoNova' => true
                ])
            ];
            echo view('orcamentos/form', $dados);
        }
    }

    public function edit($chave)
    {
        $orcamento = $this->orcamentoModel->addUserId($this->session->id_usuario)->getByChave($chave);
        if(!is_null($orcamento)) {
            echo view('orcamentos/form', [
                'titulo' => 'Editar Orçamento',
                'orcamento' => $orcamento,
                'formDropDown' => $this->categoriaModel->addOrder([
                    'campo' => 'descricao',
                    'sentido' => 'asc'
                ])->formDropDown([
                    'tipo' => 'd',
                    'opcaoNova' => true
                ])
            ]);
        }
        else {
            return redirect()->to('mensagem/erro')->with('mensagem', [
                'mensagem' => 'Orçamento não encontrado!',
                'link' => [
                    'to' => 'orcamento',
                    'texto' => 'Voltar para Orçamentos'
                ]
            ]);
        }
    }



}