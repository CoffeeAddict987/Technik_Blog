<?php
/* databaseArticlesService by Johannes Neuhaus */
class DatabaseArticlesService
{
    private $database;
    private $table;

    public function __construct(PDO $database) {
        $this->database = $database;
        $this->table = 'articles';
    }

    public function isExisting($id) {
        // check if body already exists
        $selectQuery = 'SELECT COUNT(id) from '.$this->table.' WHERE id = ' . $id;
        $statement = $this->database->prepare($selectQuery);
        $statement->execute();
        $data = $statement->fetchAll();
        $count = $data[0][0];
        $existing = $count > 0;
        return $existing;
    }

    public function amountOf() {
              $selectQuery = 'SELECT COUNT(id) from '.$this->table;
              $statement = $this->database->prepare($selectQuery);
              $statement->execute();
              $data = $statement->fetchAll();
              return $data[0][0];
    }

    public function getByInterest($interestTags) {
        //select ids of interest
        $strInterestTags = str_replace(', ', ' OR ', $interestTags);
        $query = 'SELECT DISTINCT articles.id FROM articlesxinterets
        INNER JOIN articles ON articlesxinterets.article_id = articles.id
        INNER JOIN interests ON articlesxinterets.interest_id = interests.id
        WHERE interests.id = '. $strInterestTags. ';';
        $statement = $this->database->prepare($query);
        $statement->execute();
        $data = $statement->fetchAll(PDO::FETCH_ASSOC);
        $Ids = array();
        for ($i = 0; $i < sizeof($data); $i++) {
            $Ids[$i] = $data[$i]['id'];
        }

        //Select corresponding fields of the articles
        $strIds = implode(" OR articles.id =  ", $Ids);
        $query = 'SELECT articles.id, articles.title AS title, LEFT(content.content, 500) AS content, pictures.title AS PTitle, pictures.path FROM ' .$this->table. '
        INNER JOIN content ON articles.content_id = content.id
        INNER JOIN pictures ON articles.picture_id = pictures.id
        WHERE articles.id = '. $strIds .'
        ORDER BY RAND();';
        $statement = $this->database->prepare($query);
        $statement->execute();
        $data = $statement->fetchAll(PDO::FETCH_ASSOC);

        return $data;
    }

    public function getById($id) {
        $query = 'SELECT articles.id, articles.title, content.content, pictures.path, users.username FROM '. $this->table.'
        INNER JOIN users ON articles.author_id = users.id
        INNER JOIN content ON articles.content_id = content.id
        INNER JOIN pictures ON articles.picture_id = pictures.id
        WHERE articles.id = '. $id;

        $statement = $this->database->prepare($query);
        $statement->execute();

        $data = $statement->fetchAll(PDO::FETCH_ASSOC);

        if (count($data) == 0)
            return null;
        
        $result = $data[0];
        return $result;
    }

    public function getAll() {
        $query = 'SELECT articles.id, articles.title, LEFT(content.content, 500) AS content, pictures.path FROM '. $this->table.'
        INNER JOIN content ON articles.content_id = content.id
        INNER JOIN pictures ON articles.picture_id = pictures.id
        ORDER BY RAND();';
        $statement = $this->database->prepare($query);
        $statement->execute();
        $data = $statement->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    }

    public function deleteById($id) {
        //delete articlesxinterets join
        $deleteQuery = 'DELETE FROM articlesxinterets WHERE article_id = '. $id .';';
        $statement = $this->database->prepare($deleteQuery);
        $statement->execute();

        //delete Article
        $deleteQuery = 'DELETE FROM '.$this->table.' WHERE id =' . $id;
        $statement = $this->database->prepare($deleteQuery);
        $statement->execute();
    }

    public function add($newEntity) {
        $authorId = $newEntity['authorId'];
        $picture = $newEntity['pictureId'];
        $interestTags = $newEntity['interests'];
        $content = $newEntity['content'];
        $title = $newEntity['title'];

        $interestTagsArr = explode(', ', $interestTags);

        //create content
        $insertQuery = 'INSERT INTO content (content, final) VALUES ( "' .$content. '", 1 )';
        $statement = $this->database->prepare($insertQuery);
        $statement->execute();
        
        //Select Id from created content
        $query = 'SELECT MAX(id) FROM content;';
        $statement = $this->database->prepare($query);
        $statement->execute();
        $data = $statement->fetchAll();

        $contId = $data[0][0];

        //create article
        $insertQuery = 'INSERT INTO articles (author_id, content_id, picture_id, title) VALUES ( ' .$authorId. ', ' .$contId. ', '. $picture .', "'. $title . '");';
        $statement = $this->database->prepare($insertQuery);
        $statement->execute();

        //Select id from created article
        $query = 'SELECT MAX(id) FROM articles';
        $statement = $this->database->prepare($query);
        $statement->execute();
        $data = $statement->fetchAll();
        
        $artId =  $data[0][0];

        //create articlesxinterests
        $insertQuery = 'INSERT INTO articlesxinterets (article_id, interest_id) VALUES';
        for ($i = 0; $i < sizeof($interestTagsArr) - 1; $i++) {
            $appendStr = ' ( ' .$artId. ', ' .$interestTagsArr[$i]. ' ),';
            $insertQuery = $insertQuery.$appendStr;
        }
        $appendStr = ' ( ' .$artId. ', ' .$interestTagsArr[$i]. ' )';
        $insertQuery = $insertQuery.$appendStr;
        
        $statement = $this->database->prepare($insertQuery);
        $statement->execute();

        return $artId;
    }
}
?>