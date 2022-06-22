<?php
/* Hier kommen alle Anfragen, die im Zusammenhang mit den Interessen stehen rein -> Alle Interessen ausgeben, mögl. Artikel nach
Interessen ausgeben... */
require_once(__DIR__ . '../services/databaseInterestsService.php');
require_once(__DIR__ . './endpoint.php');

class DatabaseInterestsEndpoint extends Endpoint
{
    private $databaseContentService;

    public function __construct() {
        parent::__construct();
        $this->databaseContentService = new DatabaseInterestsService($this->database);
    }
    
    //Response Codes: 200 if successful
    protected function get() {
        $result = $this->databaseContentService->getAll();
        $this->ok($result);
    }

    //Response Codes: 201 if successful; 406 if name field is empty or missing; 409 if name already exists
    protected function post() {
        $id = null;
        $name = $this->getQueryParameter('name');

        // check if mail already exists
        if ($this->databaseContentService->isExisting($name)) {
            $this->duplicatedId();
            return;
        }

        // insert into db if not exists
        $id = $this->databaseContentService->add($this->params);
        $result = $this->databaseContentService->getById($id);

        if($result == null){
            $this->notAcceptable();
            return;
        }

        $this->created($result);
    }

    //Response Codes: 200 if successful; 404 if id to change is not found
    protected function patch() {
        $id = $this->getQueryParameter('id', true);

        // check if entity already exists in database
        if (!$this->databaseContentService->isExisting($id)) {
            // set 404 - Not Found
            $this->notFound();
            return;
        }

        $this->databaseContentService->update($this->params);
        $result = $this->databaseContentService->getById($id);

        $this->ok($result);
    }

    //Response Codes: 200 if successful; 404 if entered user doesn't exist
    protected function delete() {
        $id = $this->getQueryParameter('id', true);

        // check if entity already exists in database
        if (!$this->databaseContentService->isExisting($id)) {
            // set 404 - Not Found
            $this->notFound();
            return;
        }

        $result = $this->databaseContentService->getById($id);
        $this->databaseContentService->deleteById($id);
        $this->ok($result);
    }
}

$endpoint = new DatabaseInterestsEndpoint();
$endpoint->handleRequest();
?>