<?php
require_once 'C:/xampp/htdocs/test/test/app/controllers/ArticleController.php';

class Router{
    protected $router = []; // luu tru cac tuyen dươc dinh nghia

    public function get($url,$controller){
        $this->router['GET'][$url] = $controller;
    }

    public function post($url,$controller){
        $this->router['POST'][$url] = $controller;
    }

    protected function callControllerAction($controllerAction) {
        list($controller, $action) = explode('@', $controllerAction);

        $controllerObj = new $controller();
        $controllerObj->$action();
    }

    public function handleRequest()
    {
        $method=$_SERVER['REQUEST_METHOD'];
        $url=$_SERVER['REQUEST_URI'];
        var_dump( $this->router);
        if (isset($this->router[$method][$url])) {
            $controllerAction = $this->router[$method][$url];
            $this->callControllerAction($controllerAction);
        } else {
            // Xử lý khi không tìm thấy tuyến đường
            echo "404 Not Found";
        }
    }
}
?>
