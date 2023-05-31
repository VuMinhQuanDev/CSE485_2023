<?php
require_once 'C:/xampp/htdocs/test/test/Router/routes.php';
class ArticleController{
    public function __construct() {
    }
    public function index()
    {
        $article = new Article();
        $data = $article->getAll();
        $this->view('article/index.php', $data);
    }

    protected function view($view, $data = array()) {
        require_once 'app/views/' . $view;
    }
}

