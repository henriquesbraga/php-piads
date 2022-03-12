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
            'tipo' => [
                'label' => 'Tipo',
                'rules' => 'required'
            ]
        ]
    ];

    //VIncula o id do usuario logado no momento no campo usuario_id da tabela
    protected function vinculaIdUsuario($data)
    {
        $data['data']['usuarios_id'] = session()->id_usuario;
        return $data;
    }

    //returna chave rand e vincula ao campo chave da tabela
    protected function geraChave($data)
    {
        $data['data']['chave'] = md5(uniqid(rand(), true));
        return $data;
    }

    

}