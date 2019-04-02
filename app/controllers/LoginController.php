<?php

namespace App\Controllers;

use Core\BaseController;
use Core\Container;
use Core\Redirect;
use Core\Session;

class LoginController extends BaseController 
{
  protected $aviso = null;
  protected $usuarios;

  public function index() {
    if (Session::get('avisoLogin')) {
      $this->aviso = Session::get('avisoLogin');
      Session::destroy('avisoLogin');
    }

    $this->setPageTitle('Login');
    $this->renderView('login/index', 'layout');
  }

  public function autenticar($request) {
    $loginModel = Container::getModel('Login');
    $usuario = $loginModel->getUserByLogin($request->post->login);

    if (count($usuario) == 0) {
      Redirect::route('/login', [
        'avisoLogin' => 'Usuário não encontrado!'
      ]);
    }
    else if ($usuario->nivel_acesso < 3) {
      Redirect::route('/login', [
        'avisoLogin' => 'Sua fornecedora ainda está pendente à aprovar!'
      ]);      
    }      
    else if ($usuario->senha !== $request->post->senha) {
      Redirect::route('/login', [
        'avisoLogin' => 'Senha incorreta!'
      ]);      
    }
    else {
      Session::set('usuario', $usuario);
      Redirect::route('/');
    }
  }  
    
  public function esqueciSenha() {
    $this->setPageTitle('Login');
    $this->renderView('login/esqueci-senha', 'layout');
  }
  
  public function cadastrarFornecedora($request) {
    if (isset($request->post->cadastrar)) {      
      $loginModel = Container::getModel('Login');
      $usuario = $request->post;
      $usuario->tipo_usuario = 'Fornecedor Desativado';
      $loginModel = Container::getModel('Login');
      $result = $loginModel->insertFornecedora($usuario);
      
      if (is_numeric($result)) {        
        Redirect::route('/login', [
          'avisoLogin' => 'Usuário cadastrado com sucesso!'
        ]);
      } else {
        Redirect::route('/login', [
          'avisoLogin' => $result
        ]);
      }
    }
    else {
      $loginModel = Container::getModel('Login');
      $this->usuarios = $loginModel->getUsersLogin();
      $this->setPageTitle('Fornecedora');
      $this->renderView('login/cadastrar', 'layout');
    }    
  }

  public function verificarUsuario($login) {
    $loginModel = Container::getModel('Login');
    $usuario = $loginModel->getUserByLogin($login);
    echo sizeof($usuario) > 0 ? 1 : 0;
  }
}