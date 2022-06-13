<?php
class Endpoint
{
    protected $database;
    protected $body;
    protected $params;

    public function __construct() {
        // initialize database
        // set headers
        $this->database = new PDO('mysql:host=127.0.0.1;dbname=php_rest_api_db', "root", "");
        $this->setHeaders();
    }

    protected function setHeaders() {
        header('Content-Type: application/json');
        header('Access-Control-Allow-Origin: http://127.0.0.1:5501');
    }

    protected function get() {
        $this->unsupportedHttpMethod();
    }

    protected function post() {
        $this->unsupportedHttpMethod();
    }

    protected function delete() {
        $this->unsupportedHttpMethod();
    }

    protected function patch() {
        $this->unsupportedHttpMethod();
    }

    protected function options() {
        header('Access-Control-Allow-Methods: GET, POST, PATCH, DELETE, OPTIONS');
    }

    public function handleRequest() {
        $httpMethod = $_SERVER['REQUEST_METHOD'];

        $bodyString = file_get_contents('php://input');
        $this->body = json_decode($bodyString, true);
        parse_str($_SERVER['QUERY_STRING'], $this->params);


        switch ($httpMethod) {
            case "GET":
                // call get
                $this->get();
                break;
            case "POST":
                // call post
                $this->post();
                break;
            case "PATCH":
                // call patch
                $this->patch();
                break;
            case "DELETE":
                // call delete
                $this->delete();
                break;
            case "OPTIONS":
                // call options
                $this->options();
                break;
            default:
                $this->unsupportedHttpMethod();
                break;
        }
    }

    protected function unsupportedHttpMethod() {
        http_response_code(400);
        echo 'Unsupported HTTP method';
    }

    protected function notFound() {
        http_response_code(404);
        echo 'entity not found';
    }

    protected function requestRangeNotSatisfiable() {
        echo 'request Range Not Satisfiable';
        http_response_code(416);
    }

    protected function duplicatedId() {
        echo 'duplicated id';
        http_response_code(409);
    }

    protected function unauthorized() {
        echo 'unauthorized';
        http_response_code(401);
    }

    protected function forbidden() {
        echo 'forbidden';
        http_response_code(403);
    }

    protected function ok($result) {
        $this->responseRequest(200, $result);
    }

    protected function created($result) {
        $this->responseRequest(201, $result);
    }

    protected function responseRequest($code, $result) {
        echo json_encode($result);
        http_response_code($code);
    }
    
    protected function getQueryParameter($key, $required = false) {
        $value = null;
        if($this->params != null) {
            $value = $this->params[$key];
        }
        if($required && $value == null) {
            http_response_code(400);
            echo $key . ' not set';
        }

        return $value;
    }
}
?>