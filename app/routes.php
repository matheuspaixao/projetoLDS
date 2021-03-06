<?php

$route = [
  // [ urlDeAcesso, Controller@metodo, nivel_acesso ]

  ['/adm', 'AdmController@index', 3],

  ['/login', 'LoginController@index', 0],
  ['/login/autenticar', 'LoginController@autenticar', 0],
  ['/login/esqueci-senha', 'LoginController@esqueciSenha', 0],
  ['/login/cadastrar', 'LoginController@cadastrarFornecedora', 0],
  ['/login/verificarUsuario/{login}', 'LoginController@verificarUsuario', 0],

  ['/', 'HomeController@index', 3],
    
  ['/produtos', 'ProdutoController@listar', 5],
  ['/produtos/cadastrar', 'ProdutoController@cadastrar', 5],
  ['/produtos/{id}/atualizar', 'ProdutoController@atualizar', 5],
  ['/produtos/{id}/excluir', 'ProdutoController@excluir', 5], 
 
  ['/orcamento', 'OrcamentoController@index', 3],
  ['/orcamento/cadastrar', 'OrcamentoController@cadastrar', 5],
  ['/orcamento/{orcamentoId}/atualizar', 'OrcamentoController@atualizar', 5],
  ['/orcamento/listar', 'OrcamentoController@listar', 3],
  ['/orcamento/listar/{orcamentoId}', 'OrcamentoController@detalhar', 3],
  ['/orcamento/aprovado/{orcamentoId}', 'OrcamentoController@aprovado', 5],

  ['/proposta/{orcamentoId}/cadastrar', 'PropostaController@cadastrar', 3],
  ['/proposta/{orcamentoId}/{propostaId}/atualizar', 'PropostaController@atualizar', 3],
  ['/proposta/{orcamentoId}/aprovar', 'PropostaController@aprovar', 3],

  ['/meuperfil', 'UsuarioController@meuPerfil', 3],
  ['/meuperfil/atualizar', 'UsuarioController@atualizar', 3],
  ['/perfil/{usuarioId}', 'UsuarioController@perfil', 5],

  ['/usuarios', 'UsuarioController@listar', 10],
  ['/usuario/cadastrar', 'UsuarioController@cadastrar', 10],

  ['/fornecedora/listar', 'FornecedoraController@listar', 5],
  ['/fornecedora/{fornecedoraId}/aprovar', 'FornecedoraController@aprovar', 5],
  ['/fornecedora/{fornecedoraId}/recusar', 'FornecedoraController@recusar', 5],

  ['/sair', 'Sair@logout', 3],
];

return $route;