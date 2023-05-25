<?php
session_start();

// Kiểm tra xem đã đăng nhập chưa
if (!isset($_SESSION['username'])) {
    header('Location: login.html');
    exit;
}

// Kết nối với cơ sở dữ liệu MySQL
$servername = 'localhost';
$username = 'root';
$password = '1802';
$dbname = 'btth02';

$conn = new mysqli($servername, $username, $password, $dbname);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die('Kết nối thất bại: ' . $conn->connect_error);
}

// Lấy danh sách các môn học
$sql = 'SELECT * FROM Khoa_hoc';
$result = $conn->query($sql);

// Hiển thị danh sách các môn học và trạng thái điểm danh để lựa chọn
if ($result->num_rows > 0) {
    echo '<h2>Chọn môn học để điểm danh</h2>';
    echo '<form action="attendance.php" method="POST">';
    while ($row = $result->fetch_assoc()) {
        // Lấy trạng thái môn học
        $courseId = $row['ID_khoa_hoc'];
        $status = $row['Trang_thai'];

        echo '<input type="checkbox" name="course[]" value="' . $courseId . '"> ' . $row['Tieu_de'];
        echo ' - Trạng thái: ' . $status . '<br>';
    }
    echo '<br><input type="submit" value="Điểm danh">';
    echo '</form>';
} else {
    echo 'Không có môn học nào.';
}

// Đóng kết nối
$conn->close();