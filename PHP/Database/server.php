<?php
    $mysql = mysqli_connect(
        'localhost',
        'root',
        '',
        'jmv_pass'
    );
    if (mysqli_connect_errno()) {
        die('Connection failed');
    }

    session_start();
    $username = "";
    $email = "";
    $_SESSION['success'] = "";
    $errors = array();

    if (isset($_POST['login'])) {
        $username = mysqli_real_escape_string($mysql, $_POST['username']);
        $password = mysqli_real_escape_string($mysql, $_POST['password']);

        if (empty($username)) {
            array_push($errors, "Please enter your username");
        }
        if (empty($password)) {
            array_push($errors, "Please enter your password");
        }

        if (count($errors) == 0) {
            if ($stmt = $mysql->prepare("SELECT role FROM `users` WHERE username=? and password=?")) {
                $stmt->bind_param('ss', $username, $password);
                $stmt->execute();
                $stmt->store_result();
                if ($stmt->num_rows == 1) {
                    $_SESSION['username'] = $username;
                    $_SESSION['success'] = "You have logged in";
                    $stmt->bind_result($role);
                    $stmt->fetch();
                    switch ($role) {
                        case 'admin':
                            header('Location: ../admin/index.php');
                            exit();
                        case 'courier':
                            header('Location: ../courier/index.php');
                            exit();
                        case 'client':
                            header('Location: ../client/index.php');
                            exit();
                        case 'operator':
                            header('Location: ../operator/index.php');
                            exit();
                        default:
                            echo 'Wrong';

                    }
                }
                $stmt->close();
            }
        }
    }

