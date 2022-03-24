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

    //Gera um array de categorias pronto para ser usado
    public function formDropDown(array $params = null)
    {
        $this->select('id, descricao, tipo');
        if(!is_null($params) && isset($params['tipo'])) {
            $this->where(['tipo' => $params['tipo']]);
        }
        if(!is_null($params) && isset($params['id'])) {
            $this->where(['id' => $params['id']]);
        }
        $categoriasArray = $this->findAll();
        $optionCategorias = array_column($categoriasArray, 'descricao', 'id');
        $optionsSelecione = [
            '' => 'Selectione...'
        ];
        $selectConteudo = $optionsSelecione + $optionCategorias;
        $novaCategoria = [];
        if(!is_null($params) && isset($params['opcaoNova'])) {
            if((bool)$params['opcaoNova'] === true) {
                $novaCategoria = [
                    '---' => [
                        'n' => 'Nova Categoria'
                    ]
                ];
            }
        }
        return $selectConteudo + $novaCategoria;


    }
    

}