<?php

class Article{
    private $title;
    private $summary;
    private $content;
    private $author_name;

    // Hàm tạo
    public function __construct($title, $summary, $content, $author_name){
        $this->title = $title;
        $this->summary = $summary;
        $this->content = $content;
        $this->author_name= $author_name;
    }

    // Hàm setter và getter;
    public function getTitle(){
        return $this->title;
    }

    public function setTitle($title){
        $this->title = $title;
    }
}