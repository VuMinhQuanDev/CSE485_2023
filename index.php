<?php
include('src/dao/StudentDao.php');
$student_1 = new Student(1, "minh", 20);
$student_2 = new Student(2, "Hoang", 19);
$list_students = new GroupStudent($student_1);
$student_dao = new StudentDAO($list_students);
$student_dao->create($student_2);
$result = json_encode($student_dao->read());
echo $result;