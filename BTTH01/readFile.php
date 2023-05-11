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
        $data = explode(' ', $student);
        if(trim($data[1]) === trim($name)) {
            echo "<script>window.location.href = 'readFile.php';</script>";
            exit();
        }
    }
    $new_student = "$id,$name,$age,$grade\n";
    file_put_contents('dssv.txt', $new_student, FILE_APPEND);
    header('Location: readFile.php');
}


?>



<!DOCTYPE html>
<html>
<head>
	<title>Add Student</title>
	<style>
		form {
			margin: auto;
			width: 50%;
			padding: 20px;
			border: 1px solid #ddd;
			border-radius: 5px;
			background-color: #f9f9f9;
		}
		input[type=text], input[type=number] {
			padding: 8px;
			width: 100%;
			border-radius: 5px;
			border: 1px solid #ccc;
			box-sizing: border-box;
			margin-bottom: 10px;
		}
		input[type=submit] {
			background-color: #4CAF50;
			color: white;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			margin-top: 10px;
		}
		input[type=submit]:hover {
			background-color: #45a049;
		}
       

	</style>
</head>
<body>
    <h2 style="text-align:center">Form add student</h2>

	<form method="post" action="readFile.php">
		<label for="id">ID:</label>
		<input type="text" id="id" name="id" required>

		<label for="name">Name:</label>
		<input type="text" id="name" name="name" required>

		<label for="age">Age:</label>
		<input type="number" id="age" name="age" required>

		<label for="grade">Grade:</label>
		<input type="number" id="grade" name="grade" required>

		<input type="submit" value="Add Student" name="submit">
	</form>
</body>
</html>


