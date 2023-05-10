<?php

class Student implements JsonSerializable
{
    private int $_id;
    private string $_name;
    private int $_age;
    /**
     * @return string
     */

    public function __construct($id, $name, $age)
    {
        $this->_id = $id;
        $this->_name = $name;
        $this->_age = $age;
    }

    public function getId()
    {
        return $this->_id;
    }

    public function getName()
    {
        return $this->_name;
    }

    public function setName($_name)
    {
        $this->_name = $_name;
    }

    public function getAge()
    {
        return $this->_age;
    }

    public function setAge($_age)
    {
        $this->_age = $_age;
    }

    public function jsonSerialize(): mixed
    {
        return [
            "Id" => $this->getId(),
            "Name" => $this->getName(),
            "Age" => $this->getAge()
        ];
    }
}

class GroupStudent {
    private $_students = array();

    public function __construct(Student $listStudent)
    {
        $this->_students = array($listStudent);
    }

    public function getListStudent() {
        return $this->_students;
    }
}

class StudentDAO
{
    private $_students = array();

    public function __construct(GroupStudent $list_student)
    {
        $this->_students = $list_student->getListStudent();
    }

    public function create(Student $new_student) {
        if(!array_search($new_student->getId(), $this->_students)) {
            $this->_students = array_push($this->_students, $new_student);
        }
        else {
            echo "This Id is duplicated";
        }
    }

    public function read() {
        return $this->_students;
    }
}
