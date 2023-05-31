<?php
include_once '../config/connectDB.php';
class CourseController
{
    public function getAll()
    {
        $pdo = new ConnectDatabase();
        $conn = $pdo->getConnection();
        $sql = "SELECT * FROM courses";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    }

    public function getCourseByClassId($class_id)
    {
        $pdo = new ConnectDatabase();
        $conn = $pdo->getConnection();
        $sql = "SELECT * FROM courses";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    }
}