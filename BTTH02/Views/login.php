<?php
include_once 'Controllers/loginController.php';
$loginController = new LoginController();
$loginController->login();
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="assets/css/login.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Đăng nhập</title>
</head>
<body>
<div class="container">
    <div class="modal modal-sheet d-block bg-body-secondary p-4 py-md-5" tabindex="-1" role="dialog"
         id="modalSignin">
        <div class="modal-dialog" role="document">
            <div class="modal-content rounded-4 shadow">
                <div class="modal-header p-5 pb-4 border-bottom-0">
                    <h1 class="fw-bold mb-0 fs-2">Đăng nhập tài khoản</h1>
                </div>

                <div class="modal-body p-5 pt-0">
                <form action="Views/index.php" method="POST">
                    <div class="form-group">
                        <label for="username">Email tài khoản:</label>
                        <input type="email" id="floatingInput" placeholder="name@example.com" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu:</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <div class="form-group">
                        <button type="submit" >
                            Đăng nhập
                        </button>
                        </button>
                    </div>
                    <hr class="my-4">
                    <form action="">
                        <button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" type="submit">
                            Bạn quên tên đăng nhập/mật khẩu?
                        </button>
                    </form>

                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>


