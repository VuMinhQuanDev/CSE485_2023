<?php
include('src/studentDao.php');
?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student management</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>


    <body>
        <div class="container">
            <table class="table">
                <h2>Student management</h2>
                <button><a href="readFile.php">Add Student</a></button>
                <br><br>
                <thead>
                    <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Grade</th>
                    </tr>
                </thead>

                <tbody>
                    <?php
                        include('src/readfile.php');
                    ?>
                </tbody>
            </table>
        </div>
    </body>
</html>