<?php
namespace App\Models;

class CategoriaModel extends BaseModel
{
    protected $table = 'categorias';
    protected $primaryKey = 'chave';
    protected $useSoftDeletes = true;
    protected $deletedField = 'deleted_at';
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $beforeDelete = ['checaPropriedade'];
    protected $useTimestamps = true;
    protected $beforeInsert = ['vinculaIdUsuario', 'geraChave'];
    protected $allowedFields = [
        'usuarios_id',
        'chave',
        'tipo',
        'descricao'
    ];
    protected $validationRules = [
        'descricao' => [
            'label' => 'Descrição',
            'rules' => 'required',
            'errors' => ['required' => 'Campo {field} obrigatório'],
        ],
        'tipo' => [
            'label' => 'Tipo',
            'rules' => 'required',
            'errors' => ['required' => 'Campo {field} obrigatório']
        ]
    ];

    

    

}