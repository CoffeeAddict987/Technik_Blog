<?php
class DatabaseUsersService
{
    private $database;
    private $table;

    public function __construct(PDO $database) {
        $this->database = $database;
        $this->table = 'users';
    }

    //Checks if a User with the given Mail already exists
    public function isExisting($mail) {
        // check if body already exists
        $selectQuery = 'SELECT COUNT(id) from '.$this->table.' WHERE email = ' . $mail;
        $statement = $this->database->prepare($selectQuery);

        $statement->execute();
        $data = $statement->fetchAll();

        $count = $data[0][0];
        $existing = $count > 0;
        return $existing;
    }

    public function checkPassword($userid, $password) {
        // Select Password of user
        $selectQuery = 'SELECT password from '.$this->table.' WHERE id = ' . $userid;
        $statement = $this->database->prepare($selectQuery);

        $statement->execute();
        $data = $statement->fetchAll();

        $result = $data[0];
        if ($result == $password)
            return true;
        return false;
    }

    public function getByMail($mail) {
        $selectQuery = 'SELECT id, username, email from '.$this->table.' WHERE email = "' .$mail.'"';
        $statement = $this->database->prepare($selectQuery);

        $statement->execute();
        $data = $statement->fetchAll();
        if(count($data) == 0)
            return null;
        return $data[0];
    }

    public function deleteById($id) {
        $deleteQuery = 'DELETE FROM '.$this->table.' WHERE id =' . $id;
        $statement = $this->database->prepare($deleteQuery);
        $statement->execute();
    }

    public function update($updatedEntity) {
        $id = $updatedEntity['id'];
        $mail = $updatedEntity['email'];
        $name = $updatedEntity['name'];

        $updateQuery = 'UPDATE '.$this->table.' SET email=:email, name=:name WHERE id=:id';        
        $statement = $this->database->prepare($updateQuery);
        $statement->bindParam(':id', $id);
        $statement->bindParam(':email', $mail);
        $statement->bindParam(':name', $name);
        $statement->execute();
    }

    public function add($newEntity) {
        //id not autoincremented -> check for highest id and increment
        $idQuery = 'SELECT MAX(id) FROM '. $this->table;
        $statement = $this->database->prepare($idQuery);
        $statement->execute();
        $data = $statement->fetchAll();
        $id = $data[0][0] + 1;

        $mail = $newEntity['email'];
        $name = $newEntity['name'];

        $insertQuery = 'INSERT INTO '.$this->table.' (id, email, name) VALUES (' .$id. '", "' . $mail . '", "' . $name . '" )';
        $statement = $this->database->prepare($insertQuery);
        $statement->execute();
    }
}
?>