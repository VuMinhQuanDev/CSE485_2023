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
    <title>Login</title>
    <link rel="stylesheet" href="./assets/css/style.css">
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form method="post" action="login.php">
            <input type="text" name="username" placeholder="Username" required style="width: 280px;"><br>
            <input type="password" name="password" placeholder="Password" required style="width: 280px;"><br>
            <input type="submit" name="login" value="Login">
        </form>
    </div>
</body>
</html>

