<?php
class Endpoint {
    protected $database;
    protected $body;
    protected $params;

    //Things for handling the class Endpoint
    public function __construct() {
        // initialize database
        // set headers
        $this->database = new PDO('mysql:host=127.0.0.1;dbname=database', "root", "");
        $this->setHeaders();
    }

    protected function setHeaders() {
        header('Content-Type: application/json');
        header('Access-Control-Allow-Origin: http://127.0.0.1:5500');
    }

    //Functions to call the api
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

    //Http Response Codes; Ordered in ascending order
    protected function ok($result) {
        echo "ok";
        $this->responseRequest(200, $result);
    }   //200

    protected function created($result) {
        echo "created";
        $this->responseRequest(201, $result);
    }   //201

    protected function unsupportedHttpMethod() {
        echo 'Unsupported HTTP method';
        http_response_code(400);
    }   //400
    
    protected function unauthorized() {
        echo 'unauthorized';
        http_response_code(401);
    }   //401
    
    protected function forbidden() {
        echo 'forbidden';
        http_response_code(403);
    }   //403

    protected function notFound() {
        echo 'entity not found';
        http_response_code(404);
    }   //404
    
    protected function notAcceptable() {
        echo 'not Acceptable';
        http_response_code(406);
    }   //406

    protected function duplicatedId() {
        echo 'duplicated id';
        http_response_code(409);
    }   //409

    protected function requestRangeNotSatisfiable() {
        echo 'request Range Not Satisfiable';
        http_response_code(416);
    }   //416

    protected function responseRequest($code, $result) {
        echo json_encode($result);
        http_response_code($code);
    }

    //Handling the Request
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