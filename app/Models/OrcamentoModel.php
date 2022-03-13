<?php

namespace App\Models;

class OrcamentoModel extends BaseModel
{
    protected $table = 'orcamentos';
    protected $primaryKey = 'chave';
    protected $useSoftDeletes = true;
    
    protected $deletedField = 'deleted_at';
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $beforeDelete = ['checaPropriedade'];
    protected $useTimestamps = true;
    protected $beforeInsert = ['vinculaIdUsuario', 'geraChave'];
    // protected $beforeUpdate = [];
    protected $allowedFields = [
        'usuarios_id',
        'categorias_id',
        'chave',
        'valor',
        'descricao',
        'notificar_por_email'
    ];

    protected $validationRules = [
        'descricao' => [
            'label' => 'Descrição',
            'rules' => 'required',
            'errors' => ['required' => 'Campo {field} obrigatório'],
        ],
        'categorias_id' => [
            'label' => 'Categoria',
            'rules' => 'required|numeric',
            'errors' => ['required' => 'Campo {field} obrigatório'],
        ],
        'valor' => [
            'label' => 'Valor',
            'rules' => 'required',
            'errors' => ['required' => 'Campo {field} obrigatório']
        ]
    ];

    public function getAllWithCategorias()
    {

        $this->select(
            "orcamentos.chave as chave_orcamento,
            orcamentos.descricao as descricao_orcamento,
            categorias.chave as chave_categoria,
            categorias.descricao as descricao_categoria,
            valor,
            notificar_por_email");


        $this->join('categorias', 'categorias.id = orcamentos.categorias_id');
        return $this->findAll();
    }
}