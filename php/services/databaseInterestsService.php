<?php
class DatabaseInterestsService
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
        $strInterestTags = implode("','", $interestTags);
        $query = 'SELECT * FROM '. $this->table .' WHERE tag = '. $strInterestTags;
        $statement = $this->database->prepare($query);
        $statement->execute();
        $data = $statement->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    }

    public function getById($id) {
        $strIds = implode("','", $id);

        $query = 'SELECT articles.id, articles.title, content.content, pictures.path, users.username FROM'. $this->table.'
        INNER JOIN users ON articles.author_id = users.id
        INNER JOIN content ON articles.content_id = content.id
        INNER JOIN pictures ON articles.picture_id = pictures.id
        WHERE articles.id = '. $strIds;

        $statement = $this->database->prepare($query);
        $statement->execute();

        $data = $statement->fetchAll(PDO::FETCH_ASSOC);

        if (count($data) == 0)
            return null;
        
        $result = $data[0];
        return $result;
    }

    public function deleteById($id) {
        $deleteQuery = 'DELETE FROM '.$this->table.' WHERE id =' . $id;
        $statement = $this->database->prepare($deleteQuery);
        $statement->execute();
    }

    public function update($updatedEntity) {
        $id = $updatedEntity['id'];
        $text = $updatedEntity['content'];
        $title = $updatedEntity['title'];
        $author = $updatedEntity['author_id'];

        // $updateQuery = 'UPDATE database_content SET title="' . $title . '", text= "' . $text . '" WHERE id=' . $id;
        $updateQuery = 'UPDATE '.$this->table.' SET title=:title, text=:text WHERE id=:id';        
        $statement = $this->database->prepare($updateQuery);
        $statement->bindParam(':id', $id);
        $statement->bindParam(':title', $title);
        $statement->bindParam(':text', $text);
        $statement->execute();
    }

    public function add($newEntity) {
        $id = $newEntity['id'];
        $text = $newEntity['text'];
        $title = $newEntity['title'];

        $insertQuery = 'INSERT INTO '.$this->table.' (id, title, text) VALUES (' . $id . ', "' . $title . '", "' . $text . '" )';
        $statement = $this->database->prepare($insertQuery);
        $statement->execute();
    }
}
?>