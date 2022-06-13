<?php
/* Diese Klasse übernimmt die Contents:
Get: Get articles (mit id/ohne id -> dann mit Menge und/oder Parametern) */
require_once(__DIR__ . '../services/databaseUsersService.php');
require_once(__DIR__ . './endpoint.php');

class DatabaseUsersEndpoint extends Endpoint
{
    private $databaseContentService;
    public function __construct() {
        parent::__construct();
        $this->databaseContentService = new DatabaseUsersService($this->database);
    }
    //Get: Login; Responsecode falsches Password: 403; Unbekannte Mail 404
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
            $result = $this->databaseContentService->getByMail($mail);
            $id = $result['id'];
        }
        
        //Passwordcheck
        if(!($this->databaseContentService->checkPassword($id, $password))) {
            $this->forbidden();
            return;
        }

        $this->ok($result);
    }

    protected function post() {
        $mail = $this->body['email'];

        // check if body already exists
        if ($this->databaseContentService->isExisting($mail)) {
            $this->duplicatedId();
            return;
        }

        // insert into db if not exists
        $this->databaseContentService->add($this->body);
        $result = $this->databaseContentService->getByMail($mail);
        $this->created($result);
    }

    protected function patch() {
        $mail = $this->getQueryParameter('email', true);

        // check if entity already exists in database
        if (!$this->databaseContentService->isExisting($mail)) {
            // set 404 - Not Found
            $this->notFound();
            return;
        }

        $this->databaseContentService->update($this->body);
        $result = $this->databaseContentService->getByMail($mail);
        $this->ok($result);
    }

    //Delete by Id
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