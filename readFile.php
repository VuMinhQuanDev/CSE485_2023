<?php
$file_path = 'dssv.txt';
$lines = file($file_path, FILE_IGNORE_NEW_LINES);
$students = array();

foreach ($lines as $line) {

    $parts = explode(",", $line);

    $student = new stdClass();
    $student->id = $parts[0];
    $student->name = $parts[1];
    $student->age = $parts[2];
    $student->grade = $parts[3];

    array_push($students, $student);
}

foreach ($students as $student) {
    echo "ID: " . $student->id . "<br>";
    echo "Name: " . $student->name . "<br>";
    echo "Age: " . $student->age . "<br>";
    echo "Grade: " . $student->grade . "<br><br>";
}

if(isset($_POST['submit'])){

    $id = $_POST['id'];
    $name = $_POST['name'];
    $age = $_POST['age'];
    $grade = $_POST['grade'];


    $students = file('dssv.txt');
    foreach($students as $student) {
        $data = explode(',', $student);
        if(trim($data[1]) === trim($name)) {
            echo "<script>alert('Sinh viên đã tồn tại trong danh sách!');</script>";
            //Nếu sinh viên tồn tại thì hiện lại form để nhập lại
            echo "<script>window.location.href = 'readFile.php';</script>";
            exit();
        }
    }
    $new_student = count($students)+1 . "$id,$name,$age,$grade\n";
    file_put_contents('dssv.txt', $new_student, FILE_APPEND);
    header('Location: readFile.php');
}
?>
<!DOCTYPE html>
<html lang="">
<head>
    <title>Add Student</title>
</head>
<body>
<h1>Add Student</h1>
<form method="POST">
    <label for="name">Tên:</label>
    <input type="text" id="name" name="name" required><br>
    <label for="age">Tuổi:</label>
    <input type="number" id="age" name="age" required><br>
    <label for="grade">Điểm:</label>
    <input type="number" id="grade" name="grade" required><br>
    <input type="submit" name="submit" value="Add">
</form>
</body>
</html>
