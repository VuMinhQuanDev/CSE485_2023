<?php
include_once '../config/connectDB.php';
include_once 'classController.php';
class StudentController
{
    public function getAll()
    {
        $pdo = new ConnectDatabase();
        $conn = $pdo->getConnection();
        $sql = "SELECT * FROM students";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    }

    public function createStudent($data)
    {
        $pdo = new ConnectDatabase();
        $conn = $pdo->getConnection();
        $sql = "INSERT INTO students ('name','birth','contact','user_id') VALUES ('?,?,?,?')";
        $stmt=$conn->prepare($sql);
        $stmt->execute([$data['name'], $data['birth'], $data['contact'], $data['user_id']]);
    }

    public function updateStudent($id)
    {

    }

    public function deleteStudent($id)
    {

    }

    public function getStudent($id)
    {
        $pdo = new ConnectDatabase();
        $conn = $pdo->getConnection();
        $sql = "SELECT * FROM students WHERE id=?";
        $stmt=$conn->prepare($sql);
        $stmt->execute([$id]);
        $data=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    }

    public function getStudentIdbyIdUser($id)
    {
        $pdo = new ConnectDatabase();
        $conn = $pdo->getConnection();
        $sql = "SELECT id FROM students WHERE user_id=?";
        $stmt=$conn->prepare($sql);
        $stmt->execute([$id]);
        $data=$stmt->fetch(PDO::FETCH_ASSOC); 
        return $data['id']; 
    }


    public function getName($id)
    {
        $pdo = new ConnectDatabase();
        $conn = $pdo->getConnection();
        $sql = "SELECT name FROM students WHERE user_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$id]);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    }
    public function isStudentInClass($class_id, $user_id)
    {
        $studentId = $this->getStudentIdbyIdUser($user_id);
        $classController = new ClassController();
        $classesStudent = $classController->getClassesByStudentId($studentId);
        foreach ($classesStudent as $class) {
            if ($class['id'] == $class_id) {
                return true;
            }
        }
        return false;

    }
}

?>