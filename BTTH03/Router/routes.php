<?php
require_once 'Router.php';
$router = new Router();
$router->get('/test/test/', 'ArticleController@index');

?>