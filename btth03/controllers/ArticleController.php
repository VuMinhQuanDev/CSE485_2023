<?php
class ArticleController{
    public function index(){
        echo 'Bạn đang gọi tôi ArticleController';
    }

    public function add(){
        // Tương tác với Services/Models
        $categories= 'Categories from ArticeServices';
        // Tương tác với View
        include("views/article/add_article.php");
    }

}
