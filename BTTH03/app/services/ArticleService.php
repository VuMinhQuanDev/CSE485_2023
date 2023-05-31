<?php
include_once "C:/xampp/htdocs/test/test/app/models/ConnectDatabase.php";
include_once "C:/xampp/htdocs/test/test/app/models/Article.php";
class ArticleService{
    public function getAllArticle()
    {
        $article = new Article();
        $data = $article->getAll();
        return $data;

    }
}
?>