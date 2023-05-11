<?php
require 'student.php';
class StudentDAO {
    private $students = array();
    
    public function create(Student $student) {
        // Thêm một sinh viên mới vào danh sách
        $this->students[] = $student;
    }
    
    public function read($id) {
        // Lấy thông tin của một sinh viên trong danh sách dựa trên id
        foreach ($this->students as $student) {
            if ($student->getId() == $id) {
                return $student;
            }
        }
        return null;
    }
    
    public function update(Student $student) {
        // Cập nhật thông tin của một sinh viên trong danh sách
        foreach ($this->students as $key => $s) {
            if ($s->getId() == $student->getId()) {
                $this->students[$key] = $student;
                break;
            }
        }
    }
    
    public function delete($id) {
        // Xóa thông tin của một sinh viên trong danh sách dựa trên id
        foreach ($this->students as $key => $student) {
            if ($student->getId() == $id) {
                unset($this->students[$key]);
                break;
            }
        }
    }
    
    public function getAll() {
        // Lấy toàn bộ danh sách sinh viên
        return $this->students;
    }
}

?>