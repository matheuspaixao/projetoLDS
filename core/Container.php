<?php

namespace Core;

class Container {

  public static function newController($controller) {
    $objController = 'App\\Controllers\\' . $controller;
    return new $objController;
  }

  public static function getModel($model) {
    $objModel = 'App\\Models\\' . $model;
    return new $objModel(DataBase::getDataBase());
  }

  public static function pageNotFound() {
    if (file_exists(__DIR__ . '/../app/views/404.phtml'))
      return require_once __DIR__ . '/../app/views/404.phtml';
    else
      echo "ERRO 404! Page not found.";
  }

  public static function noAccess() {
    if (file_exists(__DIR__ . '/../app/views/noAccess.phtml'))
      return require_once __DIR__ . '/../app/views/noAccess.phtml';
    else
      echo "ERRO! You don't have access to this page.";
  }
}