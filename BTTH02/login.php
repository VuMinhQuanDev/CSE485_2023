<?php
session_start();

// Kiểm tra tên đăng nhập và mật khẩu
if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if ($username == 'admin' && $password == 'admin123') {
        // Đăng nhập thành công, lưu thông tin đăng nhập vào session
        $_SESSION['username'] = $username;

        // Chuyển hướng đến trang chọn môn học
        header('Location: select_course.php');
        exit();
    } else {
        // Đăng nhập không thành công, chuyển hướng về trang đăng nhập
        header('Location: login.php');
        exit();
    }
}
?>


<!DOCTYPE html>
<html>

<head>
    <title>Đăng nhập</title>
</head>

<body>
    <h2>Đăng nhập</h2>

    <form action="login.php" method="POST">
        <label for="username">Tên đăng nhập:</label>
        <input type="text" name="username" id="username" required><br><br>
        <label for="password">Mật khẩu:</label>
        <input type="password" name="password" id="password" required><br><br>
        <input type="submit" value="Đăng nhập">
    </form>
</body>

</html>