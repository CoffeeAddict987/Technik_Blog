<?php
class DatabaseInterestsService
{
    private $database;
    private $table;

    public function __construct(PDO $database) {
        $this->database = $database;
        $this->table = 'interests';
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

    public function getById($id) {
        $query = 'SELECT * FROM ' .$this->table. ' WHERE id = ' . $id;
        $statement = $this->database->prepare($query);
        $statement->execute();
        $data = $statement->fetchAll(PDO::FETCH_ASSOC);
        if (count($data) == 0)
            return null;
        $result = $data[0];
        return $result;
    }

    public function getAll() {
        $query = 'SELECT * FROM '. $this->table;
        $statement = $this->database->prepare($query);
        $statement->execute();
        $data = $statement->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    }

    public function deleteById($id) {
        $deleteQuery = 'DELETE FROM '.$this->table.' WHERE id =' . $id;
        $statement = $this->database->prepare($deleteQuery);
        $statement->execute();
    }

    public function update($updatedEntity) {
        $id = $updatedEntity['id'];
        $name = $updatedEntity['name'];

        $updateQuery = 'UPDATE '.$this->table.' SET name=:name, WHERE id=:id';        
        $statement = $this->database->prepare($updateQuery);
        $statement->bindParam(':id', $id);
        $statement->bindParam(':name', $name);
        $statement->execute();
    }

    public function add($newEntity) {
        //id not autoincremented
        $idQuery = 'SELECT MAX(id) FROM '. $this->table;
        $statement = $this->database->prepare($idQuery);
        $statement->execute();
        $data = $statement->fetchAll();
        $id = $data[0][0] + 1;

        $name = $newEntity['name'];
        if($name == null)
            return;

        $insertQuery = 'INSERT INTO '.$this->table.' (id, name) VALUES (' . $id . ', "' . $name .'" )';
        $statement = $this->database->prepare($insertQuery);
        $statement->execute();
        return $id;
    }
}
?>