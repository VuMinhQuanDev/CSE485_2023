<?php
require_once 'Router/Router.php';

$router = new Router();

require_once 'Router/routes.php';

$router->handleRequest();