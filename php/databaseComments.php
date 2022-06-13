<?php
/* Erst später machen. Jetzt nur Blueprint
 */
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
        $interestTags = $this->getQueryParameter('tags');
        $quantity = $this->getQueryParameter('quantity');

        //Get specific Id(s)
        if ($id != null) {
            $result = $this->databaseContentService->getById($id);
            if ($result == null) {
                // set 404 - Not Found
                $this->notFound();
                return;
            }

        }
        //Get specific Amount of Articles with Interests
        elseif ($interestTags != null && $quantity != null) {
            $rndIds = array();
            $amountArticles = $this->databaseContentService->amountOf();

            if($quantity > $amountArticles) {
                $this->requestRangeNotSatisfiable();
                return;
            }

            $result = $this->databaseContentService->getByInterest($interestTags);
            //Error Handling
            if ($result == null) {
                // set 404 - Not Found
                $this->notFound();
                return;
            }
            if (sizeof($result) < $quantity) {
                // set 416 - Request Range not Satisifiable
                $this->requestRangeNotSatisfiable();
                return;
            }

            //Array handle to requested size
            array_splice($result, $quantity);

        }
        //Get specific Amount of Articles without Interests
        elseif ($interestTags == null) {
            //fehlt noch: Kleinste id, wenn artikel löschbar sind; keine Überprüfung, ob Id exisitiert; Uniqueness
            $rndIds = array();
            $amountArticles = $this->databaseContentService->amountOf();

            if ($amountArticles < $quantity) {
                // set 416 - Request Range not Satisifiable
                $this->requestRangeNotSatisfiable();
                return;
            }

            for($i = 0; $i < $quantity; $i++) {
                $rndIds[$i] = rand(0, $amountArticles);
            }
            $result = $this->databaseContentService->getById($rndIds);
            if ($result == null) {
                // set 404 - Not Found
                $this->notFound();
                return;
            }

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