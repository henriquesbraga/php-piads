<?php
namespace App\Models;

use CodeIgniter\Model;

class BaseModel extends Model 
{

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


    // Retorna categorias que podem ser filtradas via like
    // REtorna todos os registros
    public function getAll()
    {
        return $this->findAll();
    }

    public function addOrder(array $order = null){
        if(!is_null($order)) {
            if(key_exists('order', $order)) {
                foreach($order as $ordem){
                    $this->orderBy($ordem['campo'], $ordem['sentido']);
                }
            }
            else {
                $this->orderBy($order['campo'], $order['sentido']); 
            }
        }
        return $this;
    }

    // Injeta o usuário
    public function addUserId(int $id_usuario = null){
        if(!is_null($id_usuario)) {
            $this->where('usuarios_id', $id_usuario);
        }
        return $this;
    }


    public function addSearch($search = null) 
    {
        if(!is_null($search)) {
            $this->like('descricao', $search);
        }
        
        return $this;
    }
}