<?php
/* databaseComments by Johannes Neuhaus
still needs much work */
require_once(__DIR__ . './../services/databaseCommentsService.php');
require_once(__DIR__ . './endpoint.php');

class DatabaseCommentsEndpoint extends Endpoint
{
    private $databaseContentService;
    public function __construct() {
        parent::__construct();
        $this->databaseContentService = new DatabaseCommentsService($this->database);
    }
    //Get: By Id -> Single Content / Leere Id -> Parameter & Menge beachten
    protected function get() {
        $result = null;
        $id = $this->getQueryParameter('id');

        $this->ok($result);
    }

    protected function post() {
        $id = $this->body['id'];

        // check if body already exists
        if ($this->databaseContentService->isExisting($id)) {
            $this->duplicatedId();
            return;
        }

        // insert into db if not exists
        $this->databaseContentService->add($this->body);
        $result = $this->databaseContentService->getById($id);
        $this->created($result);
    }

    protected function patch() {
        $id = $this->body['id'];

        // check if entity already exists in database
        if (!$this->databaseContentService->isExisting($id)) {
            // set 404 - Not Found
            $this->notFound();
            return;
        }

        $this->databaseContentService->update($this->body);
        $result = $this->databaseContentService->getById($id);
        $this->ok($result);
    }

    //Delete by Id
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

$endpoint = new DatabaseCommentsEndpoint();
$endpoint->handleRequest();
?>