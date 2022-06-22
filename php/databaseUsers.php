<?php
/*  */
require_once(__DIR__ . '../services/databaseUsersService.php');
require_once(__DIR__ . './endpoint.php');

class DatabaseUsersEndpoint extends Endpoint
{
    private $databaseContentService;

    public function __construct() {
        parent::__construct();
        $this->databaseContentService = new DatabaseUsersService($this->database);
    }
    
    //Response Codes: 200 if successful; 403 if the password entered ist wrong; 404 if no matching mail is found
    protected function get() {
        $id = null;
        $result = null;
        $mail = $this->getQueryParameter('email');
        $password = $this->getQueryParameter('password');

        //Test if user exits
        if ($mail != null) {
            $result = $this->databaseContentService->isExisting($mail);
            if ($result == null) {
                // set 404 - Not Found
                $this->notFound();
                return;
            }
        }

        $result = $this->databaseContentService->getByMail($mail);
        $id = $result['id'];
        
        //Passwordcheck
        if(!($this->databaseContentService->checkPassword($id, $password))) {
            $this->forbidden();
            return;
        }

        $this->ok($result);
    }

    //Response Codes: 201 if successful; 406 if one or more fields are empty or missing; 409 if user already exists
    protected function post() {
        $mail = $this->getQueryParameter('email');
        $name = $this->getQueryParameter('name');

        // check if mail already exists
        if ($this->databaseContentService->isExisting($mail)) {
            $this->duplicatedId();
            return;
        }

        // check if username already exists
        if ($this->databaseContentService->isExisting($name)) {
            $this->duplicatedId();
            return;
        }

        // insert into db if not exists
        $this->databaseContentService->add($this->params);
        $result = $this->databaseContentService->getByMail($mail);

        if($result == null){
            $this->notAcceptable();
            return;
        }

        $this->created($result);
    }

    //Response Codes: 200 if successful; 404 if no user to change is found; 409 if the username to change to is already taken
    protected function patch() {
        //To implement: Username oder Passwort ändern
        $mail = $this->getQueryParameter('email', true);
        $name = $this->getQueryParameter('name', true);

        // check if entity already exists in database
        if (!$this->databaseContentService->isExisting($mail)) {
            // set 404 - Not Found
            $this->notFound();
            return;
        }

        if ($this->databaseContentService->isExisting($name)) {
            $this->duplicatedId();
            return;
        }

        $this->databaseContentService->update($this->params);
        $result = $this->databaseContentService->getByMail($mail);

        $this->ok($result);
    }

    //Response Codes: 200 if successful; 404 if entered user doesn't exist
    protected function delete() {
        $mail = $this->getQueryParameter('email', true);
        $id = $this->getQueryParameter('id', true);

        // check if entity already exists in database
        if (!$this->databaseContentService->isExisting($mail)) {
            // set 404 - Not Found
            $this->notFound();
            return;
        }

        $result = $this->databaseContentService->getByMail($mail);
        $this->databaseContentService->deleteById($id);
        $this->ok($result);
    }
}

$endpoint = new DatabaseUsersEndpoint();
$endpoint->handleRequest();
?>