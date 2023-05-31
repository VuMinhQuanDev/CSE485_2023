<?php
include_once '../config/connectDB.php';

class LoginController
{
    public function login()
    {
        $pdo = new ConnectDatabase();
        if (isset($_POST['btnLogin'])) {
            $email = trim($_POST['email']);
            $password = trim($_POST['password']);
            try {
                $conn = $pdo->getConnection();
                if (empty($email) || empty($password)) {
                    echo "<script>alert('Làm ơn điền email/mật khẩu!');</script>";
                    exit();
                }
                $sql = "SELECT * FROM users WHERE email = ? AND password = ?";
                $stmt = $conn->prepare($sql);
                $stmt->execute([$email, $password]);
                session_start();
                if ($stmt->rowCount() == 1) {
                    $user = $stmt->fetch(PDO::FETCH_ASSOC);
                    $_SESSION['user_id'] = $user['id'];
                    $_SESSION['user_email'] = $user['email'];
                    header("Location:index.php");
                } else {
                    echo "<script>alert('Email hoặc mật khẩu không tồn tại!');</script>";
                }
            } catch (Exception $e) {
                echo 'Error: ' . $e->getMessage();
            }
        }
    }
}

?>
