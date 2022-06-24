<?php
/* Diese Klasse übernimmt die Contents:
Get: Get articles (mit id/ohne id -> dann mit Menge und/oder Parametern) */
require_once(__DIR__ . '../services/databaseArticlesService.php');
require_once(__DIR__ . './endpoint.php');

class DatabaseArticlesEndpoint extends Endpoint
{
    private $databaseContentService;
    public function __construct() {
        parent::__construct();
        $this->databaseContentService = new DatabaseArticlesService($this->database);
    }
    //Get: By Id -> Single Content / Leere Id -> Parameter & Menge beachten
    protected function get() {
        $result = null;
        $id = $this->getQueryParameter('id');
        $interestTags = $this->getQueryParameter('tags');
        $quantity = $this->getQueryParameter('quantity');

        //Get specific Id; Returns the full article
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
            $amountArticles = $this->databaseContentService->amountOf();

            if ($amountArticles < $quantity) {
                // set 416 - Request Range not Satisifiable
                $this->requestRangeNotSatisfiable();
                return;
            }

            $result = $this->databaseContentService->getAll();
            if ($result == null) {
                // set 404 - Not Found
                $this->notFound();
                return;
            }
            
            array_splice($result, $quantity);
        }

        $this->ok($result);
    }

    protected function post() {
        // insert into db if not exists
        $id = $this->databaseContentService->add($this->params);
        $result = $this->databaseContentService->getById($id);
        $this->created($result);
    }

    //Delete by Id
    protected function delete() {
        $id = $this->getQueryParameter('id', true);

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

$endpoint = new DatabaseArticlesEndpoint();
$endpoint->handleRequest();
?>