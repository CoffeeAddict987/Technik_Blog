<?php
/* Diese Klasse übernimmt die Contents:
Get: Get articles (mit id/ohne id -> dann mit Menge und/oder Parametern) */
require_once(__DIR__ . './../services/databaseContentService.php');
require_once(__DIR__ . './endpoint.php');

class DatabaseContentEndpoint extends Endpoint
{
    private $databaseContentService;
    public function __construct() {
        parent::__construct();
        $this->databaseContentService = new DatabaseContentService($this->database);
    }
    //Get: By Id -> Single Content / Leere Id -> Parameter & Menge beachten
    protected function get() {
        $result = null;
        $id = $this->getQueryParameter('id');
        $interestTags = $this->getQueryParameter('tags');
        $quantity = $this->getQueryParameter('quantity');
        if ($id != null) {
            $result = $this->databaseContentService->getById($id);
            if ($result == null) {
                // set 404 - Not Found
                $this->notFound();
                return;
            }
        } elseif ($interestTags != null && $quantity == null) {
            $result = $this->databaseContentService->getByInterest($interestTags);
        } elseif ($interestTags != null) {
            $i = $this->databaseContentService->amountOf();
        }
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
        // get and parse http hody
        // check if entity in db --> else 404
        // update entity in db with latest properties

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

$endpoint = new DatabaseContentEndpoint();
$endpoint->handleRequest();
?>