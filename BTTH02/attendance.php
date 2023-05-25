<?php
session_start();

// Kiểm tra xem đã đăng nhập chưa
if (!isset($_SESSION['username'])) {
    header('Location: login.html');
    exit;
}

// Kiểm tra xem đã chọn môn học để điểm danh chưa
if (isset($_POST['course'])) {
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

    // Lấy danh sách các môn học đã chọn
    $courses = $_POST['course'];

    // Hiển thị thông tin điểm danh
    echo '<h2>Thông tin điểm danh</h2>';
    foreach ($courses as $course) {
        // Lấy thông tin môn học
        $sql = 'SELECT * FROM Khoa_hoc WHERE ID_khoa_hoc = ' . $course;
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        echo '<h3>' . $row['Tieu_de'] . '</h3>';

        // Lấy danh sách sinh viên đã điểm danh
        $sql = 'SELECT s.Ten_sinh_vien, t.Ngay, t.Trang_thai_tham_du FROM Su_tham_du t INNER JOIN Sinh_vien s ON t.ID_sinh_vien = s.ID_sinh_vien WHERE t.ID_lop_hoc_phan = ' . $course;
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            echo '<table>';
            echo '<tr><th>Tên sinh viên</th><th>Ngày</th></tr>';
            while ($row = $result->fetch_assoc()) {
                echo '<tr>';
                echo '<td>' . $row['Ten_sinh_vien'] . '</td>';
                echo '<td>' . $row['Ngay'] . '</td>';
                echo '</tr>';
            }
            echo '</table>';
        } else {
            echo 'Chưa có thông tin điểm danh.';
        }

        echo '<br>';

        // Cập nhật trạng thái môn học
        $newStatus = 'Đã điểm danh';
        $updateSql = "UPDATE Khoa_hoc SET Trang_thai = '$newStatus' WHERE ID_khoa_hoc = $course";
        $conn->query($updateSql);

        // Hiển thị trạng thái môn học sau khi cập nhật
        echo 'Trạng thái môn học: ' . $newStatus;
    }

    // Đóng kết nối
    $conn->close();
} else {
    header('Location: select_course.php');
    exit;
}
