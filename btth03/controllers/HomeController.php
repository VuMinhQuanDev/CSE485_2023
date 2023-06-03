<?php
    include("services/ArticleService.php");
    class HomeController{
        public function index(){
            // Tương tác với Services/Models
            $articleService = new ArticleService();
            $articles = $articleService->getAllArticles();
            // $articles = $articleService->addArticles();
            // $articles = $articleService->updateArticles();
            
            // Tương tác với View
            include("views/home/index.php");
        }
    }

?>